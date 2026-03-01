import CoreLocation

struct Shrine: Identifiable, Hashable {
    let id: UUID
    let name: String
    let address: String
    let description: String
    let coordinate: CLLocationCoordinate2D
    let stampSlotId: Int

    init(id: UUID = UUID(), name: String, address: String, description: String,
         coordinate: CLLocationCoordinate2D, stampSlotId: Int) {
        self.id = id
        self.name = name
        self.address = address
        self.description = description
        self.coordinate = coordinate
        self.stampSlotId = stampSlotId
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Shrine, rhs: Shrine) -> Bool {
        lhs.id == rhs.id
    }

    static let samples: [Shrine] = [
        Shrine(
            id: UUID(uuidString: "00000001-0000-0000-0000-000000000001")!,
            name: "Meiji Jingu",
            address: "1-1 Yoyogikamizonocho, Shibuya, Tokyo",
            description: "Dedicated to Emperor Meiji and Empress Shoken. Famous for its serene forest in the heart of Tokyo and record-breaking New Year's visitors.",
            coordinate: CLLocationCoordinate2D(latitude: 35.6764, longitude: 139.6993),
            stampSlotId: 1
        ),
        Shrine(
            id: UUID(uuidString: "00000001-0000-0000-0000-000000000002")!,
            name: "Senso-ji",
            address: "2-3-1 Asakusa, Taito, Tokyo",
            description: "Tokyo's oldest temple, founded in 628 AD. The Kaminarimon gate with its giant red lantern is one of the city's most iconic landmarks.",
            coordinate: CLLocationCoordinate2D(latitude: 35.7148, longitude: 139.7967),
            stampSlotId: 2
        ),
        Shrine(
            id: UUID(uuidString: "00000001-0000-0000-0000-000000000003")!,
            name: "Yasukuni Jinja",
            address: "3-1-1 Kudankita, Chiyoda, Tokyo",
            description: "Established in 1869. Its cherry trees serve as Tokyo's official bloom reference point for the annual sakura season.",
            coordinate: CLLocationCoordinate2D(latitude: 35.6940, longitude: 139.7440),
            stampSlotId: 3
        ),
        Shrine(
            id: UUID(uuidString: "00000001-0000-0000-0000-000000000004")!,
            name: "Kanda Myojin",
            address: "2-16-2 Sotokanda, Chiyoda, Tokyo",
            description: "Beloved for business fortune and matchmaking blessings. The Kanda Festival is one of Edo's three great festivals.",
            coordinate: CLLocationCoordinate2D(latitude: 35.7020, longitude: 139.7681),
            stampSlotId: 4
        ),
        Shrine(
            id: UUID(uuidString: "00000001-0000-0000-0000-000000000005")!,
            name: "Hie Jinja",
            address: "2-10-5 Nagatacho, Chiyoda, Tokyo",
            description: "Known as 'Sanno-sama', this hillside shrine in Akasaka is famous for career advancement blessings and its tunnel of torii gates.",
            coordinate: CLLocationCoordinate2D(latitude: 35.6750, longitude: 139.7399),
            stampSlotId: 5
        ),
        Shrine(
            id: UUID(uuidString: "00000001-0000-0000-0000-000000000007")!,
            name: "Tokyo Daijingu",
            address: "2-4-1 Fujimi, Chiyoda, Tokyo",
            description: "Called 'Tokyo's Ise Shrine', it pioneered Shinto wedding ceremonies and is one of the city's top shrines for love matches.",
            coordinate: CLLocationCoordinate2D(latitude: 35.7005, longitude: 139.7476),
            stampSlotId: 7
        ),
        Shrine(
            id: UUID(uuidString: "00000001-0000-0000-0000-000000000008")!,
            name: "Yushima Tenmangu",
            address: "3-30-1 Yushima, Bunkyo, Tokyo",
            description: "Dedicated to the god of learning. Students flock here during exam season to pray for academic success.",
            coordinate: CLLocationCoordinate2D(latitude: 35.7080, longitude: 139.7684),
            stampSlotId: 8
        ),
        Shrine(
            id: UUID(uuidString: "00000001-0000-0000-0000-000000000006")!,
            name: "Nezu Jinja",
            address: "1-28-9 Nezu, Bunkyo, Tokyo",
            description: "One of Tokyo's oldest shrines with nearly 1,900 years of history. Its azalea garden with 3,000 bushes blooms brilliantly every spring.",
            coordinate: CLLocationCoordinate2D(latitude: 35.7207, longitude: 139.7619),
            stampSlotId: 6
        ),
    ]
}
