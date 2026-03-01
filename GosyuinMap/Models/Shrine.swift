import CoreLocation

struct Shrine: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let address: String
    let description: String
    let coordinate: CLLocationCoordinate2D
    let stampSlotId: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Shrine, rhs: Shrine) -> Bool {
        lhs.id == rhs.id
    }

    static let samples: [Shrine] = [
        Shrine(
            name: "明治神宮",
            address: "渋谷区代々木神園町1-1",
            description: "明治天皇と昭憲皇太后を祀る神社。初詣の参拝者数は日本一を誇り、都心にありながら豊かな森に囲まれた荘厳な空間です。",
            coordinate: CLLocationCoordinate2D(latitude: 35.6764, longitude: 139.6993),
            stampSlotId: 1
        ),
        Shrine(
            name: "浅草寺",
            address: "台東区浅草2-3-1",
            description: "東京都内最古の寺院。雷門の大提灯は浅草のシンボルとして知られ、仲見世通りには多くの土産物店が軒を連ねます。",
            coordinate: CLLocationCoordinate2D(latitude: 35.7148, longitude: 139.7967),
            stampSlotId: 2
        ),
        Shrine(
            name: "靖国神社",
            address: "千代田区九段北3-1-1",
            description: "明治2年に創建された神社。桜の標本木があり、東京の開花宣言の基準となっています。",
            coordinate: CLLocationCoordinate2D(latitude: 35.6940, longitude: 139.7440),
            stampSlotId: 3
        ),
        Shrine(
            name: "神田明神",
            address: "千代田区外神田2-16-2",
            description: "正式名称は神田神社。商売繁盛・縁結びの神様として親しまれ、神田祭は江戸三大祭の一つです。",
            coordinate: CLLocationCoordinate2D(latitude: 35.7020, longitude: 139.7681),
            stampSlotId: 4
        ),
        Shrine(
            name: "日枝神社",
            address: "千代田区永田町2-10-5",
            description: "山王さまの愛称で親しまれる神社。赤坂の高台に鎮座し、仕事運・出世運のご利益で知られます。",
            coordinate: CLLocationCoordinate2D(latitude: 35.6750, longitude: 139.7399),
            stampSlotId: 5
        ),
        Shrine(
            name: "東京大神宮",
            address: "千代田区富士見2-4-1",
            description: "「東京のお伊勢さま」と呼ばれ、神前結婚式を日本で初めて行った神社。縁結びの名所として有名です。",
            coordinate: CLLocationCoordinate2D(latitude: 35.7005, longitude: 139.7476),
            stampSlotId: 7
        ),
        Shrine(
            name: "湯島天満宮",
            address: "文京区湯島3-30-1",
            description: "学問の神様・菅原道真公を祀る天満宮。受験シーズンには多くの受験生が合格祈願に訪れます。",
            coordinate: CLLocationCoordinate2D(latitude: 35.7080, longitude: 139.7684),
            stampSlotId: 8
        ),
        Shrine(
            name: "根津神社",
            address: "文京区根津1-28-9",
            description: "約1900年前に創建された古社。つつじ苑が有名で、春には約3,000株のつつじが境内を彩ります。",
            coordinate: CLLocationCoordinate2D(latitude: 35.7207, longitude: 139.7619),
            stampSlotId: 6
        ),
    ]
}
