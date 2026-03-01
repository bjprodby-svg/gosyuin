import SwiftUI

struct LearnView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    toriiSection
                    temizuSection
                    sanpaiSection
                    exceptionNote
                }
                .padding()
            }
            .background(Color(.systemBackground))
            .navigationTitle("Shrine Guide")
        }
    }

    // MARK: - 1. Torii Gate

    private var toriiSection: some View {
        GuideSection(
            icon: "door.left.hand.open",
            title: "Torii Gate",
            accentColor: .vermillion,
            steps: [
                GuideStep(
                    number: 1,
                    icon: "figure.stand",
                    title: "Bow before entering",
                    description: "Stop before the torii gate and bow slightly before passing through. The torii marks the entrance to sacred ground."
                ),
                GuideStep(
                    number: 2,
                    icon: "arrow.left.and.right",
                    title: "Walk along the sides",
                    description: "The center of the path (seichu) is reserved for the gods. Walk along either side."
                ),
            ]
        )
    }

    // MARK: - 2. Temizu

    private var temizuSection: some View {
        GuideSection(
            icon: "drop.fill",
            title: "Temizu Purification",
            accentColor: Color(red: 0.15, green: 0.30, blue: 0.60),
            steps: [
                GuideStep(
                    number: 1,
                    icon: "hand.raised.fill",
                    title: "Wash left hand",
                    description: "Hold the ladle with your right hand and pour water over your left hand."
                ),
                GuideStep(
                    number: 2,
                    icon: "hand.raised.fill",
                    title: "Wash right hand",
                    description: "Switch the ladle to your left hand and wash your right hand."
                ),
                GuideStep(
                    number: 3,
                    icon: "drop.circle.fill",
                    title: "Rinse mouth",
                    description: "Switch back to your right hand, pour water into your left palm, and rinse your mouth. Do not drink directly from the ladle."
                ),
                GuideStep(
                    number: 4,
                    icon: "hand.raised.fill",
                    title: "Wash left hand again",
                    description: "Purify your left hand one more time."
                ),
                GuideStep(
                    number: 5,
                    icon: "arrow.up.circle.fill",
                    title: "Purify the ladle",
                    description: "Tilt the ladle upright so remaining water runs down the handle, then return it."
                ),
            ]
        )
    }

    // MARK: - 3. Worship (Nihai-Nihakushu-Ippai)

    private var sanpaiSection: some View {
        GuideSection(
            icon: "building.columns.fill",
            title: "Worship at the Hall",
            accentColor: Color(red: 0.20, green: 0.55, blue: 0.30),
            subtitle: "Bow-Clap-Bow (二礼二拍手一礼)",
            steps: [
                GuideStep(
                    number: 1,
                    icon: "yensign.circle.fill",
                    title: "Make an offering",
                    description: "Place your offering gently into the offertory box."
                ),
                GuideStep(
                    number: 2,
                    icon: "bell.fill",
                    title: "Ring the bell",
                    description: "If there is a bell, shake the rope to ring it."
                ),
                GuideStep(
                    number: 3,
                    icon: "person.fill",
                    title: "Bow deeply twice",
                    description: "Bow at a 90-degree angle, two times."
                ),
                GuideStep(
                    number: 4,
                    icon: "hands.sparkles.fill",
                    title: "Clap twice",
                    description: "Bring your hands together at chest height, offset your right hand slightly, and clap twice."
                ),
                GuideStep(
                    number: 5,
                    icon: "sparkles",
                    title: "Pray silently",
                    description: "With hands together, pray silently and express your gratitude."
                ),
                GuideStep(
                    number: 6,
                    icon: "person.fill",
                    title: "Bow deeply once",
                    description: "Make one final deep bow to complete the worship."
                ),
            ]
        )
    }

    // MARK: - Note

    private var exceptionNote: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "info.circle.fill")
                .font(.title3)
                .foregroundStyle(.orange)

            VStack(alignment: .leading, spacing: 4) {
                Text("Customs may vary by shrine")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.bodyText)
                Text("Izumo Taisha uses two bows and four claps. Ise Jingu has its own unique ritual. Check each shrine's customs before visiting.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.orange.opacity(0.08), in: RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Guide Section

struct GuideSection: View {
    let icon: String
    let title: String
    let accentColor: Color
    var subtitle: String? = nil
    let steps: [GuideStep]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            sectionHeader
                .padding()

            Divider()

            VStack(alignment: .leading, spacing: 0) {
                ForEach(Array(steps.enumerated()), id: \.element.number) { index, step in
                    StepRow(step: step, accentColor: accentColor)
                        .padding(.horizontal)
                        .padding(.vertical, 12)

                    if index < steps.count - 1 {
                        Divider()
                            .padding(.leading, 60)
                    }
                }
            }
        }
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16))
    }

    private var sectionHeader: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background(accentColor, in: RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.bodyText)
                if let subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(accentColor)
                        .fontWeight(.medium)
                }
            }
        }
    }
}

// MARK: - Step Row

struct GuideStep {
    let number: Int
    let icon: String
    let title: String
    let description: String
}

struct StepRow: View {
    let step: GuideStep
    let accentColor: Color

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                    .fill(accentColor.opacity(0.12))
                    .frame(width: 40, height: 40)
                Image(systemName: step.icon)
                    .font(.body)
                    .foregroundStyle(accentColor)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text("\(step.number)")
                        .font(.caption2.bold())
                        .foregroundStyle(.white)
                        .frame(width: 18, height: 18)
                        .background(accentColor, in: Circle())
                    Text(step.title)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.bodyText)
                }
                Text(step.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    LearnView()
}
