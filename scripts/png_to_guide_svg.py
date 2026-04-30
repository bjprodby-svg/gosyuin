#!/usr/bin/env python3
"""
ChatGPT が生成した黒シルエット PNG を、Asset Catalog 用の clean な
template-rendering SVG (viewBox 64x64, fill=currentColor) に変換する。

Usage:
  python3 png_to_guide_svg.py <input.png> <slot> [--threshold N]

  <slot> は guide_types / guide_sanpai / guide_temple / guide_temizu /
          guide_gosyuin / guide_omikuji / guide_manners のいずれか
  --threshold は 2 値化しきい値 (0-255, default 180)

出力先:
  GosyuinMap/Assets.xcassets/GuideIcons/<slot>.imageset/icon.svg
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

import numpy as np
from PIL import Image, ImageOps
import potrace


REPO_ROOT = Path(__file__).resolve().parent.parent
ASSET_DIR = REPO_ROOT / "GosyuinMap" / "Assets.xcassets" / "GuideIcons"
VALID_SLOTS = {
    "guide_types",
    "guide_sanpai",
    "guide_temple",
    "guide_temizu",
    "guide_gosyuin",
    "guide_omikuji",
    "guide_manners",
}


def load_and_binarize(path: Path, threshold: int) -> tuple[np.ndarray, tuple[int, int]]:
    """PNG -> alpha-aware binarized bitmap. Black silhouette (1) on white (0)."""
    img = Image.open(path).convert("RGBA")

    # Composite onto white so transparent backgrounds become white
    bg = Image.new("RGBA", img.size, (255, 255, 255, 255))
    img = Image.alpha_composite(bg, img).convert("L")

    # Trim to bounding box of non-near-white pixels
    arr_full = np.array(img)
    dark_mask = arr_full < threshold
    if dark_mask.any():
        ys, xs = np.where(dark_mask)
        top, bottom = ys.min(), ys.max() + 1
        left, right = xs.min(), xs.max() + 1
        # Add small padding around bbox so the trace doesn't clip edges
        pad = max(2, int(0.04 * max(bottom - top, right - left)))
        top = max(0, top - pad)
        left = max(0, left - pad)
        bottom = min(arr_full.shape[0], bottom + pad)
        right = min(arr_full.shape[1], right + pad)
        img = img.crop((left, top, right, bottom))

    # Binarize: dark pixels -> True (foreground). potrace expects a bool ndarray;
    # passing uint32 makes it treat the whole bitmap as one object.
    arr = np.array(img)
    binary = arr < threshold

    return binary, img.size


def trace_to_paths(binary: np.ndarray) -> potrace.Path:
    """Run potrace; return Path object."""
    bmp = potrace.Bitmap(binary)
    return bmp.trace(
        turdsize=4,
        turnpolicy=potrace.POTRACE_TURNPOLICY_MINORITY,
        alphamax=1.0,
        opticurve=1,
        opttolerance=0.2,
    )


def path_to_svg_d(path: potrace.Path, sx: float, sy: float) -> str:
    """Translate potrace Path into a single SVG path 'd' attribute."""
    out: list[str] = []
    for curve in path:
        start = curve.start_point
        out.append(f"M {start.x * sx:.3f} {start.y * sy:.3f}")
        for seg in curve.segments:
            if seg.is_corner:
                c = seg.c
                e = seg.end_point
                out.append(f"L {c.x * sx:.3f} {c.y * sy:.3f}")
                out.append(f"L {e.x * sx:.3f} {e.y * sy:.3f}")
            else:
                c1 = seg.c1
                c2 = seg.c2
                e = seg.end_point
                out.append(
                    f"C {c1.x * sx:.3f} {c1.y * sy:.3f} "
                    f"{c2.x * sx:.3f} {c2.y * sy:.3f} "
                    f"{e.x * sx:.3f} {e.y * sy:.3f}"
                )
        out.append("Z")
    return " ".join(out)


def make_svg(d: str) -> str:
    return (
        '<svg xmlns="http://www.w3.org/2000/svg" '
        'viewBox="0 0 64 64" width="64" height="64">\n'
        f'  <path d="{d}" fill="currentColor" fill-rule="evenodd"/>\n'
        '</svg>\n'
    )


def convert(png_path: Path, slot: str, threshold: int) -> Path:
    if slot not in VALID_SLOTS:
        raise SystemExit(f"slot must be one of {sorted(VALID_SLOTS)}; got {slot!r}")

    binary, (w, h) = load_and_binarize(png_path, threshold)
    if not binary.any():
        raise SystemExit(f"{png_path}: no dark pixels detected — try lowering --threshold")

    path = trace_to_paths(binary)

    # Scale into 64x64 viewBox while preserving aspect ratio + centering
    src_h, src_w = binary.shape
    scale = 64.0 / max(src_w, src_h) * 0.92  # 92% of viewBox, leaves a little margin
    sx = scale
    sy = scale
    d_raw = path_to_svg_d(path, sx, sy)

    # Center the path inside 64x64
    drawn_w = src_w * scale
    drawn_h = src_h * scale
    tx = (64.0 - drawn_w) / 2.0
    ty = (64.0 - drawn_h) / 2.0
    svg = (
        '<svg xmlns="http://www.w3.org/2000/svg" '
        'viewBox="0 0 64 64" width="64" height="64">\n'
        f'  <g transform="translate({tx:.3f} {ty:.3f})">\n'
        f'    <path d="{d_raw}" fill="currentColor" fill-rule="evenodd"/>\n'
        '  </g>\n'
        '</svg>\n'
    )

    out_dir = ASSET_DIR / f"{slot}.imageset"
    out_dir.mkdir(parents=True, exist_ok=True)

    # Make sure Contents.json exists with template-rendering settings
    contents_path = out_dir / "Contents.json"
    if not contents_path.exists():
        contents_path.write_text(
            '{\n'
            '  "images" : [\n'
            '    {\n'
            '      "filename" : "icon.svg",\n'
            '      "idiom" : "universal"\n'
            '    }\n'
            '  ],\n'
            '  "info" : {\n'
            '    "author" : "xcode",\n'
            '    "version" : 1\n'
            '  },\n'
            '  "properties" : {\n'
            '    "preserves-vector-representation" : true,\n'
            '    "template-rendering-intent" : "template"\n'
            '  }\n'
            '}\n'
        )

    out_svg = out_dir / "icon.svg"
    out_svg.write_text(svg)
    return out_svg


def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("png", type=Path)
    p.add_argument("slot")
    p.add_argument("--threshold", type=int, default=180)
    args = p.parse_args()

    out = convert(args.png, args.slot, args.threshold)
    print(f"wrote {out}")


if __name__ == "__main__":
    main()
