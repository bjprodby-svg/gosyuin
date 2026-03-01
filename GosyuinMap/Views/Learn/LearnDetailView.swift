import SwiftUI

struct LearnDetailView: View {
    let article: GuideArticle
    @State private var appeared = false

    var body: some View {
        ScrollView {
            VStack(spacing: DS.Spacing.xxl) {
                content
            }
            .padding(DS.Spacing.lg)
        }
        .background(Color.pageBackground)
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                appeared = true
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch article.id {
        case "types": typesContent
        case "sanpai": sanpaiContent
        case "temizu": temizuContent
        case "omikuji": omikujiContent
        case "gosyuin": gosyuinContent
        default: Text("Coming soon")
        }
    }

    // MARK: - Shrine & Temple Types

    private var typesContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            noteCard(
                icon: "info.circle.fill", color: article.color,
                title: "Shinto vs Buddhism",
                text: "Japan has two major religions: Shinto (shrines) and Buddhism (temples). Many sacred sites blend both traditions, but their naming tells you their origin."
            )

            typeCard(
                emoji: "\u{26E9}\u{FE0F}",
                name: "Jinja (Shrine)",
                japanese: "神社",
                description: "The most common Shinto sacred place. Dedicated to kami (gods/spirits) of nature, ancestors, or local guardians. Recognized by torii gates at the entrance.",
                examples: "Meiji Jingu, Fushimi Inari Taisha",
                delay: 0
            )

            typeCard(
                emoji: "\u{1F3EF}",
                name: "Tera / Ji (Temple)",
                japanese: "寺",
                description: "A Buddhist place of worship. Home to Buddha statues, monks, and cemeteries. You'll find incense burners and a main hall (hondo) instead of torii gates.",
                examples: "Senso-ji, Kiyomizu-dera, Todai-ji",
                delay: 0.08
            )

            typeCard(
                emoji: "\u{1F451}",
                name: "Jingu (Grand Shrine)",
                japanese: "神宮",
                description: "A prestigious shrine with direct ties to the Imperial family or enshrining major deities. The title 'Jingu' is reserved for the highest-ranking shrines.",
                examples: "Ise Jingu, Meiji Jingu, Atsuta Jingu",
                delay: 0.16
            )

            typeCard(
                emoji: "\u{26F0}\u{FE0F}",
                name: "Taisha (Grand Shrine)",
                japanese: "大社",
                description: "Originally referred only to Izumo Taisha, but now designates shrines that head a network of branch shrines across Japan.",
                examples: "Izumo Taisha, Fushimi Inari Taisha, Kasuga Taisha",
                delay: 0.24
            )

            typeCard(
                emoji: "\u{1F393}",
                name: "Tenmangu",
                japanese: "天満宮",
                description: "Shrines dedicated to Sugawara no Michizane, the deified patron of learning. Students flock here before exams to pray for academic success.",
                examples: "Dazaifu Tenmangu, Kitano Tenmangu, Yushima Tenmangu",
                delay: 0.32
            )

            typeCard(
                emoji: "\u{1F525}",
                name: "Inari Shrine",
                japanese: "稲荷神社",
                description: "Shrines dedicated to Inari, the god of rice, fertility, and business prosperity. Famous for tunnels of vermillion torii gates and fox (kitsune) guardian statues.",
                examples: "Fushimi Inari Taisha, Toyokawa Inari",
                delay: 0.40
            )

