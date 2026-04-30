"""
Replace the cream background in type_*.png with transparent.

Strategy: flood fill from the four corners with color tolerance, marking
all connected cream-region pixels as transparent. This preserves any
internal cream-toned shading inside the illustration (e.g. door lintel,
shoji panel) which is NOT connected to the outer background.
"""

from PIL import Image
import numpy as np
from collections import deque
from pathlib import Path


def make_bg_transparent(src: Path, dst: Path, tolerance: int = 22):
    img = Image.open(src).convert("RGBA")
    arr = np.array(img)
    h, w, _ = arr.shape

    # Sample corner colors to get representative background color
    corners = [arr[0, 0], arr[0, w - 1], arr[h - 1, 0], arr[h - 1, w - 1]]
    bg_rgb = np.median([c[:3] for c in corners], axis=0).astype(np.int32)

    # Build a mask of "background-like" pixels (within tolerance of bg_rgb)
    diff = np.abs(arr[:, :, :3].astype(np.int32) - bg_rgb).max(axis=2)
    bg_like = diff <= tolerance

    # Flood-fill from edges to find pixels connected to the boundary
    visited = np.zeros((h, w), dtype=bool)
    q = deque()

    for x in range(w):
        for y in (0, h - 1):
            if bg_like[y, x] and not visited[y, x]:
                q.append((y, x))
                visited[y, x] = True
    for y in range(h):
        for x in (0, w - 1):
            if bg_like[y, x] and not visited[y, x]:
                q.append((y, x))
                visited[y, x] = True

    # 4-connected flood fill
    while q:
        y, x = q.popleft()
        for dy, dx in ((-1, 0), (1, 0), (0, -1), (0, 1)):
            ny, nx = y + dy, x + dx
            if 0 <= ny < h and 0 <= nx < w and not visited[ny, nx] and bg_like[ny, nx]:
                visited[ny, nx] = True
                q.append((ny, nx))

    # For pixels close to the boundary cream that are partially-cream
    # (anti-aliased edges of the subject), do a soft alpha based on
    # how close the pixel is to the bg color.
    out = arr.copy()
    bg_mask = visited

    # Hard set fully-bg pixels to transparent
    out[bg_mask, 3] = 0

    # Soft edge: pixels not in bg_mask but with diff between tolerance and
    # tolerance*2 get partial transparency (anti-aliased subject edges).
    edge_band = (diff > tolerance) & (diff <= tolerance * 2) & (~bg_mask)
    # Find edge pixels adjacent to bg_mask
    from scipy.ndimage import binary_dilation
    near_bg = binary_dilation(bg_mask, iterations=2) & ~bg_mask
    soft = edge_band & near_bg
    if soft.any():
        # Map diff in [tol, tol*2] to alpha in [0.4, 1.0]
        d = diff[soft].astype(np.float32)
        alpha = 0.4 + 0.6 * ((d - tolerance) / tolerance)
        alpha = np.clip(alpha, 0.4, 1.0)
        out[soft, 3] = (alpha * 255).astype(np.uint8)

    Image.fromarray(out, "RGBA").save(dst, "PNG")
    cleared = bg_mask.sum()
    total = h * w
    print(f"{src.name}: cleared {cleared}/{total} pixels ({100 * cleared / total:.1f}%)")


def main():
    types = ["jinja", "tera", "jingu", "taisha", "tenmangu", "inari", "hachimangu", "daishi"]
    asset_root = Path("/sessions/brave-determined-maxwell/mnt/gosyuin/GosyuinMap/Assets.xcassets/TypeIllustrations")
    backup_root = Path("/sessions/brave-determined-maxwell/mnt/gosyuin/wave2d-output/regen_named")

    for t in types:
        asset_png = asset_root / f"type_{t}.imageset" / "illustration.png"
        backup_png = backup_root / f"type_{t}.png"
        if not asset_png.exists():
            print(f"missing: {asset_png}")
            continue
        # In-place: overwrite both
        make_bg_transparent(asset_png, asset_png)
        make_bg_transparent(backup_png, backup_png)


if __name__ == "__main__":
    main()
