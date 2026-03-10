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
        case "temple": templeContent
        case "temizu": temizuContent
        case "omikuji": omikujiContent
        case "gosyuin": gosyuinContent
        case "manners": mannersContent
        default: Text("Coming soon")
        }
    }

    // MARK: - Shrine & Temple Types

    private var typesContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            noteCard(
                icon: "info.circle.fill", color: article.color,
                title: "Shinto vs Buddhism",
                text: "Japan has two major religions: Shinto (shrines) and Buddhism (temples). Many sacred sites blend both traditions. The name ending tells you which: -jinja/-jingu/-taisha = Shinto shrine, -ji/-dera/-in = Buddhist temple."
            )

            typeCard(emoji: "⛩️", name: "Jinja (Shrine)", japanese: "神社",
                     description: "The most common Shinto sacred place. Dedicated to kami (gods/spirits) of nature, ancestors, or local guardians. Recognized by torii gates at the entrance.",
                     examples: "Meiji Jingu, Fushimi Inari Taisha", delay: 0)

            typeCard(emoji: "🏯", name: "Tera / Ji (Temple)", japanese: "寺",
                     description: "A Buddhist place of worship. Home to Buddha statues, monks, and cemeteries. You'll find incense burners and a main hall (hondo) instead of torii gates.",
                     examples: "Senso-ji, Kiyomizu-dera, Todai-ji", delay: 0.08)

            typeCard(emoji: "👑", name: "Jingu (Grand Shrine)", japanese: "神宮",
                     description: "A prestigious shrine with direct ties to the Imperial family or enshrining major deities. The title 'Jingu' is reserved for the highest-ranking shrines.",
                     examples: "Ise Jingu, Meiji Jingu, Atsuta Jingu", delay: 0.16)

            typeCard(emoji: "⛰️", name: "Taisha (Grand Shrine)", japanese: "大社",
                     description: "Originally referred only to Izumo Taisha, but now designates shrines that head a network of branch shrines across Japan.",
                     examples: "Izumo Taisha, Fushimi Inari Taisha, Kasuga Taisha", delay: 0.24)

            typeCard(emoji: "🎓", name: "Tenmangu", japanese: "天満宮",
                     description: "Shrines dedicated to Sugawara no Michizane, the deified patron of learning. Students flock here before exams to pray for academic success. Look for plum blossom motifs.",
                     examples: "Dazaifu Tenmangu, Kitano Tenmangu", delay: 0.32)

            typeCard(emoji: "🦊", name: "Inari Shrine", japanese: "稲荷神社",
                     description: "Shrines dedicated to Inari, the god of rice, fertility, and business prosperity. Famous for tunnels of vermillion torii gates and fox (kitsune) guardian statues.",
                     examples: "Fushimi Inari Taisha, Toyokawa Inari", delay: 0.40)

            typeCard(emoji: "🕊️", name: "Hachimangu", japanese: "八幡宮",
                     description: "Shrines dedicated to Hachiman, the god of war and archery. Originally associated with the Imperial household and samurai warriors. Look for dove motifs.",
                     examples: "Tsurugaoka Hachimangu, Usa Jingu", delay: 0.48)

            noteCard(icon: "lightbulb.fill", color: .orange, title: "Quick Tip",
                     text: "Some places like Senso-ji have both a temple and a shrine on the same grounds! Also, 'o-tera' (お寺) is the polite way to say temple.")
        }
    }

    // MARK: - Shrine Worship (参拝)

    private var sanpaiContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            noteCard(icon: "info.circle.fill", color: article.color, title: "二礼二拍手一礼",
                     text: "The standard Shinto prayer at shrines is 'Nirei Nihakushu Ichirei' — two bows, two claps, one bow. Always purify at the temizuya first.")

            illustratedStep(
                number: 1, title: "Approach & Bow at the Torii", subtitle: "鳥居をくぐる",
                illustration: AnyView(ToriiGateIllustration(color: article.color)),
                description: "Bow slightly before passing through the torii gate. Walk along the sides of the path (参道), not the center — the center is reserved for the kami.",
                delay: 0
            )

            illustratedStep(
                number: 2, title: "Toss a Coin (Osaisen)", subtitle: "お賽銭",
                illustration: AnyView(CoinOfferingIllustration(color: article.color)),
                description: "Toss a coin gently into the offering box. A 5-yen coin (五円 = ご縁, meaning 'good connection') is considered auspicious. The amount doesn't matter — it's a gesture of gratitude.",
                delay: 0.08
            )

            illustratedStep(
                number: 3, title: "Ring the Bell", subtitle: "鈴を鳴らす",
                illustration: nil,
                description: "If there is a bell rope (鈴緒), ring it 2-3 times to announce your presence to the kami. Grip the rope firmly and shake.",
                delay: 0.12
            )

            illustratedStep(
                number: 4, title: "Two Deep Bows", subtitle: "二礼（にれい）",
                illustration: AnyView(BowIllustration(color: article.color, bowCount: 2)),
                description: "Bow deeply twice at approximately 90 degrees with your hands at your sides. These bows express deep respect to the deity.",
                delay: 0.16
            )

            illustratedStep(
                number: 5, title: "Two Claps", subtitle: "二拍手（にはくしゅ）",
                illustration: AnyView(ClapIllustration(color: article.color)),
                description: "Bring your hands together at chest height, offset your right hand slightly below your left. Clap twice firmly to summon the kami's attention. Keep your hands pressed together and pray silently.",
                delay: 0.20
            )

            illustratedStep(
                number: 6, title: "One Final Bow", subtitle: "一礼（いちれい）",
                illustration: AnyView(PrayerHandsIllustration(color: article.color)),
                description: "Lower your hands and bow deeply once more to complete the worship.",
                delay: 0.24
            )

            noteCard(icon: "exclamationmark.triangle.fill", color: .orange, title: "Exceptions",
                     text: "Izumo Taisha uses 2 bows, 4 claps, 1 bow. Ise Jingu has its own variation: 8 deep bows by priests. Always check posted instructions at each shrine.")
        }
    }

    // MARK: - Temple Worship

    private var templeContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            noteCard(icon: "exclamationmark.triangle.fill", color: article.color, title: "Key Difference",
                     text: "The most important difference: DO NOT clap at temples. Clapping (柏手) is a Shinto practice. At Buddhist temples, simply press your palms together silently (合掌/gasshō).")

            illustratedStep(
                number: 1, title: "Bow at the Gate", subtitle: "山門で一礼",
                illustration: nil,
                description: "Bow once when passing through the temple gate (山門/sanmon). Step over the threshold with your left foot — avoid stepping on it.",
                delay: 0
            )

            illustratedStep(
                number: 2, title: "Incense (Optional)", subtitle: "お香・線香",
                illustration: AnyView(IncenseIllustration(color: article.color)),
                description: "If there's an incense burner (常香炉), light incense and fan the smoke toward yourself — it's believed to have healing properties. Never light your incense from someone else's burning incense, as this is said to transfer their impurities.",
                delay: 0.08
            )

            illustratedStep(
                number: 3, title: "Toss a Coin", subtitle: "お賽銭を入れる",
                illustration: AnyView(CoinOfferingIllustration(color: article.color)),
                description: "Gently toss a coin into the offering box, just like at shrines.",
                delay: 0.12
            )

            illustratedStep(
                number: 4, title: "Ring the Bell", subtitle: "鰐口を鳴らす",
                illustration: nil,
                description: "If available, ring the bell (鰐口/waniguchi) or strike the gong before praying.",
                delay: 0.16
            )

            illustratedStep(
                number: 5, title: "Press Palms Together & Pray", subtitle: "合掌して祈る",
                illustration: AnyView(PrayerHandsIllustration(color: article.color)),
                description: "Place your palms together (合掌/gasshō) at chest level, close your eyes, and bow slightly while praying silently. Do NOT clap — this is the crucial difference from shrines.",
                delay: 0.20
            )

            illustratedStep(
                number: 6, title: "Bow Once", subtitle: "一礼",
                illustration: nil,
                description: "Finish with a single bow and quietly step back.",
                delay: 0.24
            )

            noteCard(icon: "lightbulb.fill", color: .orange, title: "Shrine vs Temple Quick Check",
                     text: "Shrine (神社): torii gates, clap twice, kami spirits.\nTemple (寺): sanmon gate, NO clapping, Buddha statues, incense.")
        }
    }

    // MARK: - Temizu Purification

    private var temizuContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            noteCard(icon: "info.circle.fill", color: article.color, title: "One Scoop Only",
                     text: "The entire purification must be completed with a single scoop of water. This symbolizes efficiency and respect for shared resources. Never let used water drip back into the basin.")

            illustratedStep(
                number: 1, title: "Pick Up the Ladle", subtitle: "柄杓を持つ",
                illustration: AnyView(TemizuIllustration(color: article.color, step: 1)),
                description: "Approach the temizuya (手水舎) and bow slightly. Hold the ladle (柄杓/hishaku) in your right hand and scoop a full ladle of water.",
                delay: 0
            )

            illustratedStep(
                number: 2, title: "Wash Left Hand", subtitle: "左手を洗う",
                illustration: AnyView(TemizuIllustration(color: article.color, step: 1)),
                description: "Pour water over your left hand to purify it. The left hand is washed first as it is considered closer to the heart.",
                delay: 0.07
            )

            illustratedStep(
                number: 3, title: "Wash Right Hand", subtitle: "右手を洗う",
                illustration: AnyView(TemizuIllustration(color: article.color, step: 2)),
                description: "Switch the ladle to your left hand and pour water over your right hand.",
                delay: 0.14
            )

            illustratedStep(
                number: 4, title: "Rinse Mouth", subtitle: "口をすすぐ",
                illustration: AnyView(TemizuIllustration(color: article.color, step: 3)),
                description: "Switch back to your right hand. Pour a small amount of water into your cupped left palm. Use that water to rinse your mouth — do NOT drink from the ladle. Spit the water discreetly, covering your mouth.",
                delay: 0.21
            )

            illustratedStep(
                number: 5, title: "Rinse Left Hand Again", subtitle: "左手をもう一度",
                illustration: AnyView(TemizuIllustration(color: article.color, step: 4)),
                description: "Rinse your left hand one more time to cleanse it after touching your mouth.",
                delay: 0.28
            )

            illustratedStep(
                number: 6, title: "Purify the Ladle", subtitle: "柄杓を清める",
                illustration: AnyView(TemizuIllustration(color: article.color, step: 5)),
                description: "Tilt the ladle vertically so the remaining water runs down the handle, cleansing it for the next person. Return the ladle face-down on the rack.",
                delay: 0.35
            )

            noteCard(icon: "drop.fill", color: article.color, title: "Post-COVID Note",
                     text: "Many temizuya were closed during COVID and some remain inactive. If the ladles are removed, you may see flowing water — simply use your hands directly.")
        }
    }

    // MARK: - Gosyuin Stamps

    private var gosyuinContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            noteCard(icon: "exclamationmark.triangle.fill", color: article.color, title: "Worship First!",
                     text: "Goshuin (御朱印) are proof of worship, not tourist souvenirs. Always complete your prayers before requesting one. Collecting without praying is considered disrespectful.")

            illustratedStep(
                number: 1, title: "Get a Proper Goshuincho", subtitle: "御朱印帳を用意する",
                illustration: AnyView(GoshuinchoIllustration(color: article.color, step: 1)),
                description: "Purchase a goshuincho (御朱印帳) — a special accordion-fold book. Many shrines/temples sell their own unique designs (¥1,000-¥3,000). Regular notebooks are not appropriate.",
                delay: 0
            )

            illustratedStep(
                number: 2, title: "Worship First", subtitle: "先にお参りをする",
                illustration: AnyView(GoshuinchoIllustration(color: article.color, step: 2)),
                description: "Complete your prayers at the main hall before visiting the goshuin counter. At busy locations, you may drop off your book first and pick it up after praying.",
                delay: 0.08
            )

            illustratedStep(
                number: 3, title: "Request at the Counter", subtitle: "御朱印所で依頼する",
                illustration: AnyView(GoshuinchoIllustration(color: article.color, step: 3)),
                description: "Go to the goshuin counter (御朱印所 or 授与所). Open your book to the correct page and say: 「御朱印をお願いします」(Goshuin o onegai shimasu). Do not rush or peek while the calligrapher is writing.",
                delay: 0.16
            )

            illustratedStep(
                number: 4, title: "Pay the Offering", subtitle: "初穂料・志納金を納める",
                illustration: AnyView(GoshuinchoIllustration(color: article.color, step: 4)),
                description: "Standard fee: ¥300-¥500. Special/seasonal editions: ¥1,000-¥1,500. Have exact change ready — shrines/temples are often not equipped to make change.",
                delay: 0.24
            )

            illustratedStep(
                number: 5, title: "Receive with Gratitude", subtitle: "感謝を込めて受け取る",
                illustration: AnyView(GoshuinchoIllustration(color: article.color, step: 5)),
                description: "Accept your book back with both hands and express gratitude. Treat your goshuincho as a sacred object — store it respectfully, not tossed in a bag.",
                delay: 0.32
            )

            noteCard(icon: "clock.fill", color: .orange, title: "Timing",
                     text: "Goshuin are typically available 9:00 AM to 4:00 PM. Smaller shrines may have limited availability. Avoid requesting too close to closing time.")

            noteCard(icon: "lightbulb.fill", color: article.color, title: "Tips",
                     text: "• Shrine and temple goshuin can go in the same book\n• Don't put tourist stamps or stickers in your goshuincho\n• Use a protective cover (御朱印帳カバー) if possible\n• The book reads right-to-left, like traditional Japanese books")
        }
    }

    // MARK: - Omikuji Fortune

    private var omikujiContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            illustratedStep(
                number: 1, title: "Pay the Fee", subtitle: "代金を納める",
                illustration: AnyView(CoinOfferingIllustration(color: article.color)),
                description: "Pay the omikuji fee (usually ¥100-¥200). At some shrines you'll shake a cylindrical box and draw a numbered stick; at others you simply pick a folded paper.",
                delay: 0
            )

            illustratedStep(
                number: 2, title: "Draw with Sincerity", subtitle: "心を込めて引く",
                illustration: nil,
                description: "Hold your wish or question in your heart as you draw your fortune. Some say you should think of a specific question for a more meaningful reading.",
                delay: 0.1
            )

            illustratedStep(
                number: 3, title: "Read the Full Fortune", subtitle: "隅々まで読む",
                illustration: AnyView(OmikujiIllustration(color: article.color)),
                description: "Don't just check the overall blessing level — read the detailed predictions for health, relationships, business, travel, lost items, and more. The advice sections are often the most valuable part.",
                delay: 0.2
            )

            illustratedStep(
                number: 4, title: "Tie or Keep", subtitle: "結ぶか持ち帰るか",
                illustration: nil,
                description: "Bad fortunes: tie them at the designated rack (結び所) to leave the bad luck behind. Good fortunes: you may keep them as a lucky charm or tie them as an offering to the kami.",
                delay: 0.3
            )

            // Fortune ranking card
            VStack(alignment: .leading, spacing: DS.Spacing.md) {
                HStack(spacing: DS.Spacing.sm) {
                    Image(systemName: "list.number")
                        .font(.caption)
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(article.color, in: Circle())
                    Text("Fortune Rankings")
                        .font(.subheadline.bold())
                }

                VStack(spacing: DS.Spacing.sm) {
                    fortuneRank("大吉", "Great Blessing", Color(red: 0.85, green: 0.20, blue: 0.15), 1.0)
                    fortuneRank("吉", "Blessing", Color(red: 0.85, green: 0.40, blue: 0.15), 0.85)
                    fortuneRank("中吉", "Medium Blessing", Color(red: 0.85, green: 0.55, blue: 0.15), 0.70)
                    fortuneRank("小吉", "Small Blessing", Color(red: 0.75, green: 0.65, blue: 0.15), 0.55)
                    fortuneRank("末吉", "Future Blessing", Color(red: 0.50, green: 0.55, blue: 0.20), 0.40)
                    fortuneRank("凶", "Misfortune", Color(.systemGray), 0.20)
                    fortuneRank("大凶", "Great Misfortune", Color(.systemGray3), 0.10)
                }
            }
            .cardStyle()

            noteCard(icon: "lightbulb.fill", color: .orange, title: "Don't Worry!",
                     text: "Drawing 凶 (misfortune) isn't necessarily bad — it means things can only get better! Tie it at the shrine and the kami will help reverse your luck.")
        }
    }

    private func fortuneRank(_ kanji: String, _ english: String, _ color: Color, _ width: Double) -> some View {
        HStack(spacing: DS.Spacing.md) {
            Text(kanji)
                .font(.system(size: 14, weight: .bold, design: .serif))
                .foregroundStyle(color)
                .frame(width: 36)

            GeometryReader { geo in
                Capsule()
                    .fill(color.gradient)
                    .frame(width: geo.size.width * width)
            }
            .frame(height: 8)

            Text(english)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .fixedSize()
        }
    }

    // MARK: - General Manners

    private var mannersContent: some View {
        VStack(spacing: DS.Spacing.xxl) {
            mannerSection(icon: "tshirt.fill", title: "Dress Code", color: article.color, items: [
                "Dress modestly — avoid tank tops, crop tops, and very short shorts",
                "Shoulders should ideally be covered",
                "Remove hats and sunglasses when praying or inside buildings",
                "Comfortable shoes recommended — some areas require shoe removal",
            ])

            mannerSection(icon: "camera.fill", title: "Photography", color: article.color, items: [
                "Generally permitted on outdoor grounds",
                "Often forbidden inside main halls — look for 撮影禁止 signs",
                "Never use flash photography inside buildings",
                "Do not photograph people praying without permission",
            ])

            mannerSection(icon: "speaker.slash.fill", title: "Behavior", color: article.color, items: [
                "Keep voices low and maintain a respectful atmosphere",
                "Do not eat or drink except in designated areas",
                "Do not touch sacred objects, statues, or shimenawa ropes",
                "Walk on the sides of the approach path, not the center",
            ])

            noteCard(icon: "exclamationmark.triangle.fill", color: .vermillion, title: "Common Mistakes to Avoid",
                     text: "• Clapping at temples (Shinto only!)\n• Walking in the center of the approach path\n• Skipping temizu purification\n• Treating goshuin as tourist stamps\n• Lighting incense from another person's stick\n• Wearing shoes in restricted areas\n• Being loud or rowdy — these are active places of worship")

            mannerSection(icon: "calendar", title: "Seasonal Tips", color: article.color, items: [
                "New Year (初詣): Extremely crowded — expect long queues",
                "Cherry Blossom (3-4月): Beautiful but crowded at scenic locations",
                "Obon (8月): Buddhist period for honoring ancestors",
                "Shichi-Go-San (11/15): Children's festival — expect families in kimono",
            ])
        }
    }

    private func mannerSection(icon: String, title: String, color: Color, items: [String]) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: icon)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(color, in: RoundedRectangle(cornerRadius: 5))
                Text(title)
                    .font(.subheadline.bold())
            }

            VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .top, spacing: DS.Spacing.sm) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(color)
                            .padding(.top, 2)
                        Text(item)
                            .font(.subheadline)
                            .foregroundStyle(Color.bodyText)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .cardStyle()
    }

    // MARK: - Reusable Components

    private func typeCard(
        emoji: String, name: String, japanese: String,
        description: String, examples: String, delay: Double
    ) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Text(emoji).font(.system(size: 32))
                VStack(alignment: .leading, spacing: 2) {
                    Text(name).font(.headline)
                    Text(japanese).font(.caption).foregroundStyle(article.color)
                }
                Spacer()
            }
            Text(description)
                .font(.subheadline).foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            HStack(spacing: DS.Spacing.xs) {
                Image(systemName: "mappin.circle.fill").font(.caption).foregroundStyle(article.color)
                Text(examples).font(.caption).foregroundStyle(.tertiary)
            }
        }
        .cardStyle()
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 16)
        .animation(.spring(duration: 0.5, bounce: 0.2).delay(delay), value: appeared)
    }

    private func illustratedStep(
        number: Int, title: String, subtitle: String,
        illustration: AnyView?, description: String, delay: Double
    ) -> some View {
        VStack(spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Text("\(number)")
                    .font(.caption.bold())
                    .foregroundStyle(.white)
                    .frame(width: 22, height: 22)
                    .background(article.color, in: Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text(title).font(.headline)
                    Text(subtitle).font(.caption).foregroundStyle(article.color)
                }
                Spacer()
            }

            if let illustration {
                illustration
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, DS.Spacing.sm)
                    .background(article.color.opacity(0.04), in: RoundedRectangle(cornerRadius: DS.Radius.md))
            }

            Text(description)
                .font(.subheadline).foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .cardStyle()
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 16)
        .animation(.spring(duration: 0.5, bounce: 0.2).delay(delay), value: appeared)
    }

    private func noteCard(icon: String, color: Color, title: String, text: String) -> some View {
        HStack(alignment: .top, spacing: DS.Spacing.md) {
            Image(systemName: icon).font(.title3).foregroundStyle(color)
            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                Text(title).font(.subheadline.weight(.semibold)).foregroundStyle(Color.bodyText)
                Text(text).font(.caption).foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .accentedCard(accentColor: color)
    }
}

#Preview {
    NavigationStack {
        LearnDetailView(article: GuideArticle.allArticles[1])
    }
}