            noteCard(
                icon: "lightbulb.fill", color: .orange,
                title: "Quick Tip",
                text: "Look at the name ending: -jinja/-jingu/-taisha = Shinto shrine. -ji/-dera/-in = Buddhist temple. Some places like Senso-ji have both a temple and a shrine on the same grounds!"
            )
        }
    }

    private func typeCard(
        emoji: String, name: String, japanese: String,
        description: String, examples: String, delay: Double
    ) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Text(emoji)
                    .font(.system(size: 32))

                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.headline)
                    Text(japanese)
                        .font(.caption)
                        .foregroundStyle(article.color)
                }
                Spacer()
            }

            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)

            HStack(spacing: DS.Spacing.xs) {
                Image(systemName: "mappin.circle.fill")
                    .font(.caption)
                    .foregroundStyle(article.color)
                Text(examples)
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
        }
        .cardStyle()
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 16)
        .animation(
            .spring(duration: 0.5, bounce: 0.2).delay(delay),
            value: appeared
        )
    }

    // MARK: - Worship Etiquette

    private var sanpaiContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            illustratedStep(
                number: 1, title: "Bow Twice", subtitle: "Nihai",
                emoji: "\u{26E9}\u{FE0F}",
                description: "Bow once before passing through the torii gate, then bow deeply twice in front of the main hall.",
                delay: 0
            )
            illustratedStep(
                number: 2, title: "Clap Twice", subtitle: "Nihakushu",
                emoji: "\u{1F44F}",
                description: "Bring your hands together at chest height, offset your right hand slightly downward, and clap twice. Keep your hands together and pray silently.",
                delay: 0.1
            )
            illustratedStep(
                number: 3, title: "Bow Once", subtitle: "Ippai",
                emoji: "\u{1F64F}",
                description: "Finish with one final deep bow to complete your worship.",
                delay: 0.2
            )

            noteCard(
                icon: "info.circle.fill", color: .orange,
                title: "Customs vary by shrine",
                text: "Izumo Taisha uses 'two bows, four claps, one bow', while Ise Jingu has its own unique ritual. Always check the shrine's specific etiquette before visiting."
            )
        }
    }

    // MARK: - Temizu Purification

    private var temizuContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            illustratedStep(number: 1, title: "Wash Left Hand", subtitle: "Step 1", emoji: "\u{1F4A7}",
                description: "Hold the ladle in your right hand, scoop water, and rinse your left hand.", delay: 0)
            illustratedStep(number: 2, title: "Wash Right Hand", subtitle: "Step 2", emoji: "\u{1F4A7}",
                description: "Switch the ladle to your left hand and rinse your right hand.", delay: 0.1)
            illustratedStep(number: 3, title: "Rinse Mouth", subtitle: "Step 3", emoji: "\u{1F4A6}",
                description: "Switch back to your right hand, pour water into your cupped left palm, and rinse your mouth. Never touch the ladle directly to your lips.", delay: 0.2)
            illustratedStep(number: 4, title: "Purify Left Hand", subtitle: "Step 4", emoji: "\u{2728}",
                description: "Rinse your left hand one more time to purify it.", delay: 0.3)
            illustratedStep(number: 5, title: "Purify the Ladle", subtitle: "Step 5", emoji: "\u{1FAA3}",
                description: "Tilt the ladle upright so the remaining water runs down the handle, then return it to its place.", delay: 0.4)
        }
    }

    // MARK: - Omikuji Fortune

    private var omikujiContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            illustratedStep(number: 1, title: "Pay the Fee", subtitle: "Step 1", emoji: "\u{1FA99}",
                description: "Pay the omikuji fee, usually 100-200 yen.", delay: 0)
            illustratedStep(number: 2, title: "Draw with Sincerity", subtitle: "Step 2", emoji: "\u{2728}",
                description: "Hold your wish in your heart as you draw your fortune.", delay: 0.1)
            illustratedStep(number: 3, title: "Read Carefully", subtitle: "Step 3", emoji: "\u{1F4DC}",
                description: "Don't just check the overall fortune — read the advice in each section carefully.", delay: 0.2)
            illustratedStep(number: 4, title: "Tie or Keep", subtitle: "Step 4", emoji: "\u{1F38B}",
                description: "Tie bad fortunes at the designated spot in the shrine grounds. Good fortunes can be kept as a lucky charm.", delay: 0.3)

            noteCard(
                icon: "list.number", color: Color.kincha,
                title: "Fortune Rankings",
                text: "Great Blessing > Blessing > Medium Blessing > Small Blessing > Future Blessing > Curse > Great Curse. Rankings may vary by shrine."
            )
        }
    }

    // MARK: - Gosyuin Stamps

    private var gosyuinContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            illustratedStep(number: 1, title: "Prepare Your Book", subtitle: "Step 1", emoji: "\u{1F4D5}",
                description: "Get a proper gosyuin-cho (stamp book). Regular notebooks are not appropriate.", delay: 0)
            illustratedStep(number: 2, title: "Worship First", subtitle: "Step 2", emoji: "\u{1F64F}",
                description: "Gosyuin are proof of worship. Always complete your prayers before requesting one.", delay: 0.1)
            illustratedStep(number: 3, title: "Visit the Office", subtitle: "Step 3", emoji: "\u{1F3EC}",
                description: "Open your stamp book to the correct page and hand it to the staff. Say 'Gosyuin o onegai shimasu' (I'd like a gosyuin, please).", delay: 0.2)
            illustratedStep(number: 4, title: "Pay the Offering", subtitle: "Step 4", emoji: "\u{1FA99}",
                description: "The fee is typically 300-500 yen. Have exact change ready to be polite.", delay: 0.3)
            illustratedStep(number: 5, title: "Receive with Thanks", subtitle: "Step 5", emoji: "\u{1F64C}",
                description: "Accept your stamp book back with both hands and express your gratitude.", delay: 0.4)
        }
    }

    // MARK: - Illustrated Step

    private func illustratedStep(
        number: Int, title: String, subtitle: String,
        emoji: String, description: String, delay: Double
    ) -> some View {
        VStack(spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Text("\(number)")
                    .font(.caption.bold())
                    .foregroundStyle(.white)
                    .frame(width: 22, height: 22)
                    .background(article.color, in: Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(article.color)
                }
                Spacer()
            }

            Text(emoji)
                .font(.system(size: 72))
                .frame(height: 90)
                .frame(maxWidth: .infinity)

            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .cardStyle()
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 16)
        .animation(
            .spring(duration: 0.5, bounce: 0.2).delay(delay),
            value: appeared
        )
    }

    // MARK: - Note Card

    private func noteCard(icon: String, color: Color, title: String, text: String) -> some View {
        HStack(alignment: .top, spacing: DS.Spacing.md) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                Text(title)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Color.bodyText)
                Text(text)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .accentedCard(accentColor: color)
    }
}

#Preview {
    NavigationStack {
        LearnDetailView(article: GuideArticle.allArticles[0])
    }
}
