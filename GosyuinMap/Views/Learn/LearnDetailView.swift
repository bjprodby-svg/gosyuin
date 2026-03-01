import SwiftUI

struct LearnDetailView: View {
    let article: GuideArticle

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                content
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private var content: some View {
        switch article.id {
        case "sanpai": sanpaiContent
        case "temizu": temizuContent
        case "omikuji": omikujiContent
        case "gosyuin": gosyuinContent
        default: Text("準備中です")
        }
    }

    // MARK: - 参拝の作法（二礼二拍手一礼）

    private var sanpaiContent: some View {
        VStack(spacing: 40) {
            IllustratedStep(
                number: 1,
                title: "二拝",
                subtitle: "Nihai - Bow Twice",
                emoji: "\u{26E9}\u{FE0F}",
                description: "鳥居の前で一礼してからくぐり、拝殿の前で深く二回お辞儀をします。"
            )

            IllustratedStep(
                number: 2,
                title: "二拍手",
                subtitle: "Nihakushu - Clap Twice",
                emoji: "\u{1F44F}",
                description: "胸の高さで両手を合わせ、右手を少し下にずらしてから二回打ちます。手を合わせたまま心の中でお祈りします。"
            )

            IllustratedStep(
                number: 3,
                title: "一拝",
                subtitle: "Ippai - Bow Once",
                emoji: "\u{1F64F}",
                description: "最後にもう一度深くお辞儀をして、参拝を終えます。"
            )

            noteCard(
                icon: "info.circle.fill", color: .orange,
                title: "神社によって作法が異なります",
                text: "出雲大社は「二礼四拍手一礼」、伊勢神宮では「八度拝八開手」など、神社ごとに独自の作法があります。参拝前に確認しましょう。"
            )
        }
    }

    // MARK: - 手水の作法

    private var temizuContent: some View {
        VStack(spacing: 40) {
            IllustratedStep(
                number: 1,
                title: "左手を洗う",
                subtitle: "Wash Left Hand",
                emoji: "\u{1F4A7}",
                description: "右手で柄杓を持ち、水をすくって左手を洗います。"
            )

            IllustratedStep(
                number: 2,
                title: "右手を洗う",
                subtitle: "Wash Right Hand",
                emoji: "\u{1F4A7}",
                description: "柄杓を左手に持ち替えて、右手を洗います。"
            )

            IllustratedStep(
                number: 3,
                title: "口をすすぐ",
                subtitle: "Rinse Mouth",
                emoji: "\u{1F4A6}",
                description: "右手に持ち替え、左の手のひらに水を受けて口をすすぎます。柄杓に直接口をつけないようにしましょう。"
            )

            IllustratedStep(
                number: 4,
                title: "左手を清める",
                subtitle: "Purify Left Hand",
                emoji: "\u{2728}",
                description: "もう一度左手を洗い清めます。"
            )

            IllustratedStep(
                number: 5,
                title: "柄杓を清める",
                subtitle: "Purify Ladle",
                emoji: "\u{1FAA3}",
                description: "柄杓を立てて残りの水で柄の部分を洗い流し、元の位置に戻します。"
            )
        }
    }

    // MARK: - おみくじの引き方

    private var omikujiContent: some View {
        VStack(spacing: 40) {
            IllustratedStep(
                number: 1,
                title: "初穂料を納める",
                subtitle: "Pay the Fee",
                emoji: "\u{1FA99}",
                description: "おみくじの料金（通常100〜200円）を納めます。"
            )

            IllustratedStep(
                number: 2,
                title: "心を込めて引く",
                subtitle: "Draw with Sincerity",
                emoji: "\u{2728}",
                description: "願い事を心に思い浮かべながらおみくじを引きます。"
            )

            IllustratedStep(
                number: 3,
                title: "内容をよく読む",
                subtitle: "Read Carefully",
                emoji: "\u{1F4DC}",
                description: "吉凶だけでなく、各項目の助言もしっかり読みましょう。"
            )

            IllustratedStep(
                number: 4,
                title: "結ぶか持ち帰る",
                subtitle: "Tie or Keep",
                emoji: "\u{1F38B}",
                description: "凶のおみくじは境内の指定場所に結びます。吉は持ち帰ってお守りにしても良いでしょう。"
            )

            noteCard(
                icon: "list.number",
                color: Color(red: 0.60, green: 0.40, blue: 0.15),
                title: "おみくじの順位",
                text: "大吉 → 吉 → 中吉 → 小吉 → 末吉 → 凶 → 大凶。神社によって順位が異なる場合もあります。"
            )
        }
    }

    // MARK: - 御朱印のいただき方

    private var gosyuinContent: some View {
        VStack(spacing: 40) {
            IllustratedStep(
                number: 1,
                title: "御朱印帳を用意",
                subtitle: "Prepare Stamp Book",
                emoji: "\u{1F4D5}",
                description: "専用の御朱印帳を準備しましょう。ノートやメモ帳は避けます。"
            )

            IllustratedStep(
                number: 2,
                title: "先に参拝する",
                subtitle: "Worship First",
                emoji: "\u{1F64F}",
                description: "御朱印は参拝の証。必ず先に参拝を済ませましょう。"
            )

            IllustratedStep(
                number: 3,
                title: "社務所へ",
                subtitle: "Visit the Office",
                emoji: "\u{1F3EC}",
                description: "受付で御朱印帳を開いて渡し、「御朱印をお願いします」と伝えます。"
            )

            IllustratedStep(
                number: 4,
                title: "初穂料を納める",
                subtitle: "Pay Offering",
                emoji: "\u{1FA99}",
                description: "300〜500円程度。お釣りのないよう小銭を用意しましょう。"
            )

            IllustratedStep(
                number: 5,
                title: "感謝して受け取る",
                subtitle: "Receive with Thanks",
                emoji: "\u{1F64C}",
                description: "両手で御朱印帳を受け取り、お礼を述べましょう。"
            )
        }
    }

    // MARK: - Note Card

    private func noteCard(icon: String, color: Color, title: String, text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.bodyText)
                Text(text)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.08), in: RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Illustrated Step

private struct IllustratedStep: View {
    let number: Int
    let title: String
    let subtitle: String
    let emoji: String
    let description: String

    var body: some View {
        VStack(spacing: 12) {
            // Step Number + Title
            Text("\(number). \(title) (\(subtitle))")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            // Large Emoji Illustration
            Text(emoji)
                .font(.system(size: 80))
                .frame(height: 100)
                .frame(maxWidth: .infinity)

            // Description
            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    NavigationStack {
        LearnDetailView(article: GuideArticle.allArticles[0])
    }
}
