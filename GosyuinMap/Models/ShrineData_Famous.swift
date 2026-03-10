import SwiftUI
import CoreLocation

// MARK: - Famous Shrines & Temples (additional, ID 291-400)
// 110 additional famous shrines and temples across Japan

let famousShrines: [Shrine] = [

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kyoto (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000291")!,
        name: "Daigo-ji",
        address: "22 Daigohigashiojicho, Fushimi, Kyoto",
        description: "A sprawling World Heritage temple complex at the foot of Mount Daigo, Daigo-ji is where Toyotomi Hideyoshi threw Japan's most legendary cherry-blossom party in 1598 with 1,300 guests. The five-story pagoda — Kyoto's oldest surviving structure — has stood since 951 AD. The upper temple (Kami-Daigo) rewards hikers with moss-covered ruins and mountain silence.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9510, longitude: 135.8186),
        stampSlotId: 291,
        category: .tera,
        tagline: "Where Hideyoshi's legendary cherry blossom party unfolded",
        highlights: [
            "Kyoto's oldest building — a five-story pagoda from 951 AD",
            "UNESCO World Heritage Site with sub-temples spanning the mountainside",
            "Hideyoshi's famous 1598 hanami party site with 700 cherry trees",
            "Sanboin garden — a Momoyama-era masterpiece of landscape design"
        ],
        mustSee: "The five-story pagoda framed by weeping cherry blossoms in early April is one of Kyoto's most breathtaking scenes. Arrive early to photograph it in soft morning light.",
        tips: [
            "The complex is huge — allow 2-3 hours for lower Daigo alone",
            "The hike to Kami-Daigo (upper temple) takes about 1 hour each way",
            "Sanboin garden requires a separate admission fee but is absolutely worth it",
            "Cherry blossom season (late March-early April) draws huge crowds — arrive at opening"
        ],
        bestSeason: "Late March-early April (cherry blossoms), November (autumn foliage)",
        access: "10 min walk from Daigo Station (Tozai Subway Line)",
        hours: "9:00-17:00 (Mar-Nov), 9:00-16:30 (Dec-Feb)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000292")!,
        name: "Ninna-ji",
        address: "33 Omuroouchi, Ukyo, Kyoto",
        description: "Founded by Emperor Uda in 888 AD, Ninna-ji is the head temple of the Omuro school of Shingon Buddhism and a World Heritage Site. Its late-blooming Omuro cherry trees — short, bushy, and uniquely photogenic — are a beloved Kyoto spring tradition. The Nio-mon gate and five-story pagoda create a majestic approach that has impressed visitors for over a millennium.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0315, longitude: 135.7133),
        stampSlotId: 292,
        category: .tera,
        tagline: "Late-blooming cherry trees beneath an ancient imperial pagoda",
        highlights: [
            "UNESCO World Heritage Site founded by Emperor Uda in 888",
            "Famous Omuro cherry blossoms — late-blooming and uniquely low-growing",
            "Magnificent Nio-mon gate and five-story pagoda",
            "Former imperial residence with elegant Shinden-zukuri architecture"
        ],
        mustSee: "The Omuro cherry grove at eye level with the five-story pagoda rising behind — unlike any other cherry blossom view in Kyoto. They bloom about two weeks after Maruyama Park.",
        tips: [
            "Omuro cherries bloom mid-to-late April, two weeks later than most Kyoto trees",
            "The Goten (palace buildings) have gorgeous fusuma paintings — don't skip them",
            "Combine with nearby Ryoan-ji and Kinkaku-ji for a northwestern Kyoto circuit",
            "The Omuro 88 pilgrimage trail behind the temple can be walked in about 2 hours"
        ],
        bestSeason: "Mid-to-late April (Omuro cherry blossoms), November (autumn colors)",
        access: "Bus 26 from Kyoto Station to Omuro-Ninnaji stop, or Omuro-Ninnaji Station (Keifuku Line)",
        hours: "9:00-17:00 (Mar-Nov), 9:00-16:30 (Dec-Feb)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000293")!,
        name: "Saiho-ji (Kokedera)",
        address: "56 Matsuo Jingatanicho, Nishikyo, Kyoto",
        description: "Known worldwide as the Moss Temple, Saiho-ji's garden is carpeted in over 120 varieties of luminous green moss, creating an ethereal landscape that inspired the design of Kinkaku-ji's garden. Visits require advance reservation and begin with a meditative sutra-copying session, making every visit feel deeply personal and unhurried.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9922, longitude: 135.6833),
        stampSlotId: 293,
        category: .tera,
        tagline: "120 varieties of emerald moss in a UNESCO garden",
        highlights: [
            "Over 120 species of moss creating a living green carpet",
            "UNESCO World Heritage Site and inspiration for Kinkaku-ji's garden",
            "Mandatory sutra-copying meditation before garden viewing",
            "Ogonchi pond shaped like the kanji for heart (心)"
        ],
        mustSee: "The moss garden after gentle rain — each variety glistens differently, and the entire landscape seems to breathe with an otherworldly green glow.",
        tips: [
            "Reservation is MANDATORY — apply by postcard or online at least 2 weeks ahead",
            "The ¥3,000 admission includes a sutra-copying (shakyo) session",
            "Best after rain when the moss is most vibrant and luminous",
            "Photography is allowed in the garden but keep the meditative atmosphere"
        ],
        bestSeason: "Rainy season (June-July) for the most vivid moss, also beautiful in autumn",
        access: "Bus 73 from Kyoto Station to Kokedera-Suzumushidera stop (50 min)",
        hours: "By reservation only (sessions typically start at 10:00, 11:00, 13:00, 14:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000294")!,
        name: "Daikaku-ji",
        address: "4 Sagaosawa-cho, Ukyo, Kyoto",
        description: "Once the detached palace of Emperor Saga, Daikaku-ji became a Shingon temple in 876 and served as a seat of imperial power for centuries. The temple overlooks Osawa-no-Ike, Japan's oldest artificial garden pond, where aristocrats once floated boats under the autumn moon. Its fusuma paintings and covered corridors evoke the elegance of the Heian court.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0337, longitude: 135.6774),
        stampSlotId: 294,
        category: .tera,
        tagline: "An imperial palace on Japan's oldest garden pond",
        highlights: [
            "Osawa-no-Ike — Japan's oldest artificial garden pond from the Heian era",
            "Former imperial palace converted to temple in 876 AD",
            "Elaborate fusuma sliding door paintings by Kano school artists",
            "Moon-viewing boat events in autumn on the ancient pond"
        ],
        mustSee: "The view across Osawa-no-Ike at sunset, when the water mirrors the sky and the surrounding Sagano hills — a scene virtually unchanged since Emperor Saga admired it 1,200 years ago.",
        tips: [
            "Combine with a walk through the Sagano bamboo grove and Arashiyama area",
            "The autumn moon-viewing event (Kangetsu no Yube) with boats on the pond is magical",
            "Less crowded than nearby Arashiyama temples — a welcome respite",
            "The covered corridors connecting buildings are photogenic in any season"
        ],
        bestSeason: "Autumn (moon-viewing event and foliage), Spring (cherry blossoms by the pond)",
        access: "Bus 28 from Kyoto Station to Daikakuji stop (50 min), or 20 min walk from Saga-Arashiyama Station",
        hours: "9:00-17:00 (last entry 16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000295")!,
        name: "Manshu-in",
        address: "42 Takenouchi-cho, Ichijoji, Sakyo, Kyoto",
        description: "Tucked away in the foothills of northeastern Kyoto, Manshu-in is a Tendai temple whose exquisite garden and refined study rooms rival any in the city — yet it remains blissfully uncrowded. The dry landscape garden viewed from the Shoin (study hall) is a masterpiece of borrowed scenery, framing distant Mount Hiei between carefully pruned trees.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0527, longitude: 135.7984),
        stampSlotId: 295,
        category: .tera,
        tagline: "A hidden gem of refined Zen aesthetics below Mount Hiei",
        highlights: [
            "Exquisite karesansui dry landscape garden with borrowed scenery of Mount Hiei",
            "Elegant Shoin architecture with delicate fusuma paintings",
            "Remarkably uncrowded despite world-class beauty",
            "Stunning autumn foliage tunnel along the approach path"
        ],
        mustSee: "The view from the large Shoin across the dry landscape garden — the composition of rocks, moss, and pruned trees with Mount Hiei rising in the background is perfection.",
        tips: [
            "Visit in November for the fiery maple tunnel along the approach road",
            "Combine with nearby Shugakuin Imperial Villa and Enko-ji",
            "Arrive early for contemplative silence before tour groups arrive",
            "The tea room offers matcha with a garden view — highly recommended"
        ],
        bestSeason: "November (spectacular autumn foliage), May (fresh green moss and azaleas)",
        access: "Bus 5 from Kyoto Station to Ichijoji-Shimizucho, then 20 min walk",
        hours: "9:00-17:00 (last entry 16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000296")!,
        name: "Shoren-in",
        address: "69-1 Awataguchi Sanjobocho, Higashiyama, Kyoto",
        description: "Guarded by enormous 800-year-old camphor trees, Shoren-in is an aristocratic Tendai temple that once served as a temporary imperial palace. Its Muromachi-period garden wraps around a tranquil pond, and the temple is famous for its magical blue LED illumination events in spring and autumn, when the garden transforms into a sea of ethereal light.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0063, longitude: 135.7838),
        stampSlotId: 296,
        category: .tera,
        tagline: "800-year-old camphor trees and ethereal blue illuminations",
        highlights: [
            "Massive 800-year-old camphor trees flanking the entrance gate",
            "Stunning nighttime blue LED illumination events in spring and autumn",
            "Muromachi-era pond garden designed for contemplative strolling",
            "Former temporary imperial palace with refined aristocratic atmosphere"
        ],
        mustSee: "The spring or autumn nighttime illumination — the entire garden is bathed in blue light that seems to make the trees and moss glow from within. Absolutely unforgettable.",
        tips: [
            "Check the illumination schedule before visiting — evening events are the highlight",
            "Located between Chion-in and Nanzen-ji, perfect for a Higashiyama walking route",
            "Much quieter than neighboring Chion-in, even during peak seasons",
            "Sit on the veranda of the Kogosho hall for the best garden view"
        ],
        bestSeason: "Spring and autumn (illumination events), Year-round for daytime visits",
        access: "5 min walk from Higashiyama Station (Tozai Subway Line)",
        hours: "9:00-17:00 (daytime), illumination events 18:00-22:00 (seasonal)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000297")!,
        name: "Sennyu-ji",
        address: "27 Sennyuji Yamanouchicho, Higashiyama, Kyoto",
        description: "Known as the 'Imperial Temple' because it houses the tombs of most Japanese emperors from the Kamakura period onward, Sennyu-ji sits in a forested valley southeast of Kyoto. The main hall's ceiling features a fearsome dragon painting, and the Yokihi Kannon statue — modeled after the legendary Chinese beauty Yang Guifei — draws prayers for beauty and romantic fortune.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9783, longitude: 135.7833),
        stampSlotId: 297,
        category: .tera,
        tagline: "The imperial burial temple with a dragon ceiling and beauty prayers",
        highlights: [
            "Resting place of Japanese emperors from 13th century onward",
            "Dramatic dragon painting on the main hall ceiling",
            "Yokihi Kannon — pray for beauty at this statue of Yang Guifei",
            "Forested hillside setting far from the main tourist circuits"
        ],
        mustSee: "The Yokihi Kannon hall — the elegant statue said to bestow beauty and romantic fortune draws a devoted following, and the surrounding sub-temples are serene.",
        tips: [
            "Very few tourists visit despite its imperial significance — enjoy the calm",
            "The sub-temple Unryu-in has gorgeous fusuma paintings (separate admission)",
            "Autumn foliage along the approach path is spectacular and uncrowded",
            "Combine with Tofuku-ji, which is a 15-minute walk away"
        ],
        bestSeason: "November (autumn foliage), Spring (cherry blossoms along approach)",
        access: "15 min walk from Tofukuji Station (JR/Keihan), or Bus 208 to Sennyuji-michi",
        hours: "9:00-17:00 (Mar-Nov), 9:00-16:30 (Dec-Feb)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000298")!,
        name: "Bishamon-do",
        address: "18 Anshu Inadacho, Yamashina, Kyoto",
        description: "Perched on a hillside in Yamashina, Bishamon-do is a Tendai temple dedicated to Bishamonten, the guardian deity of the north and god of warriors. Its sweeping staircase approach and elegant Edo-period architecture create a grand impression, but the real showstopper is autumn — the temple's maple trees explode in crimson, reflecting in the polished wooden floors.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9925, longitude: 135.8190),
        stampSlotId: 298,
        category: .tera,
        tagline: "Crimson maples reflected in polished Edo-period floors",
        highlights: [
            "Stunning autumn foliage reflected in polished corridor floors ('yukamomiji')",
            "Grand stone staircase approach creating a dramatic arrival",
            "Dedicated to Bishamonten, warrior protector deity of the north",
            "Elegant Edo-period architecture in a peaceful hillside setting"
        ],
        mustSee: "The 'yukamomiji' — red maple leaves reflected in the polished wooden floors of the corridors. Position yourself low and photograph the fiery reflection for an iconic shot.",
        tips: [
            "Peak autumn colors usually hit in mid-to-late November",
            "Arrive early in the morning for the best yukamomiji reflections without crowds",
            "The approach staircase is steep — comfortable shoes recommended",
            "Less famous than Tofuku-ji or Eikando for autumn, meaning smaller crowds"
        ],
        bestSeason: "Mid-to-late November (autumn foliage and yukamomiji reflections)",
        access: "20 min walk from Yamashina Station (JR/Subway) or Bus to Bishamondo-mae",
        hours: "8:30-17:00 (last entry 16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000299")!,
        name: "Kamigamo Jinja Kataoka-sha",
        address: "339 Kamigamo Motoyama, Kita, Kyoto",
        description: "Within the sacred grounds of Kamigamo Jinja sits Kataoka-sha, a small but deeply revered sub-shrine dedicated to the mother of the main shrine's deity. It has become one of Kyoto's most popular spots for love and marriage prayers, with heart-shaped ema (votive tablets) hanging by the hundreds. The approach through the ancient forest adds to the romantic atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0598, longitude: 135.7525),
        stampSlotId: 299,
        category: .jinja,
        tagline: "Kyoto's beloved love shrine with heart-shaped ema",
        highlights: [
            "Heart-shaped ema votive tablets for love and marriage prayers",
            "Sub-shrine within UNESCO World Heritage Kamigamo Jinja",
            "Dedicated to the mother deity — strong feminine spiritual energy",
            "Surrounded by Kamigamo's ancient sacred forest"
        ],
        mustSee: "The wall of heart-shaped ema tablets with handwritten love wishes — some in Japanese, some from visitors worldwide. A moving display of universal hope.",
        tips: [
            "Visit as part of your Kamigamo Jinja exploration — it's within the same grounds",
            "Write your wish on a heart ema for ¥500",
            "The Nara-no-Ogawa stream nearby is perfect for a meditative pause",
            "Less crowded than Jishu Jinja (Kiyomizu) for love prayers"
        ],
        bestSeason: "Year-round, May (Aoi Matsuri festival at parent shrine)",
        access: "Bus 4 from Kyoto Station to Kamigamo-Jinja-mae (40 min)",
        hours: "5:30-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000300")!,
        name: "Jishu Jinja",
        address: "1-317 Kiyomizu, Higashiyama, Kyoto",
        description: "Perched on the hilltop just above Kiyomizu-dera's main hall, Jishu Jinja is Japan's most famous shrine for love and matchmaking. The 'Love Stones' — two rocks set 18 meters apart — offer a romantic challenge: walk between them with eyes closed, and your love wish will come true. The shrine predates Kiyomizu-dera itself and is dedicated to Okuninushi, the deity of love.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9950, longitude: 135.7854),
        stampSlotId: 300,
        category: .jinja,
        tagline: "Walk blindfolded between the Love Stones to find true love",
        highlights: [
            "Famous Love Stones (Koiuranai no Ishi) set 18 meters apart",
            "Dedicated to Okuninushi, Japan's primary love and matchmaking deity",
            "Located directly above Kiyomizu-dera's wooden stage",
            "Love charms (enmusubi omamori) in every color and style imaginable"
        ],
        mustSee: "Attempt the Love Stones challenge — close your eyes and walk the 18 meters between the two rocks. If you make it without help, your love wish will be granted on your own. If someone guides you, you'll need a matchmaker.",
        tips: [
            "Included in the Kiyomizu-dera visit — it's at the top of the complex",
            "Extremely popular with students and couples, especially on weekends",
            "The various love charms make great souvenirs — some are beautifully designed",
            "Try to visit on a weekday morning for a less hectic experience"
        ],
        bestSeason: "Year-round (busiest during cherry blossom and autumn seasons)",
        access: "Same as Kiyomizu-dera — Bus 100/206 to Kiyomizu-michi, then 10 min uphill walk",
        hours: "9:00-17:00 (same as Kiyomizu-dera)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Nara (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000301")!,
        name: "Gango-ji",
        address: "11 Chuincho, Nara",
        description: "One of Japan's oldest temples with roots stretching back to the 6th century Asuka-dera, Gango-ji was relocated to Nara in 718 and became one of the great Seven Temples of the ancient capital. Its unassuming exterior belies extraordinary historical depth — roof tiles from the original Asuka-era structure still crown parts of the building, making them among the oldest roof tiles in use anywhere in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6780, longitude: 135.8322),
        stampSlotId: 301,
        category: .tera,
        tagline: "Nara's quiet World Heritage temple with 1,400-year-old roof tiles",
        highlights: [
            "UNESCO World Heritage Site — one of Nara's Seven Great Temples",
            "Roof tiles from the original 6th-century Asuka-dera still in use",
            "Peaceful Naramachi neighborhood setting away from main tourist flow",
            "Excellent collection of Buddhist art and stone monuments"
        ],
        mustSee: "Look closely at the Gokurakubo hall's roof — the alternating red and gray tiles include original 6th-century tiles from Asuka-dera, possibly the oldest roof tiles still serving their purpose in Japan.",
        tips: [
            "Located in charming Naramachi — combine with exploring the old merchant district",
            "Much quieter than Todai-ji and Kasuga Taisha, perfect for contemplation",
            "The stone Buddhist statues (sekibutsu) in the garden are unique to this temple",
            "Ask at the reception about the tile identification — staff are knowledgeable"
        ],
        bestSeason: "Year-round, August (mantoe lantern festival with thousands of lights)",
        access: "15 min walk from Kintetsu Nara Station through Naramachi",
        hours: "9:00-17:00 (last entry 16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000302")!,
        name: "Shin-Yakushi-ji",
        address: "1352 Takabatakecho, Nara",
        description: "Built by Empress Komyo in 747 to pray for her husband Emperor Shomu's recovery from an eye illness, Shin-Yakushi-ji houses a spectacular ring of twelve divine guardian statues (Juni Shinsho) encircling the main Yakushi Buddha. Eleven of the twelve guardians are original Nara-period national treasures — an astonishing survival rate for 1,300-year-old clay sculptures.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6751, longitude: 135.8470),
        stampSlotId: 302,
        category: .tera,
        tagline: "Twelve fierce divine guardians encircling a healing Buddha",
        highlights: [
            "Eleven original 8th-century guardian statues — National Treasures in clay",
            "Ring of twelve Juni Shinsho warriors with vivid facial expressions",
            "Built by Empress Komyo in 747 AD for Emperor Shomu's health",
            "Intimate main hall allowing close viewing of the extraordinary sculptures"
        ],
        mustSee: "The ring of twelve guardian statues — particularly Basara (Vajra) with his fierce expression and dynamic pose, widely considered one of Japan's finest sculptures. The small hall lets you stand mere feet away.",
        tips: [
            "The main hall is small enough to study each guardian up close — take your time",
            "Combine with nearby Kasuga Taisha and Nara Park",
            "The nearby Sasayaki no Komichi (Whispering Path) is a lovely approach walk",
            "The Basara guardian is so famous it has its own merchandise in the gift shop"
        ],
        bestSeason: "Year-round (indoor sculptures), spring (wisteria nearby)",
        access: "20 min walk from Kintetsu Nara Station, or Bus to Takabatake-cho",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000303")!,
        name: "Tamukeyama Hachimangu",
        address: "434 Zoushicho, Nara",
        description: "Standing guard at the entrance to Todai-ji's precincts, Tamukeyama Hachimangu was established in 749 to serve as the protective deity of the Great Buddha. It is one of the three great Hachiman shrines of Japan. The shrine's autumn festival features traditional gagaku court music, and the surrounding forest blazes with maple color in November.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6885, longitude: 135.8428),
        stampSlotId: 303,
        category: .hachimangu,
        tagline: "Guardian of the Great Buddha and one of Japan's three great Hachiman shrines",
        highlights: [
            "One of the three great Hachiman shrines in Japan",
            "Established in 749 to protect Todai-ji's Great Buddha",
            "Brilliant autumn foliage rivaling any in Nara",
            "Traditional gagaku court music performances at the autumn festival"
        ],
        mustSee: "The maple-framed view of the shrine buildings in November — the crimson canopy over the ancient stone steps creates one of Nara's most photogenic autumn scenes.",
        tips: [
            "Located between Todai-ji and Kasuga Taisha — a natural stop on the walking route",
            "Most visitors walk past without entering — step inside for a crowd-free experience",
            "The autumn festival in early October features rarely seen court music",
            "The shrine's gosyuin calligraphy is elegant and well-regarded among collectors"
        ],
        bestSeason: "November (spectacular autumn foliage), October (autumn festival)",
        access: "25 min walk from Kintetsu Nara Station via Nara Park, adjacent to Todai-ji",
        hours: "7:30-16:30",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kanto (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000304")!,
        name: "Oarai Isosaki Jinja",
        address: "6890 Isohamacho, Oarai, Ibaraki",
        description: "Perched on a rocky stretch of the Pacific coast, Oarai Isosaki Jinja is famous for its Kamiiso-no-Torii — a torii gate standing on a rock formation in the ocean, battered by waves and glowing in the sunrise. The image of the torii silhouetted against the rising sun over the Pacific has become one of Japan's most iconic photographs and a symbol of divine power over the sea.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3131, longitude: 140.5893),
        stampSlotId: 304,
        category: .jinja,
        tagline: "A torii gate rising from the Pacific Ocean at sunrise",
        highlights: [
            "Kamiiso-no-Torii standing dramatically on ocean rocks amid crashing waves",
            "Iconic sunrise view — one of Japan's most photographed shrine scenes",
            "Dedicated to Onamuchi-no-Mikoto, deity of nation-building and medicine",
            "New Year's sunrise attracts thousands of worshippers"
        ],
        mustSee: "The sunrise over the Kamiiso-no-Torii — arrive 30 minutes before dawn, position yourself on the seawall, and watch the sun rise directly behind the ocean torii. An unforgettable spiritual moment.",
        tips: [
            "Sunrise is the essential photo — check the sunrise time and arrive early",
            "The torii is best viewed from the seawall walkway below the main shrine",
            "High tide with moderate waves creates the most dramatic effect",
            "Try the local specialty — shirasu (whitebait) at the nearby market after your visit"
        ],
        bestSeason: "Year-round for sunrise (winter for the most dramatic skies), New Year",
        access: "15 min walk from Oarai Station (Kashima Rinkai Railway)",
        hours: "6:00-17:00 (but sunrise viewing is from the seawall, always accessible)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000305")!,
        name: "Tsukubasan Jinja",
        address: "1 Tsukuba, Tsukuba, Ibaraki",
        description: "Sitting at the midpoint of sacred Mount Tsukuba — the easternmost mountain of Japanese mythology — Tsukubasan Jinja venerates the married couple deities Izanagi and Izanami, making it one of Japan's premier shrines for marriage and romantic fortune. The mountain's twin peaks (male and female) are connected by a natural stone bridge said to symbolize the union of the divine pair.",
        coordinate: CLLocationCoordinate2D(latitude: 36.2259, longitude: 140.1009),
        stampSlotId: 305,
        category: .jinja,
        tagline: "Where creator deities Izanagi and Izanami unite on twin peaks",
        highlights: [
            "Enshrines Izanagi and Izanami — Japan's creator couple deities",
            "Twin male and female peaks connected by a natural stone bridge",
            "One of Japan's top shrines for marriage and romantic blessings",
            "Cable car and ropeway access to summit with panoramic Kanto Plain views"
        ],
        mustSee: "Take the cable car up and walk the trail between the twin peaks — the Benkei Nanamodori (seven-fold return) rock formations are dramatic, and on clear days you can see Tokyo Skytree from the summit.",
        tips: [
            "The cable car runs from Miyawaki Station near the shrine to the mountaintop",
            "The full hiking trail from shrine to summit takes about 90 minutes",
            "February-March sees gorgeous plum blossoms on the lower slopes",
            "Clear winter days offer the best views — sometimes all the way to Mount Fuji"
        ],
        bestSeason: "February (plum blossoms), October-November (autumn foliage), clear winter days",
        access: "Shuttle bus from Tsukuba Station (TX Line) to Tsukuba Jinja Iriguchi (40 min)",
        hours: "Shrine open 24 hours, cable car 9:00-17:00 (seasonal variations)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000306")!,
        name: "Shorinzan Daruma-ji",
        address: "296 Hanadakacho, Takasaki, Gunma",
        description: "The birthplace of the Daruma doll — Japan's beloved tumbling good-luck charm — Shorinzan Daruma-ji was founded in 1697 by a Zen monk who carved the first Daruma figure to inspire resilience. The temple sits amid hills in Takasaki, which now produces 80% of Japan's Daruma dolls. Every January, the massive Daruma Market attracts over 200,000 visitors.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3614, longitude: 139.0358),
        stampSlotId: 306,
        category: .tera,
        tagline: "Birthplace of Japan's iconic Daruma good-luck doll",
        highlights: [
            "Origin temple of the Daruma doll tradition since 1697",
            "Giant Daruma dolls throughout the grounds — fantastic photo opportunities",
            "Takasaki produces 80% of all Daruma dolls in Japan",
            "January Daruma Market — one of Japan's most energetic New Year festivals"
        ],
        mustSee: "The main hall filled with thousands of Daruma dolls in every size, from tiny to enormous — visitors return dolls here after their wishes come true, creating a remarkable sea of red faces.",
        tips: [
            "Buy a Daruma doll: paint one eye when making a wish, the other when it comes true",
            "The January 6-7 Daruma Market (Daruma Ichi) is spectacular but extremely crowded",
            "The temple offers Daruma painting workshops — a unique hands-on experience",
            "Return your fulfilled Daruma dolls here for a ceremonial burning (Daruma Kuyo)"
        ],
        bestSeason: "January 6-7 (Daruma Market), Year-round for temple visits",
        access: "Bus from Takasaki Station (JR) to Shorinzan-Darumaji stop (30 min), or taxi 20 min",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Tohoku (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000307")!,
        name: "Yamadera (Risshaku-ji Oku-no-In)",
        address: "4456-1 Yamadera, Yamagata",
        description: "While Risshaku-ji is already known, the climb to its Oku-no-In (inner sanctuary) at the very top — 1,015 stone steps up a cedar-clad mountainside — is a pilgrimage in itself. Matsuo Basho composed his most famous haiku here in 1689: 'Stillness — seeping into the rocks, the cicadas' cry.' The summit platform offers breathtaking views of the valley below.",
        coordinate: CLLocationCoordinate2D(latitude: 38.3131, longitude: 140.4369),
        stampSlotId: 307,
        category: .tera,
        tagline: "1,015 stone steps to Basho's famous haiku of silence",
        highlights: [
            "1,015 stone steps through ancient cedar forest to the summit",
            "Where Basho wrote his immortal cicada haiku in 1689",
            "Godaido observation platform with stunning valley panorama",
            "Each step is said to purify one worldly desire"
        ],
        mustSee: "The Godaido observation platform at the top — after climbing all 1,015 steps, step onto this cantilevered wooden deck jutting over the mountainside for a valley view that will leave you speechless.",
        tips: [
            "The climb takes 30-40 minutes — pace yourself and enjoy the forest atmosphere",
            "Visit in early morning for mist rising through the cedars — magical",
            "Cherry ice cream (sakuranbo soft cream) at the base is the perfect reward",
            "Winter visits are stunning but icy — crampons recommended November-March"
        ],
        bestSeason: "Early summer (lush green, cicadas echo Basho's haiku), November (autumn colors)",
        access: "Yamadera Station (JR Senzan Line) — 1 hour from Sendai, 20 min from Yamagata",
        hours: "8:00-17:00 (Apr-Nov), 8:00-16:00 (Dec-Mar)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000308")!,
        name: "Takkoku no Iwaya Bishamondo",
        address: "16 Hiraizumicho Kitazawa, Hiraizumi, Iwate",
        description: "Built into the face of a sheer cliff in 801 AD by Sakanoue no Tamuramaro, Takkoku no Iwaya is a dramatic temple wedged beneath a towering rock overhang. The vermillion hall seems to defy gravity, supported by stilts against the cliff face in a style reminiscent of Kiyomizu-dera. A large rock-carved Buddha relief overlooks the scene from the neighboring cliff.",
        coordinate: CLLocationCoordinate2D(latitude: 38.9804, longitude: 141.1036),
        stampSlotId: 308,
        category: .tera,
        tagline: "A vermillion temple built into the face of a sheer cliff",
        highlights: [
            "Bishamondo hall wedged beneath a massive cliff overhang on stilts",
            "Founded in 801 AD by the legendary general Sakanoue no Tamuramaro",
            "Rock-carved Buddha relief (Ganmen Daibutsu) on the adjacent cliff",
            "Near the Hiraizumi World Heritage area including Chuson-ji and Motsu-ji"
        ],
        mustSee: "Stand back and take in the full view of the vermillion hall clinging to the cliff face — the engineering audacity of building this in 801 AD is staggering. The rock-carved Buddha nearby is also remarkable.",
        tips: [
            "Combine with Hiraizumi's other sites: Chuson-ji and Motsu-ji",
            "A short walk from the Genbikei Gorge, a natural scenic spot",
            "The autumn foliage framing the cliff temple is extraordinary",
            "Relatively few tourists make it here — a hidden treasure of Tohoku"
        ],
        bestSeason: "November (autumn foliage against the cliff), April (cherry blossoms)",
        access: "Taxi from Hiraizumi Station (JR Tohoku Line), 10 min, or rental bicycle",
        hours: "8:00-17:00 (Apr-Nov), 8:00-16:30 (Dec-Mar)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000309")!,
        name: "Akita Senshu Inari Jinja",
        address: "1-8 Senshu Park, Akita",
        description: "Located within the ruins of Kubota Castle in Senshu Park, Akita Senshu Inari Jinja is one of Tohoku's most beloved Inari shrines. The shrine grounds feature rows of vermillion torii gates climbing the castle hillside, and the annual Kanto Festival in August — with performers balancing massive lantern poles — is one of Japan's most thrilling summer celebrations.",
        coordinate: CLLocationCoordinate2D(latitude: 39.7240, longitude: 140.1188),
        stampSlotId: 309,
        category: .inari,
        tagline: "Vermillion torii gates within Akita's historic castle park",
        highlights: [
            "Rows of vermillion torii gates climbing Kubota Castle hillside",
            "Within scenic Senshu Park — Akita's premier cherry blossom spot",
            "Near the Kanto Festival venue — one of Japan's top summer festivals",
            "Panoramic city views from the castle hilltop shrine grounds"
        ],
        mustSee: "Walk through the torii gate tunnel on the castle hillside during cherry blossom season — the red gates against pink blossoms with the castle moat below is quintessential Tohoku beauty.",
        tips: [
            "Visit during the Kanto Festival (August 3-6) for an unforgettable experience",
            "Cherry blossom season in Akita is mid-to-late April",
            "Senshu Park has a free observation tower — visit for the city panorama",
            "Combine with kiritanpo hot pot at a local restaurant nearby"
        ],
        bestSeason: "Mid-April (cherry blossoms), August (Kanto Festival)",
        access: "10 min walk from Akita Station (JR)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Hokkaido (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000310")!,
        name: "Otaru Sumiyoshi Jinja",
        address: "2-1 Sumiyoshicho, Otaru, Hokkaido",
        description: "Overlooking the charming port town of Otaru from a forested hillside, Sumiyoshi Jinja has been the spiritual heart of the city since 1868. The shrine's annual summer festival transforms Otaru's streets with elaborate portable shrine processions and fire-walking ceremonies. In winter, the snow-blanketed shrine grounds complement the famous Otaru Snow Light Path festival.",
        coordinate: CLLocationCoordinate2D(latitude: 43.1890, longitude: 140.9918),
        stampSlotId: 310,
        category: .jinja,
        tagline: "Otaru's hillside guardian overlooking the nostalgic port town",
        highlights: [
            "Scenic hilltop location overlooking Otaru's canal and port",
            "Summer festival with elaborate mikoshi processions and fire-walking",
            "Snow-covered shrine during Otaru Snow Light Path festival in February",
            "Sacred forest with towering trees — rare for Hokkaido shrines"
        ],
        mustSee: "Visit during the February Snow Light Path festival — the snow-covered approach lit by hundreds of candles and lanterns creates one of Hokkaido's most magical winter scenes.",
        tips: [
            "The hilltop offers excellent views of Otaru's port — bring a camera",
            "Combine with a walk along Otaru Canal and the glass workshops",
            "The summer festival (July) features impressive mikoshi bearers",
            "Try nearby LeTAO cheesecake after your shrine visit — Otaru's famous treat"
        ],
        bestSeason: "February (Snow Light Path festival), July (summer festival)",
        access: "15 min walk from Minami-Otaru Station (JR), or 20 min walk from Otaru Canal area",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000311")!,
        name: "Asahikawa Gokoku Jinja",
        address: "Kaguraoka Park, Asahikawa, Hokkaido",
        description: "Set within the forested Kaguraoka Park in Asahikawa, this Gokoku shrine is famous for hosting one of Hokkaido's most atmospheric winter festivals. The shrine grounds are used for ice sculpture displays and snow lanterns, while the surrounding park offers cross-country skiing. In summer, the lush green grounds provide a cool retreat in Hokkaido's warmest city.",
        coordinate: CLLocationCoordinate2D(latitude: 43.7817, longitude: 142.3875),
        stampSlotId: 311,
        category: .jinja,
        tagline: "Hokkaido's northern guardian amid winter ice and summer green",
        highlights: [
            "Dramatic winter setting with ice sculptures and snow lanterns",
            "Within scenic Kaguraoka Park — Asahikawa's green heart",
            "Major hatsumode (New Year) destination for northern Hokkaido",
            "Summer festival with traditional Ainu cultural elements"
        ],
        mustSee: "The shrine approach during winter — the snow-laden trees and ice-crystal air of Japan's coldest city give this shrine an atmosphere unlike any other in the country.",
        tips: [
            "Asahikawa routinely reaches -25°C in winter — dress in serious cold-weather gear",
            "Combine with Asahiyama Zoo, one of Japan's best, just 20 minutes away",
            "The park's cherry blossoms bloom in May — later than Honshu",
            "Asahikawa ramen is a must-try: soy-based with a lard film to keep it hot in the cold"
        ],
        bestSeason: "February (ice festival), May (cherry blossoms), July-August (green season)",
        access: "Bus from Asahikawa Station to Kaguraoka Koen, or 20 min walk",
        hours: "Open 24 hours (shrine office 9:00-16:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Chubu (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000312")!,
        name: "Sakurayama Hachimangu",
        address: "178 Sakuramachi, Takayama, Gifu",
        description: "Home to the spectacular Takayama Festival — ranked among Japan's three most beautiful festivals — Sakurayama Hachimangu stores eleven magnificent yatai festival floats in dedicated storehouses on its grounds. The autumn festival in October features these elaborate floats parading through Takayama's Edo-period streets, complete with mechanical puppet (karakuri) performances.",
        coordinate: CLLocationCoordinate2D(latitude: 36.1449, longitude: 137.2619),
        stampSlotId: 312,
        category: .hachimangu,
        tagline: "Home of one of Japan's three most beautiful festivals",
        highlights: [
            "Takayama Autumn Festival — one of Japan's three most beautiful matsuri",
            "Eleven elaborately decorated yatai festival floats stored on the grounds",
            "Karakuri mechanical puppet performances on the floats",
            "Beautiful setting in Takayama's atmospheric old town"
        ],
        mustSee: "If you visit during the October festival (9-10), watch the yatai floats parade through the old town streets at night, lit by hundreds of lanterns — an experience that transports you to Edo-period Japan.",
        tips: [
            "The Takayama Festival Floats Exhibition Hall next door displays four floats year-round",
            "Autumn Festival: October 9-10; Spring Festival (at Hie Jinja): April 14-15",
            "Book Takayama accommodation months ahead during festival dates",
            "The shrine is a pleasant 20-minute walk through the old town from the station"
        ],
        bestSeason: "October 9-10 (Autumn Festival), April (Spring Festival at sister shrine)",
        access: "20 min walk from Takayama Station (JR Takayama Line)",
        hours: "Open 24 hours (shrine office 9:00-16:00, Float Exhibition Hall 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000313")!,
        name: "Hida Ichinomiya Minashi Jinja",
        address: "5323 Ichinomiyacho, Takayama, Gifu",
        description: "The highest-ranking shrine of the ancient Hida Province, Minashi Jinja sits in a serene forest setting south of Takayama. As 'Hida Ichinomiya' (first shrine of Hida), it has been the spiritual center of the region for over 1,500 years. The enormous sacred cedar trees lining the approach create a primeval atmosphere, and the shrine's architectural style reflects ancient mountain worship traditions.",
        coordinate: CLLocationCoordinate2D(latitude: 36.0876, longitude: 137.2547),
        stampSlotId: 313,
        category: .jinja,
        tagline: "The ancient first shrine of the Hida mountain realm",
        highlights: [
            "Ichinomiya — highest-ranking shrine of old Hida Province for 1,500+ years",
            "Towering sacred cedar trees creating a primeval forest approach",
            "Ancient mountain worship traditions preserved in architecture and ritual",
            "Important cultural property main hall in distinctive Hida style"
        ],
        mustSee: "The approach through the ancient cedar forest — the massive trees, some over 800 years old, create a natural cathedral effect that makes the modern world feel very far away.",
        tips: [
            "Drive or take a bus from Takayama — the shrine is about 20 minutes south",
            "The spring festival (late April) features a traditional Doburoku sake offering",
            "Pair with a visit to the Hida Folk Village (Hida no Sato) in Takayama",
            "The quiet rural setting is a welcome contrast to Takayama's tourist crowds"
        ],
        bestSeason: "Late April (spring festival), November (autumn foliage in cedar forest)",
        access: "Hida-Ichinomiya Station (JR Takayama Line), 5 min walk",
        hours: "Open 24 hours (shrine office 8:30-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000314")!,
        name: "Hakusan Heisenji",
        address: "6-21 Heisenji, Katsuyama, Fukui",
        description: "Once a powerful temple-shrine complex with 6,000 monks and 8,000 warrior monks, Hakusan Heisenji was largely destroyed by fire in 1574 but its magnificent 500-meter stone-paved approach through a towering cedar forest survives — widely regarded as one of Japan's most beautiful temple approaches. The moss-covered stones and ancient trees create an almost mystical atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 36.0670, longitude: 136.5811),
        stampSlotId: 314,
        category: .jinja,
        tagline: "Japan's most beautiful moss-covered stone approach through ancient cedars",
        highlights: [
            "500-meter stone-paved approach — considered one of Japan's finest",
            "Ancient cedar trees creating a natural cathedral canopy",
            "Once housed 6,000 monks and 8,000 warrior monks",
            "Moss-covered stones and ruins of the former temple city"
        ],
        mustSee: "Walk the 500-meter stone approach slowly — the combination of 800-year-old cedars, moss-covered cobblestones, and filtered green light is one of the most atmospheric experiences in all of Japan.",
        tips: [
            "Visit after rain for the most vivid moss and a mystical misty atmosphere",
            "The nearby Katsuyama Dinosaur Museum is excellent if traveling with children",
            "Allow at least 1 hour to walk the approach at a contemplative pace",
            "The winter snow-covered approach is stunning but slippery — use caution"
        ],
        bestSeason: "June-July (rainy season: moss at its most vibrant), November (autumn color)",
        access: "Bus from Katsuyama Station (Echizen Railway) to Heisenji, 15 min",
        hours: "Open 24 hours (free access)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000315")!,
        name: "Kosoku-ji (Nozawa Onsen Yakushido)",
        address: "Nozawa Onsen Village, Shimotakai, Nagano",
        description: "The spiritual heart of Nozawa Onsen — one of Japan's most atmospheric hot spring villages — Kosoku-ji and its Yakushi-do hall have watched over the village's healing waters for centuries. The temple's fire festival (Dosojin Matsuri) in January is one of Japan's wildest: villagers build a massive wooden shrine and set it ablaze while 25-year-old men defend it from the flames.",
        coordinate: CLLocationCoordinate2D(latitude: 36.9215, longitude: 138.5790),
        stampSlotId: 315,
        category: .tera,
        tagline: "Guardian of healing hot springs and Japan's wildest fire festival",
        highlights: [
            "Dosojin Fire Festival (January 15) — one of Japan's most intense festivals",
            "Spiritual center of charming Nozawa Onsen hot spring village",
            "Yakushi-do hall dedicated to the Medicine Buddha of healing",
            "13 free public hot spring baths (soto-yu) throughout the village"
        ],
        mustSee: "If you can only attend one Japanese festival, make it the Dosojin Matsuri on January 15 — the sight of a massive wooden shrine ablaze against the night sky while villagers defend and attack it is pure, primal spectacle.",
        tips: [
            "The Dosojin Matsuri on January 15 is the must-see event — book months ahead",
            "Try all 13 free public onsen baths scattered through the village",
            "Nozawa is also an excellent ski resort — combine spiritual and skiing visits",
            "The Ogama natural cooking pool uses hot spring water to boil eggs and vegetables"
        ],
        bestSeason: "January 15 (Dosojin Fire Festival), January-March (skiing + onsen)",
        access: "Bus from Iiyama Station (Hokuriku Shinkansen) to Nozawa Onsen (25 min)",
        hours: "Open 24 hours (temple grounds)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Shikoku Pilgrimage (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000316")!,
        name: "Tairyu-ji (#21)",
        address: "Washino, Anan, Tokushima",
        description: "Perched at 618 meters on Mount Tairyu, temple #21 of the Shikoku 88 Pilgrimage is one of the circuit's most dramatically situated temples. Kobo Daishi practiced Gumonji meditation here, and the dense cedar forest and mountain mists create an otherworldly atmosphere. A modern ropeway now carries pilgrims up from the valley, offering spectacular views of the Anan coast.",
        coordinate: CLLocationCoordinate2D(latitude: 33.8617, longitude: 134.5689),
        stampSlotId: 316,
        category: .tera,
        tagline: "A mountaintop pilgrimage temple cloaked in mist and legend",
        highlights: [
            "Temple #21 of the Shikoku 88 — one of the most dramatic locations",
            "618-meter mountain summit with ropeway access",
            "Where Kobo Daishi practiced intense Gumonji meditation",
            "Ancient cedar forest shrouded in mystical mountain mist"
        ],
        mustSee: "Ride the ropeway up through the clouds on a misty morning — as you emerge above the fog into the cedar forest surrounding the temple, you understand why Kobo Daishi chose this spot for meditation.",
        tips: [
            "The ropeway is 2,775 meters long — one of western Japan's longest",
            "Walking pilgrims face a challenging 3-4 hour mountain climb",
            "Mountain weather changes quickly — bring a light rain jacket",
            "The temple stay (shukubo) offers an unforgettable mountain dawn experience"
        ],
        bestSeason: "May (fresh green), October-November (autumn colors), early morning mist year-round",
        access: "Ropeway from base station (20 min drive from Anan Station, JR Mugi Line)",
        hours: "7:00-17:00 (ropeway hours vary seasonally)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000317")!,
        name: "Iwamoto-ji (#37)",
        address: "3-13 Shigekuchicho, Shimanto, Kochi",
        description: "Temple #37 of the Shikoku 88, Iwamoto-ji is famous for its stunning ceiling paintings in the main hall — 575 panels painted by contemporary artists from across Japan, creating a dazzling overhead gallery in a sacred space. The temple sits in the Shimanto area, gateway to Japan's last clear-water river, and combines ancient pilgrimage tradition with modern artistic expression.",
        coordinate: CLLocationCoordinate2D(latitude: 33.0032, longitude: 132.9279),
        stampSlotId: 317,
        category: .tera,
        tagline: "575 ceiling paintings — a modern art gallery in an ancient temple",
        highlights: [
            "575 painted ceiling panels by contemporary artists from across Japan",
            "Temple #37 of the Shikoku 88 Pilgrimage",
            "Five principal deities — unusual for a Japanese temple",
            "Gateway to the Shimanto River region — Japan's last crystal-clear river"
        ],
        mustSee: "Lie on your back in the main hall and look up — the 575 ceiling panels range from traditional Buddhist imagery to playful modern art, creating one of the most unique sacred spaces in Japan.",
        tips: [
            "Spend time studying the ceiling panels — they include Marilyn Monroe and manga characters",
            "The nearby Shimanto River is perfect for a half-day canoeing side trip",
            "This is rural Shikoku — rental car recommended for flexibility",
            "The temple offers shukubo (temple stay) with excellent vegetarian cuisine"
        ],
        bestSeason: "Year-round (indoor ceiling paintings), June (fireflies along nearby Shimanto River)",
        access: "20 min walk from Kubokawa Station (JR Dosan Line/Tosa Kuroshio Railway)",
        hours: "8:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000318")!,
        name: "Zentsu-ji (#75)",
        address: "3-3-1 Zentsujicho, Zentsuji, Kagawa",
        description: "The birthplace of Kobo Daishi (Kukai) himself, Zentsu-ji is the most spiritually significant of all 88 pilgrimage temples and one of Shingon Buddhism's holiest sites. The massive complex includes the largest five-story pagoda in the pilgrimage circuit, and the underground Kaidan Meguri — a pitch-dark passageway beneath the main hall — is a profound meditation on faith and surrender.",
        coordinate: CLLocationCoordinate2D(latitude: 34.2266, longitude: 133.7797),
        stampSlotId: 318,
        category: .tera,
        tagline: "Birthplace of Kobo Daishi — the holiest of the 88 temples",
        highlights: [
            "Birthplace of Kobo Daishi, founder of Shingon Buddhism",
            "Largest five-story pagoda on the entire 88-temple circuit",
            "Underground Kaidan Meguri — walk in total darkness guided only by faith",
            "Temple #75 and one of Shingon's three holiest sites"
        ],
        mustSee: "The Kaidan Meguri — descend into the pitch-dark underground passage beneath the main hall, feeling your way along the wall with only a Buddhist mantra on your lips. Emerging into daylight feels like a rebirth.",
        tips: [
            "The underground Kaidan Meguri requires an additional ¥500 fee — absolutely worth it",
            "Allow 1-2 hours for the full complex — it's much larger than most pilgrimage temples",
            "The giant camphor tree in the precincts is over 1,000 years old",
            "Zentsuji city also has excellent udon — this is the heart of Sanuki udon country"
        ],
        bestSeason: "Year-round, April (cherry blossoms in the grounds)",
        access: "15 min walk from Zentsuji Station (JR Dosan Line)",
        hours: "7:00-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kyushu (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000319")!,
        name: "Sofuku-ji",
        address: "7-5 Kajiyamachi, Nagasaki",
        description: "Built in 1629 by Chinese residents of Nagasaki, Sofuku-ji is the finest example of Chinese Ming Dynasty temple architecture in Japan. The Daiippen (First Gate) and Daiohoden (Great Hero's Hall) are both national treasures, and the entire complex — painted in vivid vermillion and yellow — feels like stepping into southern China. The massive iron cauldron in the kitchen once cooked rice for 3,000 famine victims.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7422, longitude: 129.8845),
        stampSlotId: 319,
        category: .tera,
        tagline: "Ming Dynasty Chinese architecture in Nagasaki's hillside",
        highlights: [
            "Finest Ming Dynasty Chinese temple architecture in Japan",
            "Two National Treasure buildings — Daiippen and Daiohoden",
            "Massive iron cauldron that once fed 3,000 famine victims",
            "Vivid vermillion and yellow color scheme unique among Japanese temples"
        ],
        mustSee: "The Daiohoden (Great Hero's Hall) — its sweeping Chinese-style curved roof and vibrant color scheme are like nothing else in Japan. The architectural details reward close inspection.",
        tips: [
            "Part of Nagasaki's 'temple town' — combine with Kofuku-ji (another Chinese temple nearby)",
            "The hillside location offers views over Nagasaki's harbor",
            "The Obon Lantern Festival (August) at Nagasaki's Chinese temples is spectacular",
            "Try Nagasaki champon noodles at a nearby restaurant — the dish was born in this neighborhood"
        ],
        bestSeason: "Year-round, August (Obon Lantern Festival), February (Lantern Festival)",
        access: "Tram to Shokakuji-shita stop, then 5 min walk uphill",
        hours: "8:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000320")!,
        name: "Miyajidake Jinja",
        address: "7-1 Miyajidake, Fukutsu, Fukuoka",
        description: "Miyajidake Jinja is famous for its colossal shimenawa rope — one of the largest in Japan — and its dramatic 'Sunset Road' (Hikari no Michi) phenomenon. Twice a year, in February and October, the setting sun aligns perfectly with the shrine's long approach road, creating a golden pathway of light stretching from the shrine to the sea. The spectacle draws thousands of photographers.",
        coordinate: CLLocationCoordinate2D(latitude: 33.7831, longitude: 130.5044),
        stampSlotId: 320,
        category: .jinja,
        tagline: "Where the sunset creates a golden road from shrine to sea",
        highlights: [
            "Hikari no Michi — sunset aligning with the approach road twice yearly",
            "One of Japan's largest shimenawa sacred ropes (2.6 tons)",
            "Dramatic straight-line axis from hilltop shrine to the ocean",
            "Growing in popularity as one of Kyushu's most photogenic shrines"
        ],
        mustSee: "The Hikari no Michi sunset in late February or late October — the sun sets perfectly along the shrine's approach road, turning it into a golden river of light stretching to the ocean. A once-in-a-lifetime photograph.",
        tips: [
            "Hikari no Michi dates: approximately February 20-28 and October 14-22",
            "Arrive 1-2 hours before sunset to secure a good viewing position",
            "The phenomenon depends on clear weather — check the forecast",
            "The large shimenawa rope and shrine are worth visiting year-round"
        ],
        bestSeason: "Late February and late October (Hikari no Michi sunset alignment)",
        access: "Bus from Fukuma Station (JR Kagoshima Line) to Miyajidake Jinja-mae, 15 min",
        hours: "Open 24 hours (shrine office 8:30-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000321")!,
        name: "Suizenji Jokoen Izumi Jinja",
        address: "8-1 Suizenji Koen, Chuo, Kumamoto",
        description: "Within the exquisite Suizenji Jokoen garden — a Momoyama-era strolling garden with a miniature Mount Fuji — sits Izumi Jinja, relocated here from the old Kumamoto Castle grounds. The crystal-clear spring water that feeds the garden's pond is so pure it's designated a natural monument. The garden's miniature Tokaido road landscape, with its Fuji-shaped hill, is a masterpiece of Japanese garden art.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7862, longitude: 130.7330),
        stampSlotId: 321,
        category: .jinja,
        tagline: "A shrine within a garden with its own miniature Mount Fuji",
        highlights: [
            "Within Suizenji Jokoen — one of Japan's finest Momoyama-era gardens",
            "Miniature Mount Fuji hill representing the Tokaido road landscape",
            "Crystal-clear natural spring water feeding a pristine pond",
            "Shrine relocated from Kumamoto Castle grounds after the Meiji Restoration"
        ],
        mustSee: "The miniature Mount Fuji reflected in the spring-fed pond — the garden's designers recreated the 53 stations of the Tokaido road in miniature, and this Fuji is the centerpiece.",
        tips: [
            "Budget 1-1.5 hours for the combined garden and shrine visit",
            "The garden's pure spring water is drinkable — try it at the designated spot",
            "Morning visits offer the calmest water reflections for photography",
            "Combine with Kumamoto Castle and Shimada Museum in the same day"
        ],
        bestSeason: "Year-round (evergreen garden), March-April (cherry blossoms)",
        access: "Tram to Suizenji-Koen stop, then 3 min walk",
        hours: "7:30-18:00 (Mar-Nov), 8:30-17:00 (Dec-Feb)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000322")!,
        name: "Naminoue-gu",
        address: "1-25-11 Wakasa, Naha, Okinawa",
        description: "Perched on a dramatic cliff directly above the azure waters of Naminoue Beach, this is Okinawa's most important Shinto shrine and the only Ryukyu-era 'Officially Ranked Shrine' (Kansha). The jarring juxtaposition of a traditional shrine atop a coral cliff with a highway tunnel carved through the rock below and tropical surf at its feet makes it one of Japan's most uniquely situated sacred places.",
        coordinate: CLLocationCoordinate2D(latitude: 26.2192, longitude: 127.6686),
        stampSlotId: 322,
        category: .jinja,
        tagline: "Okinawa's holiest shrine on a cliff above tropical surf",
        highlights: [
            "Perched on a coral cliff above Naminoue Beach with ocean panorama",
            "Okinawa's highest-ranking and most important Shinto shrine",
            "Highway tunnel carved through the cliff directly beneath the shrine",
            "Unique blend of Ryukyuan and Japanese spiritual traditions"
        ],
        mustSee: "Stand at the shrine's cliff edge and look down at the turquoise surf below, then turn around to see the traditional shrine behind you — the collision of tropical beach and Shinto architecture is surreal.",
        tips: [
            "Combine shrine visit with swimming at Naminoue Beach right below",
            "Hatsumode (New Year) here draws enormous crowds — the biggest in Okinawa",
            "The shrine is walking distance from Naha's Kokusai-dori shopping street",
            "Try nearby Okinawan soba and blue seal ice cream after your visit"
        ],
        bestSeason: "Year-round (tropical climate), January (hatsumode), April-October (beach season)",
        access: "10 min walk from Asahibashi Station (Yui Rail monorail)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Western Honshu (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000323")!,
        name: "Hakuto Jinja",
        address: "603 Hakuto, Tottori",
        description: "Dedicated to the white rabbit deity from the famous myth 'Inaba no Shiro Usagi' (The White Rabbit of Inaba), Hakuto Jinja sits on a beautiful stretch of the Japan Sea coast near the beach where the myth is set. The rabbit helped Okuninushi win the heart of Princess Yakami, making this shrine Japan's premier destination for prayers of romantic success. Rabbit statues dot the grounds.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5303, longitude: 134.0839),
        stampSlotId: 323,
        category: .jinja,
        tagline: "Where Japan's famous White Rabbit played matchmaker",
        highlights: [
            "Enshrines the White Rabbit of Inaba — Japan's original matchmaker",
            "Scenic Japan Sea coast location on the mythological beach",
            "Adorable rabbit statues and rabbit-themed ema throughout",
            "Top shrine in Japan for romantic blessings rooted in mythology"
        ],
        mustSee: "The beach at the shrine's foot — Hakuto Coast — where the myth took place. Then walk through the shrine grounds and count all the rabbit statues hidden among the rocks and trees.",
        tips: [
            "The love-themed rabbit ema are popular souvenirs and gifts",
            "Hakuto Beach is also a great swimming beach in summer",
            "Combine with the Tottori Sand Dunes, just 10 minutes by car",
            "The shrine is small but atmospheric — 30 minutes is sufficient"
        ],
        bestSeason: "Year-round, summer (beach), February (Valentine's season prayers)",
        access: "Bus from Tottori Station to Hakuto Jinja-mae (20 min), or car",
        hours: "Open 24 hours (shrine office 9:00-16:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000324")!,
        name: "Taisanji",
        address: "1-1 Taisan, Kobe, Hyogo",
        description: "Founded in 716 AD on the slopes above Kobe, Taisan-ji's three-story pagoda is a National Treasure and one of the oldest wooden structures in the Kansai region. The temple occupies a peaceful hillside position overlooking Kobe harbor, offering sweeping views of the city and Osaka Bay. Its Shingon Buddhist heritage and mountain setting provide a welcome escape from urban Kobe.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6597, longitude: 135.1432),
        stampSlotId: 324,
        category: .tera,
        tagline: "A National Treasure pagoda overlooking Kobe harbor",
        highlights: [
            "Three-story pagoda — National Treasure from the Kamakura period",
            "Panoramic views of Kobe city and Osaka Bay",
            "Founded in 716 AD with deep Shingon Buddhist heritage",
            "Peaceful hillside forest setting above the busy city"
        ],
        mustSee: "The three-story pagoda — its elegant proportions and ancient woodwork make it one of the finest pagodas in western Japan. Frame it with the city and harbor views behind you.",
        tips: [
            "The approach is uphill through forest — comfortable shoes recommended",
            "Combine with a visit to Kobe's Nunobiki Herb Garden via ropeway nearby",
            "Far fewer tourists than Kyoto or Nara temples despite National Treasure status",
            "The temple hosts occasional night illumination events — check locally"
        ],
        bestSeason: "November (autumn foliage), April (cherry blossoms), clear days for views",
        access: "Bus from Shin-Kobe Station to Taisan-ji stop (15 min)",
        hours: "8:30-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000325")!,
        name: "Tottori Higashi Shorenji",
        address: "Mitoku, Misasa, Tottori",
        description: "Sanbutsu-ji, the temple complex on Mount Mitoku, is home to the Nageire-do — a small worship hall literally 'thrown' into a sheer cliff face. Designated a National Treasure, Nageire-do clings to the cliff approximately 100 meters above the ground and has survived there since the late Heian period. Reaching it requires climbing chains, roots, and bare rock — Japan's most dangerous National Treasure.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3836, longitude: 133.9094),
        stampSlotId: 325,
        category: .tera,
        tagline: "Japan's most dangerous National Treasure — a hall hurled into a cliff",
        highlights: [
            "Nageire-do — a worship hall embedded in a vertical cliff face",
            "National Treasure in one of Japan's most inaccessible locations",
            "Legend says Kobo Daishi threw it into the cliff with supernatural power",
            "Treacherous climb using chains, tree roots, and bare rock"
        ],
        mustSee: "The moment Nageire-do comes into view — after a grueling climb up the mountain, you turn a corner and see a delicate wooden hall impossibly perched on a vertical cliff. No photo prepares you for it.",
        tips: [
            "The climb is genuinely dangerous — rental straw sandals (waraji) grip better than sneakers",
            "Do NOT attempt in rain, snow, or strong wind — the rocks become lethal",
            "Register at the base temple and sign a safety disclaimer before climbing",
            "Nearby Misasa Onsen is one of the world's great radium hot springs — perfect recovery"
        ],
        bestSeason: "May-November (dry conditions for safe climbing), autumn foliage",
        access: "Bus from Kurayoshi Station (JR San'in Line) to Mitokusan, 40 min",
        hours: "8:00-15:00 (last entry for mountain climb)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000326")!,
        name: "Motonosumi Jinja",
        address: "498 Tsunoshima, Nagato, Yamaguchi",
        description: "Made internationally famous by CNN's '31 Most Beautiful Places in Japan,' Motonosumi Jinja features 123 vermillion torii gates cascading down a dramatic cliff to the Japan Sea coast. The unique challenge here: the offering box is placed at the top of the final torii, about 6 meters high — throw your coin up and in for your wish to come true. The ocean backdrop makes it one of Japan's most photogenic shrines.",
        coordinate: CLLocationCoordinate2D(latitude: 34.4230, longitude: 131.0619),
        stampSlotId: 326,
        category: .jinja,
        tagline: "123 torii gates tumbling down a sea cliff — CNN's most beautiful",
        highlights: [
            "123 vermillion torii gates cascading from cliff top to ocean shore",
            "CNN's '31 Most Beautiful Places in Japan' selection",
            "Offering box placed 6 meters high atop the final torii — toss your coin!",
            "Dramatic Japan Sea cliff-edge setting with crashing waves"
        ],
        mustSee: "The view looking down through the 123 torii gates to the crashing Japan Sea waves below — the vivid red against blue ocean is jaw-dropping. Then try your luck throwing a coin into the high-up offering box.",
        tips: [
            "Car access is strongly recommended — public transport to this remote coast is limited",
            "The coin-toss challenge is addictive — bring plenty of coins",
            "Morning sun illuminates the torii and ocean beautifully for photography",
            "Combine with nearby Tsunoshima Bridge — one of Japan's most scenic drives"
        ],
        bestSeason: "Year-round (best in clear weather), spring and autumn for mild temperatures",
        access: "Car from Nagato Station (JR San'in Line), 25 min. Limited bus service available",
        hours: "Open 24 hours (parking lot daylight hours)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Tokyo & Saitama (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000327")!,
        name: "Hikawa Jinja (Akasaka)",
        address: "6-10-12 Akasaka, Minato, Tokyo",
        description: "Not to be confused with Musashi Ichinomiya Hikawa in Saitama, Akasaka Hikawa Jinja is a distinguished Tokyo shrine with over 1,000 years of history, sitting quietly amid the modern skyscrapers of Akasaka. Despite being listed, this is the sister entry — featuring the stunning autumn ginkgo tunnel approach and its role as one of the 'Tokyo Ten Shrines' designated by the Tokugawa shogunate.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6699, longitude: 139.7378),
        stampSlotId: 327,
        category: .jinja,
        tagline: "A 1,000-year-old oasis amid Akasaka's skyscrapers",
        highlights: [
            "One of the 'Tokyo Ten Shrines' designated by the Tokugawa shogunate",
            "Golden ginkgo tree tunnel approach in late November",
            "Over 1,000 years of history in the heart of modern Tokyo",
            "Serene oasis surrounded by Akasaka's business district"
        ],
        mustSee: "The ginkgo-lined approach in late November — golden leaves create a luminous tunnel leading to the ancient shrine, with glass towers looming just beyond the treeline. Old and new Japan in one frame.",
        tips: [
            "Visit in late November for peak ginkgo golden color",
            "Combine with nearby Nogi Jinja and Roppongi for a Minato-ku shrine route",
            "The monthly 'good luck' markets on shrine grounds are worth catching",
            "Evening visits after work hours are peaceful — the shrine is beautifully lit"
        ],
        bestSeason: "Late November (ginkgo tunnel), June (ajisai hydrangeas)",
        access: "5 min walk from Akasaka Station (Chiyoda Line) or Roppongi-Itchome Station",
        hours: "6:00-17:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000328")!,
        name: "Yanaka Tennoji (Tenno-ji)",
        address: "7-14-8 Yanaka, Taito, Tokyo",
        description: "Standing at the heart of Yanaka — Tokyo's most atmospheric 'shitamachi' neighborhood — Tennoji is a Tendai temple surrounded by one of the city's most beautiful old cemeteries, filled with cherry trees and the graves of notable Edo-era figures. The area's preservation of old Tokyo charm, with narrow lanes, independent shops, and wandering cats, makes this a pilgrimage of a different kind.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7262, longitude: 139.7683),
        stampSlotId: 328,
        category: .tera,
        tagline: "The spiritual heart of Tokyo's most nostalgic neighborhood",
        highlights: [
            "Center of atmospheric Yanaka — old Tokyo's best-preserved neighborhood",
            "Cherry blossom-filled cemetery with graves of notable Edo figures",
            "Five-story pagoda site (original burned in 1957, foundation remains)",
            "Starting point for the famous Yanaka Ginza shopping street"
        ],
        mustSee: "Walk through Yanaka Cemetery in cherry blossom season — the sakura canopy over the ancient paths, with old Tokyo's rooftops visible through the trees, is a time-traveling experience.",
        tips: [
            "Combine with Yanaka Ginza shopping street and its famous 'sunset steps'",
            "The neighborhood cats are a beloved feature — look for the cat-themed shops",
            "Walk from Nippori Station through the cemetery to the temple for the best approach",
            "Try menchi-katsu (fried meat croquette) from the Yanaka Ginza street vendors"
        ],
        bestSeason: "Late March-early April (cemetery cherry blossoms), November (autumn maples)",
        access: "5 min walk from Nippori Station (JR/Keisei) through Yanaka Cemetery",
        hours: "6:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000329")!,
        name: "Chichibu Imamiya Jinja",
        address: "8-3 Nakamachi, Chichibu, Saitama",
        description: "Known as the 'Dragon God Shrine,' Chichibu Imamiya Jinja centers on an ancient spring that has never dried up in 1,600 years, believed to be guarded by a dragon deity. The shrine uniquely blends Shinto and Buddhist elements and is famous for its 'dragon tree' — a towering zelkova said to house the dragon god. It's a key power spot in the Chichibu spiritual region.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9927, longitude: 139.0834),
        stampSlotId: 329,
        category: .jinja,
        tagline: "An eternal spring guarded by the dragon deity of Chichibu",
        highlights: [
            "Sacred spring that has flowed continuously for 1,600 years",
            "Dragon God (Ryujin) worship centered on an ancient zelkova tree",
            "Unique Shinto-Buddhist syncretic traditions preserved here",
            "Key power spot in the spiritually rich Chichibu region"
        ],
        mustSee: "Touch the sacred 'dragon tree' and then visit the eternal spring — the combination of flowing water and ancient tree in this small urban shrine creates surprisingly powerful spiritual energy.",
        tips: [
            "Part of the Chichibu pilgrimage route — combine with Chichibu Jinja and Mitsumine",
            "The dragon tree hug is believed to grant vitality and good fortune",
            "The Chichibu Night Festival (December 2-3) is one of Japan's top float festivals",
            "Try Chichibu's local specialty: waraji-katsudon (giant pork cutlet rice bowl)"
        ],
        bestSeason: "Year-round (eternal spring), December (Chichibu Night Festival nearby)",
        access: "10 min walk from Chichibu Station (Seibu Railway)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Osaka & Hyogo (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000330")!,
        name: "Katsuoji",
        address: "2914-1 Awano, Minoh, Osaka",
        description: "The 'Victory Temple' of Minoh city, Katsuoji is famous for its thousands of Daruma dolls — offered by visitors who've achieved their goals — scattered across every surface of the temple grounds. The temple's name literally means 'winning luck temple,' and it has become one of Osaka's most instagrammable temples thanks to the sea of red Daruma faces staring from walls, rooftops, and garden corners.",
        coordinate: CLLocationCoordinate2D(latitude: 34.8595, longitude: 135.5091),
        stampSlotId: 330,
        category: .tera,
        tagline: "Thousands of Daruma dolls celebrate victories across the grounds",
        highlights: [
            "Thousands of Daruma dolls covering every surface of the grounds",
            "Name means 'Victory Temple' — popular for prayers before competitions",
            "Beautiful mountain setting in the Minoh hills above Osaka",
            "Seasonal illumination events transform the Daruma-covered grounds"
        ],
        mustSee: "The fields of Daruma dolls — they're everywhere: on walls, tucked into garden corners, sitting on stone lanterns. Each one represents someone's achieved dream. The cumulative effect is joyful and surreal.",
        tips: [
            "Buy a blank Daruma, paint one eye, and return it when your goal is achieved",
            "Combine with Minoh Waterfall — one of Osaka's best nature walks (30 min hike)",
            "Autumn illumination events with the Daruma dolls lit up are spectacular",
            "Access is easiest by car or bus from Minoh Station — the temple is in the mountains"
        ],
        bestSeason: "November (autumn foliage + illumination), Year-round for Daruma viewing",
        access: "Bus from Minoh Station (Hankyu) to Katsuoji, 30 min",
        hours: "8:00-17:00 (Sat-Sun until 17:30, extended hours during illumination events)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000331")!,
        name: "Ishikiri Tsurugiya Jinja",
        address: "1-1-1 Higashi-Ishikiri, Higashi-Osaka, Osaka",
        description: "Beloved by Osaka locals as 'Ishikiri-san,' this shrine at the base of Mount Ikoma is famous for its power to 'cut through stones and tumors' — making it one of Japan's most popular shrines for prayers against illness. The animated shopping street (sando) leading to the shrine is packed with fortune tellers, traditional sweet shops, and the distinctive energy of old Osaka.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6787, longitude: 135.6553),
        stampSlotId: 331,
        category: .jinja,
        tagline: "Osaka's beloved healing shrine with a fortune-teller-filled approach",
        highlights: [
            "Revered for power against illness — 'cutting through stones and tumors'",
            "Vibrant sando shopping street with fortune tellers and old Osaka atmosphere",
            "Hyakudo-mairi walking prayer circuit for urgent wishes",
            "Deep connection to everyday Osaka working-class spiritual life"
        ],
        mustSee: "Watch the hyakudo-mairi — devotees walking back and forth between two stone markers 100 times, counting on a string of beads, praying with intense focus. It's a moving display of faith.",
        tips: [
            "Walk the sando approach street for its old-school Osaka charm and street food",
            "Many fortune tellers along the sando are legendary — try a reading if you speak Japanese",
            "The shrine is at the base of Mount Ikoma — hike up for views of Osaka and Nara",
            "Visit on the 18th of any month for the special ennichi market day"
        ],
        bestSeason: "Year-round, monthly ennichi market on the 18th",
        access: "5 min walk from Ishikiri Station (Kintetsu Nara Line)",
        hours: "Open 24 hours (shrine office 8:00-16:30)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Famous Islands & Remote
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000332")!,
        name: "Sado Kokubunji",
        address: "508 Kokubu-ji, Sado, Niigata",
        description: "On Sado Island — once a place of exile for emperors, poets, and disgraced nobles — Kokubunji was established in the 8th century as part of the national temple network. The temple sits amid rice paddies with a peaceful rural charm, and the island's unique culture — shaped by centuries of exiled aristocrats bringing Kyoto refinement to a remote island — makes Sado one of Japan's most culturally rich destinations.",
        coordinate: CLLocationCoordinate2D(latitude: 38.0132, longitude: 138.3721),
        stampSlotId: 332,
        category: .tera,
        tagline: "An ancient temple on the island of exiled emperors and poets",
        highlights: [
            "8th-century national temple on culturally rich Sado Island",
            "Sado's exile culture brought Kyoto refinement to a remote island",
            "Peaceful rice paddy setting with old-Japan rural atmosphere",
            "Near Sado's gold mine and traditional tarai-bune tub boat areas"
        ],
        mustSee: "The temple's serene rice-paddy setting — then explore Sado Island's remarkable cultural legacy: Noh theater stages (over 30 on the island), the gold mine, and traditional tub boats.",
        tips: [
            "Sado requires a 2.5-hour ferry from Niigata or 1-hour jetfoil",
            "Plan at least 2 days on Sado — the island has much more than this temple",
            "The Earth Celebration (Kodo taiko festival) in August is world-famous",
            "Rent a car on the island — public transport is limited"
        ],
        bestSeason: "August (Earth Celebration), June (rice paddies green), autumn",
        access: "Ferry from Niigata Port to Ryotsu (1-2.5 hours), then car/bus to temple",
        hours: "Open daylight hours (free access to grounds)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000333")!,
        name: "Kumano Nachi Taisha Hiro Jinja",
        address: "1 Nachisan, Nachikatsuura, Wakayama",
        description: "Adjacent to the main Kumano Nachi Taisha, Hiro Jinja (also known as the subordinate Nachi shrine) is dedicated to the deity of fire prevention and maritime safety. Positioned to offer the classic view of the three-story pagoda with Nachi Falls (133m) cascading behind it, this viewpoint has become one of the most iconic images of Japan — sacred architecture framed by nature's raw power.",
        coordinate: CLLocationCoordinate2D(latitude: 33.6666, longitude: 135.8914),
        stampSlotId: 333,
        category: .jinja,
        tagline: "The iconic view: a pagoda with Japan's tallest waterfall behind",
        highlights: [
            "Japan's most iconic photograph: pagoda with 133m Nachi Falls behind",
            "Adjacent to World Heritage Kumano Nachi Taisha",
            "Part of the sacred Kumano Sanzan pilgrimage network",
            "Nachi Falls — Japan's tallest single-drop waterfall at 133 meters"
        ],
        mustSee: "The viewpoint where the three-story pagoda frames Nachi Falls behind it — this single image appears in every Japan travel book for good reason. Arrive early morning for the best light and fewer people.",
        tips: [
            "The classic photo viewpoint is from the approach path to Seiganto-ji temple",
            "Walk down to the base of Nachi Falls for a separate ¥300 viewing area",
            "Part of the Kumano Kodo pilgrimage — the Daimon-zaka stone stairway approach is stunning",
            "Allow a full day for Nachi area: falls, shrines, temples, and the Daimon-zaka walk"
        ],
        bestSeason: "Year-round (the falls are always flowing), June (lush green), November (autumn)",
        access: "Bus from Nachi Station (JR Kisei Line) to Nachi-no-Taki-mae (30 min)",
        hours: "7:00-16:30",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Nagoya & Tokai (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000334")!,
        name: "Ise Jingu Geku (Outer Shrine)",
        address: "279 Toyokawacho, Ise, Mie",
        description: "The Outer Shrine (Geku) of Ise Jingu is dedicated to Toyouke-no-Omikami, the deity of food, clothing, and shelter — the practical foundations of human life. Pilgrims traditionally visit Geku before Naiku (Inner Shrine), walking through pristine gravel paths beneath towering cryptomeria cedars. The buildings are rebuilt every 20 years in an unbroken tradition stretching back 1,300 years.",
        coordinate: CLLocationCoordinate2D(latitude: 34.4875, longitude: 136.7037),
        stampSlotId: 334,
        category: .jingu,
        tagline: "The first stop of Japan's holiest pilgrimage — deity of sustenance",
        highlights: [
            "Outer Shrine of Ise Jingu — Japan's most sacred Shinto complex",
            "Dedicated to Toyouke, deity of food, clothing, and shelter",
            "Rebuilt every 20 years (Shikinen Sengu) — next in 2033",
            "Pristine sacred forest with centuries-old cryptomeria cedars"
        ],
        mustSee: "The main sanctuary — even though you can only see the outer fences (the inner sanctum is hidden), the simple cypress architecture and enormous cedars create an overwhelming sense of the sacred.",
        tips: [
            "Traditional pilgrimage etiquette: visit Geku (outer) BEFORE Naiku (inner)",
            "Photography is restricted near the main sanctuary — check signs",
            "The Sengukan Museum near Geku explains the 20-year rebuilding tradition",
            "Ise udon (thick, soft noodles in dark broth) is the traditional pilgrim's meal"
        ],
        bestSeason: "Year-round, early morning for the most spiritual atmosphere",
        access: "5 min walk from Iseshi Station (JR/Kintetsu)",
        hours: "5:00-18:00 (Jan-Apr, Sep), 5:00-19:00 (May-Aug), 5:00-17:00 (Oct-Dec)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000335")!,
        name: "Tsubaki Grand Shrine (Tsubaki Okamiyashiro)",
        address: "2154 Yamanochō, Suzuka, Mie",
        description: "Tsubaki Grand Shrine is the head shrine dedicated to Sarutahiko-no-Okami — the deity who guided the sun goddess's grandson to earth and is revered as the guardian of crossroads and new beginnings. As Japan's oldest shrine by some accounts, it holds deep significance for those starting new ventures. The forested grounds include a sacred waterfall used for misogi (purification) rituals.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9261, longitude: 136.4458),
        stampSlotId: 335,
        category: .jinja,
        tagline: "Japan's crossroads deity — where new journeys begin",
        highlights: [
            "Head shrine of Sarutahiko — deity of guidance and new beginnings",
            "One of the oldest shrines in Japan with ancient worship traditions",
            "Sacred waterfall for misogi (cold-water purification) rituals",
            "English-friendly — has an active international outreach program"
        ],
        mustSee: "The misogi waterfall purification — if you're brave enough, ask about participating in the cold-water standing meditation beneath the sacred falls. Otherwise, the forested approach is deeply calming.",
        tips: [
            "One of Japan's most foreigner-friendly shrines — English materials available",
            "Misogi purification experiences can be arranged — inquire at the shrine office",
            "Combine with Suzuka Circuit if you're a motorsport fan",
            "The New Year period draws huge crowds for hatsumode"
        ],
        bestSeason: "Year-round, January (hatsumode), June (purification season)",
        access: "Bus from Suzuka Station (Kintetsu) to Tsubaki-Okamiyashiro-mae (20 min)",
        hours: "Open 24 hours (shrine office 8:00-17:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Unique & Iconic (additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000336")!,
        name: "Zeniarai Benzaiten Ugafuku Jinja",
        address: "2-25-16 Sasuke, Kamakura, Kanagawa",
        description: "Hidden in a cave-riddled hillside in Kamakura's western outskirts, Zeniarai Benten is one of Japan's most unique shrines — visitors wash their money in the cave spring water, which is believed to double or triple it. Founded after Minamoto no Yoritomo received a divine revelation in a dream, the shrine's tunnel entrance and candlelit cave interior create an unforgettable atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3246, longitude: 139.5397),
        stampSlotId: 336,
        category: .jinja,
        tagline: "Wash your money in sacred cave water to multiply your fortune",
        highlights: [
            "Wash money in cave spring water to multiply your wealth",
            "Dramatic cave entrance through a tunnel carved in rock",
            "Candlelit cave interior with flowing sacred spring water",
            "Founded on a dream revelation to Minamoto no Yoritomo"
        ],
        mustSee: "Bring bills and coins to wash in the cave spring — the sight of yen notes drying on bamboo racks while candles flicker in the cave is uniquely Japanese and completely charming.",
        tips: [
            "Bring money you plan to spend soon — washed money should be circulated, not hoarded",
            "The approach through the rock tunnel sets the mood perfectly",
            "Combine with the Great Buddha (Kotoku-in) and Hase-dera — all within walking distance",
            "Weekends are crowded — the small cave gets congested. Visit weekday mornings"
        ],
        bestSeason: "Year-round (the cave is climate-controlled by nature)",
        access: "25 min walk from Kamakura Station (JR) through residential streets",
        hours: "8:00-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000337")!,
        name: "Goshanotaki Jinja (Noboribetsu)",
        address: "1 Noboribetsu Onsencho, Noboribetsu, Hokkaido",
        description: "At the edge of Noboribetsu's famous Jigokudani (Hell Valley) — a volcanic crater reeking of sulfur with boiling streams and fumaroles — sits a small but striking shrine guarding the entrance to the underworld. The contrast between the peaceful red shrine gate and the apocalyptic volcanic landscape behind it is one of Hokkaido's most dramatic photo opportunities.",
        coordinate: CLLocationCoordinate2D(latitude: 42.4930, longitude: 141.1577),
        stampSlotId: 337,
        category: .jinja,
        tagline: "A guardian shrine at the gates of Hell Valley",
        highlights: [
            "Dramatically positioned at the edge of volcanic Jigokudani (Hell Valley)",
            "Sulfurous steam and boiling streams create an otherworldly backdrop",
            "Red torii gate contrasting with the gray volcanic wasteland",
            "Guards Noboribetsu Onsen — one of Japan's greatest hot spring towns"
        ],
        mustSee: "The view from the shrine looking into Hell Valley — sulfurous steam rises from the earth, the ground is scorched gray and yellow, and the tiny red shrine stands at the border between worlds.",
        tips: [
            "Walk the Hell Valley boardwalk trail (600m) for the full volcanic experience",
            "Soak in Noboribetsu's onsen afterward — Dai-ichi Takimotokan has 35 different baths",
            "The area occasionally smells strongly of sulfur — this is normal and safe",
            "Bear in mind Hokkaido brown bears live in the surrounding forests — stay on paths"
        ],
        bestSeason: "Year-round (volcanic activity never stops), winter (snow against steam is dramatic)",
        access: "Bus from Noboribetsu Station (JR) to Noboribetsu Onsen (15 min), then 10 min walk",
        hours: "Open 24 hours (Hell Valley walkway dawn to dusk)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000338")!,
        name: "Suwa Taisha Kamisha Honmiya",
        address: "1 Nakasu, Suwa, Nagano",
        description: "The oldest shrine in Nagano and one of the oldest in all of Japan, Suwa Taisha's Upper Shrine Honmiya is renowned for its massive Onbashira pillars — entire tree trunks dragged down mountains and erected at the shrine's corners in a legendary festival held every six years. The Onbashira Festival, where men ride logs down steep mountainsides, is considered Japan's most dangerous festival.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9989, longitude: 138.1144),
        stampSlotId: 338,
        category: .taisha,
        tagline: "Home of Japan's most dangerous festival — riding logs down mountains",
        highlights: [
            "Onbashira Festival — Japan's most dangerous, held every 6 years (next: 2028)",
            "Massive sacred pillars (onbashira) erected at each corner of the shrine",
            "One of the oldest shrines in Japan with unique architectural traditions",
            "No main hall (honden) — worships the mountain behind it directly"
        ],
        mustSee: "The four massive onbashira pillars at the shrine's corners — each is a single tree trunk, 17m tall, dragged and erected by hundreds of men. They're replaced every 6 years in the legendary festival.",
        tips: [
            "The Onbashira Festival is held in Years of the Tiger and Monkey — next in 2028",
            "Suwa Taisha has four separate shrine buildings around Lake Suwa — try to visit all four",
            "The hot springs in Suwa (Kami-Suwa Onsen) are excellent and uncrowded",
            "Lake Suwa's 'God's Crossing' ice ridge in winter is a famous natural phenomenon"
        ],
        bestSeason: "April-May 2028 (next Onbashira Festival), Year-round",
        access: "15 min walk from Kami-Suwa Station (JR Chuo Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000339")!,
        name: "Fushimi Momoyama Goryō",
        address: "179 Momoyama-chō Furujōnai, Fushimi, Kyoto",
        description: "The mausoleum of Emperor Meiji — who led Japan's transformation from a feudal society to a modern nation — occupies the site of Fushimi Castle, where Toyotomi Hideyoshi once held court. The vast, solemn approach through a forest of Japanese cedars leads to a simple grass-covered tumulus, embodying the Shinto ideal that even the most powerful return to nature. Virtually tourist-free.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9359, longitude: 135.7942),
        stampSlotId: 339,
        category: .jingu,
        tagline: "Emperor Meiji's forest mausoleum on Hideyoshi's castle grounds",
        highlights: [
            "Mausoleum of Emperor Meiji on the former site of Fushimi Castle",
            "Vast, forest-lined approach creating a profound sense of reverence",
            "Simple grass tumulus embodying Shinto's return-to-nature philosophy",
            "Almost no tourists despite enormous historical significance"
        ],
        mustSee: "The approach — a long, straight gravel path through towering cedars in absolute silence. At the end, the simple grass mound of Emperor Meiji's tomb is profoundly moving in its humility.",
        tips: [
            "Extremely few visitors — one of Kyoto's most peaceful sacred spaces",
            "The site offers views across southern Kyoto on clear days",
            "Combine with nearby Fushimi sake breweries for a unique Fushimi day trip",
            "The 230-step stone staircase to the tomb rewards with contemplative silence"
        ],
        bestSeason: "Year-round, especially clear autumn and winter days",
        access: "15 min walk from Momoyama Station (JR Nara Line) or Momoyama-Goryo-mae Station (Kintetsu)",
        hours: "8:30-17:00 (last entry 16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000340")!,
        name: "Takachiho Amano Yasukawara",
        address: "1073-1 Mitai, Takachiho, Miyazaki",
        description: "Within the sacred gorge of Takachiho — where Japanese mythology says the sun goddess Amaterasu hid in a cave, plunging the world into darkness — Amano Yasukawara is the cave where the eight million gods gathered to devise a plan to lure her out. Today, visitors stack small stones into cairns at the cave's entrance, creating a haunting landscape of thousands of prayer-stone towers.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7617, longitude: 131.3523),
        stampSlotId: 340,
        category: .jinja,
        tagline: "The cave where eight million gods conspired to restore sunlight",
        highlights: [
            "Cave where the gods gathered to lure Amaterasu from hiding",
            "Thousands of stacked prayer-stone cairns creating a haunting atmosphere",
            "Within the sacred Takachiho Gorge — Japan's mythology heartland",
            "One of the most spiritually powerful sites in all of Shinto"
        ],
        mustSee: "Enter the cave and let your eyes adjust — thousands of small stone towers, stacked by countless visitors, fill the cave floor and ledges. The effect is eerie, beautiful, and deeply moving. Stack your own stones and make a wish.",
        tips: [
            "The cave is a 10-minute walk from Amano Iwato Jinja along the river path",
            "Combine with rowboat ride through Takachiho Gorge — a must-do activity",
            "The Yokagura night dance performances (November-February) recreate the Amaterasu myth",
            "Takachiho is remote — car or bus from Kumamoto or Nobeoka required"
        ],
        bestSeason: "Year-round, November-February (Yokagura performances), autumn foliage",
        access: "Bus from Takachiho Bus Center (10 min), or 30 min walk from town center",
        hours: "Open 24 hours (free access)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Famous Shrines & Temples (341-400)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000341")!,
        name: "Joruri-ji",
        address: "40 Nishio Kamibatake, Kizugawa, Kyoto",
        description: "Hidden in a quiet valley on the Kyoto-Nara border, Joruri-ji preserves the only surviving set of nine Amida Buddha statues from the Heian period — a breathtaking row of gilded figures gazing across a paradise garden pond. The scene recreates the Pure Land paradise exactly as medieval worshippers imagined it.",
        coordinate: CLLocationCoordinate2D(latitude: 34.7236, longitude: 135.9053),
        stampSlotId: 341,
        category: .tera,
        tagline: "Nine golden Buddhas gazing across a paradise garden",
        highlights: [
            "Nine Amida statues — the only complete set surviving from the Heian era",
            "Paradise garden pond reflecting the Buddha hall",
            "National Treasure main hall dating to 1107",
            "Peaceful rural setting far from tourist crowds"
        ],
        mustSee: "Stand at the pond's edge facing the nine Amida statues aligned in the hall across the water. In the late afternoon light, the gilded figures seem to glow — this is the Pure Land paradise made tangible.",
        tips: [
            "Very remote — accessible by community bus from Kamo Station (JR Nara Line)",
            "Combine with nearby Iwafune-ji and the stone Buddha trail",
            "Photography is not allowed inside the main hall",
            "Allow extra travel time — buses run infrequently"
        ],
        bestSeason: "Year-round, spring cherry blossoms and autumn foliage are stunning",
        access: "Community bus from JR Kamo Station (about 20 min), then short walk",
        hours: "9:00-17:00 (March-November), 10:00-16:00 (December-February)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000342")!,
        name: "Kozanji",
        address: "8 Toganoocho, Umegahata, Ukyo, Kyoto",
        description: "A UNESCO World Heritage mountain temple famed for the Choju-giga — medieval picture scrolls of frolicking animals often called Japan's first manga. Nestled in the cedar forests of Takao, Kozanji was founded by the monk Myoe, who brought tea cultivation to Japan. The autumn foliage here is among Kyoto's finest.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0583, longitude: 135.6736),
        stampSlotId: 342,
        category: .tera,
        tagline: "Birthplace of Japan's first manga and Japanese tea culture",
        highlights: [
            "Home of Choju-giga — whimsical animal scrolls considered Japan's first manga",
            "UNESCO World Heritage Site in the forested Takao mountains",
            "Japan's oldest tea garden, planted by monk Myoe in the 13th century",
            "Spectacular autumn foliage rivaling Tofuku-ji"
        ],
        mustSee: "The Sekisui-in tea house — a National Treasure built in the Kamakura period — offers views over the forested valley. The original Choju-giga scrolls are in Tokyo and Kyoto national museums, but fine reproductions are displayed here.",
        tips: [
            "Combine with nearby Jingo-ji and Saimyo-ji for a full Takao temple walk",
            "Autumn (mid-November) is peak season — arrive early to avoid crowds",
            "The JR bus from Kyoto Station to Takao takes about 50 minutes",
            "The tea garden is a short walk uphill from the main temple"
        ],
        bestSeason: "Mid-November for peak autumn foliage, spring for fresh greenery",
        access: "JR Bus from Kyoto Station to Toganoo stop (50 min)",
        hours: "8:30-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000343")!,
        name: "Ujigami Jinja",
        address: "Uji Yamada, Uji, Kyoto",
        description: "The oldest surviving shrine building in Japan, dating to approximately 1060 AD. This unassuming UNESCO World Heritage Site sits quietly across the river from the famous Byodo-in, yet most visitors walk right past it. The simple, weathered cypress-bark roof and ancient timber frame represent pure Shinto architecture before Chinese influence.",
        coordinate: CLLocationCoordinate2D(latitude: 34.8928, longitude: 135.8125),
        stampSlotId: 343,
        category: .jinja,
        tagline: "Japan's oldest surviving shrine — a thousand years of quiet devotion",
        highlights: [
            "Japan's oldest extant shrine building, dating to approximately 1060 AD",
            "UNESCO World Heritage Site alongside Byodo-in",
            "Pure Japanese architectural style with cypress-bark roof",
            "Kirihara-mizu spring — one of Uji's seven famous springs"
        ],
        mustSee: "The main hall's simplicity is its power. Look closely at the ancient timber joints and weathered cypress bark — this building has stood for nearly a millennium with no nails, through earthquakes and wars.",
        tips: [
            "Just a 10-minute walk from Byodo-in — easily combined",
            "Uji is famous for matcha — stop at a tea house along the river",
            "Very few visitors despite World Heritage status — enjoy the solitude",
            "The nearby Uji River walk is beautiful in any season"
        ],
        bestSeason: "Year-round, spring wisteria and autumn foliage add color",
        access: "15 min walk from Keihan Uji Station or JR Uji Station",
        hours: "9:00-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000344")!,
        name: "Matsunoo Taisha",
        address: "3 Arashiyama Miyamachi, Nishikyo, Kyoto",
        description: "One of Kyoto's oldest shrines, established in 701 AD and long revered as the guardian deity of sake brewing. Every sake brewery in Japan displays a Matsunoo Taisha talisman. The shrine's garden, designed by modern landscape master Shigemori Mirei, is a striking fusion of ancient faith and contemporary art.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0003, longitude: 135.6852),
        stampSlotId: 344,
        category: .taisha,
        tagline: "Guardian deity of sake — where brewers pray for perfect fermentation",
        highlights: [
            "Japan's foremost shrine for sake brewing, revered by every brewery",
            "Shigemori Mirei's stunning modern garden trilogy within the shrine",
            "Founded in 701 AD — one of Kyoto's oldest shrines",
            "Sacred spring water (Kamenoi) said to ensure good fermentation"
        ],
        mustSee: "The three gardens by Shigemori Mirei — the Curved Stream Garden, the Ancient Mound Garden, and the Horai Garden — are masterworks of modern Japanese landscape design, dramatically different from traditional temple gardens.",
        tips: [
            "Sake barrels line the approach — look for your favorite brewery's offering",
            "The sacred spring Kamenoi is free to taste — bring a bottle",
            "Easily combined with Arashiyama sightseeing (one stop away)",
            "The shrine festival in April features sake tastings"
        ],
        bestSeason: "April (Sake Festival and cherry blossoms), November (autumn foliage)",
        access: "1 min walk from Hankyu Matsuo-Taisha Station",
        hours: "9:00-16:00 (weekdays), 9:00-16:30 (weekends)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000345")!,
        name: "Rokkaku-do",
        address: "248 Donomaecho, Nakagyo, Kyoto",
        description: "This small hexagonal temple in the heart of Kyoto's downtown is considered the birthplace of ikebana — the Japanese art of flower arrangement. The Ikenobo school, the world's oldest and most prestigious ikebana tradition, has been headquartered here for over 550 years. A weeping willow in the courtyard is said to have helped Emperor Saga find his bride.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0081, longitude: 135.7628),
        stampSlotId: 345,
        category: .tera,
        tagline: "Birthplace of ikebana — where flowers became an art form",
        highlights: [
            "Birthplace of ikebana (Japanese flower arrangement) — Ikenobo school since 1462",
            "Unique hexagonal main hall — the source of its name",
            "The matchmaking willow tree tied to an imperial love story",
            "Downtown location amid Kyoto's traditional shopping streets"
        ],
        mustSee: "The hexagonal main hall is compact but perfectly proportioned. Visit the Ikenobo gallery next door to see stunning seasonal ikebana displays that continue a tradition begun here over five centuries ago.",
        tips: [
            "Free to visit and centrally located — easy to drop in while shopping",
            "The Ikenobo headquarters next door sometimes offers exhibitions",
            "Look for the navel stone (hesoseki) — said to mark Kyoto's exact center",
            "Combine with Nishiki Market, just a few blocks south"
        ],
        bestSeason: "Year-round, spring for the weeping willow in bloom",
        access: "5 min walk from Karasuma-Oike Station (Subway Karasuma/Tozai Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000346")!,
        name: "Mibu-dera",
        address: "31 Mibunaginomiyacho, Nakagyo, Kyoto",
        description: "A temple forever linked to the Shinsengumi — the fearsome samurai police force of the Bakumatsu era. Mibu-dera served as their training ground, and the graves of several members rest here. The temple is also famous for Mibu Kyogen — wordless comic plays performed in April with masks and slapstick, a 700-year tradition.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0028, longitude: 135.7444),
        stampSlotId: 346,
        category: .tera,
        tagline: "Training ground of the Shinsengumi and home of silent comedy",
        highlights: [
            "Headquarters and training ground of the legendary Shinsengumi",
            "Graves of Shinsengumi members including Serizawa Kamo",
            "Mibu Kyogen — 700-year-old wordless comic plays (April and October)",
            "Jizo Bodhisattva hall with over 1,000 stone statues"
        ],
        mustSee: "Visit the Shinsengumi memorial — the Mibu Tomb where fallen members rest. During Mibu Kyogen season (April), watch the masked silent plays performed on an outdoor stage, a tradition unchanged for seven centuries.",
        tips: [
            "Shinsengumi fans should also visit nearby Yagi House — their actual headquarters",
            "Mibu Kyogen performances are free during the spring festival (April 21-29)",
            "The autumn Kyogen performances in October are less crowded",
            "A short walk from the Nijo Castle area"
        ],
        bestSeason: "April (Mibu Kyogen festival), October (autumn Kyogen)",
        access: "10 min walk from Hankyu Omiya Station or bus to Mibu-dera-michi stop",
        hours: "8:30-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000347")!,
        name: "Sanzenin",
        address: "540 Ohara Raikoincho, Sakyo, Kyoto",
        description: "Deep in the mountain village of Ohara, Sanzenin is a Tendai Buddhist temple famous for its moss garden — a velvet carpet of green dotted with tiny stone jizo statues peeking through the moss like forest sprites. The Amida trinity inside the main hall features a rare seated Amida flanked by attendants leaning forward, ready to welcome the dying to paradise.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1203, longitude: 135.8350),
        stampSlotId: 347,
        category: .tera,
        tagline: "A moss-garden paradise with tiny jizo hiding among the green",
        highlights: [
            "Yusei-en moss garden — one of Japan's most photogenic garden scenes",
            "Tiny warabe jizo statues peeking through emerald moss",
            "Amida trinity with uniquely forward-leaning attendant Bodhisattvas",
            "Remote Ohara mountain village atmosphere far from urban Kyoto"
        ],
        mustSee: "The moss garden (Yusei-en) after rain is unforgettable — the green intensifies to an almost electric hue, and the tiny stone jizo statues seem to emerge from the moss like woodland spirits. Bring a macro lens.",
        tips: [
            "Best after rain when the moss is at its most vivid green",
            "Combine with nearby Jakko-in for a full Ohara day trip",
            "Kyoto Bus #17 from Kyoto Station to Ohara takes about 1 hour",
            "Ohara's shiso (perilla) is famous — try shiso ice cream in the village"
        ],
        bestSeason: "June-July (hydrangea and lush moss), November (autumn foliage)",
        access: "Kyoto Bus #17 from Kyoto Station to Ohara (60 min), then 10 min walk",
        hours: "9:00-17:00 (March-November), 9:00-16:30 (December-February)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000348")!,
        name: "Jakko-in",
        address: "676 Ohara Kusaocho, Sakyo, Kyoto",
        description: "A poignant nunnery where Empress Kenreimon-in — the sole surviving member of the defeated Taira clan — spent her final years in grief and prayer after the catastrophic Battle of Dan-no-ura in 1185. The Tale of the Heike's most heartbreaking chapter takes place here, as the retired Emperor visits her in her lonely mountain retreat.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1261, longitude: 135.8275),
        stampSlotId: 348,
        category: .tera,
        tagline: "A grieving empress's mountain retreat — where the Heike tale ends",
        highlights: [
            "Final refuge of Empress Kenreimon-in after the fall of the Taira clan",
            "Setting for the famous final chapter of The Tale of the Heike",
            "Intimate moss garden with ancient cherry and maple trees",
            "One of Japan's most literary and emotionally resonant temples"
        ],
        mustSee: "Stand in the small garden where Kenreimon-in spent decades mourning her drowned son, her vanished clan, and an era of elegance lost to war. The intimacy and sadness of this place is palpable — especially in autumn rain.",
        tips: [
            "Read the final chapter of The Tale of the Heike before visiting",
            "On the opposite side of Ohara from Sanzenin — allow time for both",
            "The walk through Ohara's rice fields between the two temples is lovely",
            "Much quieter than Sanzenin — often you'll have it to yourself"
        ],
        bestSeason: "Autumn (November) for foliage echoing the melancholy atmosphere",
        access: "Kyoto Bus #17 to Ohara (60 min), then 15 min walk",
        hours: "9:00-17:00 (April-November), 9:00-16:30 (December-March)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000349")!,
        name: "Adashino Nenbutsu-ji",
        address: "17 Adashino-cho, Saga Toriimoto, Ukyo, Kyoto",
        description: "In the atmospheric Saga district beyond Arashiyama, this temple gathers roughly 8,000 stone Buddhist figures — abandoned grave markers from across centuries, collected and arranged on a hillside. Each August during the Sentoku-kuyo festival, candles are lit before every statue, transforming the temple into a flickering sea of memorial flames.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0256, longitude: 135.6667),
        stampSlotId: 349,
        category: .tera,
        tagline: "Eight thousand stone Buddhas — a haunting memorial to the forgotten dead",
        highlights: [
            "Approximately 8,000 stone Buddhist statues collected from abandoned graves",
            "Sentoku-kuyo candle festival in August — thousands of flickering lights",
            "Located along the atmospheric Saga Toriimoto preserved streetscape",
            "Bamboo grove within the temple grounds, quieter than the famous one"
        ],
        mustSee: "Walk among the 8,000 stone figures arranged on the mossy hillside. Each one represents a forgotten soul — the cumulative effect is haunting and deeply moving. If you visit during Sentoku-kuyo (August 23-24), the candlelit stones are unforgettable.",
        tips: [
            "Continue past the main Arashiyama bamboo grove to reach this quieter area",
            "The Saga Toriimoto preserved street nearby has traditional thatched-roof tea houses",
            "Sentoku-kuyo tickets sell out — book in advance for the August festival",
            "Combine with Otagi Nenbutsu-ji, a 10-minute walk further up the road"
        ],
        bestSeason: "August (Sentoku-kuyo festival), November (autumn foliage among the stones)",
        access: "25 min walk from JR Saga-Arashiyama Station, or bus to Saga Shakado-mae",
        hours: "9:00-16:30 (closed during Sentoku-kuyo preparation days)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000350")!,
        name: "Otagi Nenbutsu-ji",
        address: "2-5 Saga Toriimoto Fukatanicho, Ukyo, Kyoto",
        description: "The most whimsical temple in Kyoto — 1,200 stone rakan (disciple) statues carved by amateur volunteers in the 1980s, each with a wildly different expression. Some laugh, some meditate, some play tennis, some hold cameras. The joyful absurdity stands in delightful contrast to Kyoto's typically solemn temple atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0289, longitude: 135.6639),
        stampSlotId: 350,
        category: .tera,
        tagline: "1,200 grinning stone disciples — Kyoto's most joyful temple",
        highlights: [
            "1,200 unique stone rakan statues with wildly expressive faces",
            "Carved by amateur volunteers — each statue is one-of-a-kind",
            "Playful contrast to Kyoto's typically austere temple atmosphere",
            "Hidden gem at the very end of the Arashiyama walking trail"
        ],
        mustSee: "Wander among the 1,200 rakan and try to find the ones playing sports, holding cameras, or making silly faces. Each was carved with genuine affection by an everyday person — the warmth and humor are infectious.",
        tips: [
            "At the far end of the Arashiyama trail — most tourists turn back before reaching it",
            "Pair with Adashino Nenbutsu-ji (10 min walk) for a contrast of moods",
            "The temple is small — 30 minutes is enough to enjoy thoroughly",
            "No English signage — just wander and enjoy the stone faces"
        ],
        bestSeason: "Year-round — the statues are charming in every season",
        access: "30 min walk from JR Saga-Arashiyama Station, or taxi",
        hours: "8:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000351")!,
        name: "Yoshimine-dera",
        address: "1372 Oharano Oshiocho, Nishikyo, Kyoto",
        description: "Perched on a mountainside in western Kyoto, this Tendai temple offers sweeping panoramic views of the Kyoto basin. Its greatest treasure is a spectacular 600-year-old sliding-trunk pine — a single tree trained horizontally for 40 meters across the hillside garden, designated a Natural Monument of Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9558, longitude: 135.6400),
        stampSlotId: 351,
        category: .tera,
        tagline: "A 40-meter horizontal pine and panoramic views over Kyoto",
        highlights: [
            "Yuryu-no-Matsu — a 600-year-old pine trained 40 meters horizontally",
            "Panoramic views of the entire Kyoto basin from the hillside",
            "One of the Saigoku 33 Kannon pilgrimage temples (#20)",
            "Hydrangea garden with 8,000 blooms in June"
        ],
        mustSee: "The Yuryu-no-Matsu (dragon pine) defies belief — a single pine tree stretching 40 meters horizontally across the garden, its trunk supported by wooden props. It resembles a dragon in flight over the mountainside.",
        tips: [
            "Remote location with infrequent buses — check schedules carefully",
            "The stairway up the mountain is steep — wear comfortable shoes",
            "Combine with Oharano Jinja nearby for a quieter western Kyoto day",
            "June hydrangea season draws crowds but the blooms are magnificent"
        ],
        bestSeason: "June (hydrangea), November (autumn foliage with city views)",
        access: "Hankyu Bus from Hankyu Higashi-Muko Station to Yoshimine-dera (30 min)",
        hours: "8:00-17:00 (until 16:30 in winter)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000352")!,
        name: "Daisen-in",
        address: "54-1 Murasakino Daitokujicho, Kita, Kyoto",
        description: "Within the vast Daitoku-ji complex, Daisen-in houses what many consider the finest karesansui (dry landscape) garden in Japan. Created in 1509, the narrow garden uses rocks, gravel, and shaped plants to represent a river's journey from mountain waterfall to vast ocean — a profound allegory for the journey of human life.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0434, longitude: 135.7453),
        stampSlotId: 352,
        category: .tera,
        tagline: "A river's journey in stone — Japan's supreme dry landscape garden",
        highlights: [
            "Karesansui garden widely considered Japan's finest dry landscape",
            "Stone-and-gravel narrative depicting a river from mountain to sea",
            "Within the Daitoku-ji complex — Zen Buddhism's greatest temple city",
            "The abbot's dharma talks (in Japanese) are legendary and humorous"
        ],
        mustSee: "Sit on the veranda and trace the garden's narrative: mountain waterfall (top right), rushing stream with obstacles (along the corridor), then the vast empty ocean of raked gravel. It is a life story told entirely in stone.",
        tips: [
            "Photography is NOT allowed inside — absorb the garden with your eyes",
            "The abbot sometimes gives impromptu talks — engage if invited",
            "Daitoku-ji has many sub-temples — Koto-in and Zuiho-in are also excellent",
            "500 yen admission; tea service available for an extra fee"
        ],
        bestSeason: "Year-round — the garden transcends seasons",
        access: "Bus #206 from Kyoto Station to Daitokuji-mae stop (30 min)",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000353")!,
        name: "Hokoku Jinja",
        address: "1-1 Osakajo, Chuo, Osaka",
        description: "Standing within the grounds of Osaka Castle, Hokoku Jinja enshrines Toyotomi Hideyoshi — the peasant who unified Japan and built the castle above it. The shrine was destroyed by the Tokugawa shogunate to erase Hideyoshi's legacy but was rebuilt in the Meiji era. Today it draws visitors seeking success against impossible odds.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6873, longitude: 135.5262),
        stampSlotId: 353,
        category: .jinja,
        tagline: "Shrine of the peasant who became ruler — inside Osaka Castle",
        highlights: [
            "Enshrines Toyotomi Hideyoshi, Japan's great unifier",
            "Located within iconic Osaka Castle grounds",
            "Popular for career success and overcoming adversity prayers",
            "Thousand-Gourd amulet inspired by Hideyoshi's battle standard"
        ],
        mustSee: "The shrine's hyotan (gourd) motif is everywhere — Hideyoshi added a gourd to his battle standard after each victory. Buy a gourd-shaped ema and write your own seemingly impossible dream on it.",
        tips: [
            "Visit the shrine first, then explore Osaka Castle for a Hideyoshi-themed day",
            "The Sennari Hyotan gourd amulet is a unique souvenir",
            "Cherry blossom season fills the castle grounds with hanami parties",
            "The castle's museum inside covers Hideyoshi's rise in detail"
        ],
        bestSeason: "April (cherry blossoms in castle grounds), autumn for castle + foliage",
        access: "Osakajo-Kitazume Station (JR Loop Line) or Tanimachi 4-Chome Station (Subway)",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000354")!,
        name: "Abenoseimei Jinja",
        address: "12-28 Abeno Motomachi, Abeno, Osaka",
        description: "Dedicated to Abe no Seimei — the legendary Heian-era onmyoji (yin-yang master) said to possess supernatural powers including divination, exorcism, and communication with spirits. The shrine's distinctive five-pointed star emblem represents the five Chinese elements. Popular among anime and manga fans for its connection to the mystical Onmyodo tradition.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6456, longitude: 135.5152),
        stampSlotId: 354,
        category: .jinja,
        tagline: "Shrine of the legendary onmyoji master — where magic meets prayer",
        highlights: [
            "Dedicated to Abe no Seimei, Japan's most famous onmyoji sorcerer",
            "Distinctive pentagram (Seiman) star emblem throughout the shrine",
            "Popular with anime and manga fans (Onmyoji franchise)",
            "Divination and fortune-telling traditions continue here"
        ],
        mustSee: "The pentagram star appears on every surface — lanterns, roof tiles, ema boards. The shrine's crystal ball monument reflects the mystical divination traditions that made Seimei legendary in Heian-era court politics.",
        tips: [
            "The Kyoto Seimei Jinja is more famous, but this Osaka original has its own charm",
            "Popular on the 'autumn equinox' day — special ceremonies are held",
            "Unique star-shaped ema (prayer plaques) make great souvenirs",
            "Near Abeno Harukas — combine with Japan's tallest building observation deck"
        ],
        bestSeason: "Year-round, autumn equinox for special ceremonies",
        access: "5 min walk from Higashi-Tengachaya Station (Hankai Tramway)",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000355")!,
        name: "Sosha Ichinomiya Jinja",
        address: "190 Sosha-honmachi, Himeji, Hyogo",
        description: "The grand Ichinomiya (first-ranked shrine) of ancient Harima Province, this shrine gathers the spirits of all the province's deities in one place — over 174 gods enshrined together. Located near Himeji Castle, it hosts one of Japan's most dramatic festivals: the Nada no Kenka Matsuri (Fighting Festival), where massive mikoshi are violently crashed together.",
        coordinate: CLLocationCoordinate2D(latitude: 34.8564, longitude: 134.7174),
        stampSlotId: 355,
        category: .jinja,
        tagline: "174 gods under one roof and home of Japan's wildest fighting festival",
        highlights: [
            "Ichinomiya of Harima — gathering 174 deities in one shrine",
            "Host of Nada no Kenka Matsuri — Japan's most violent festival (October)",
            "Near Himeji Castle — Japan's most magnificent original castle",
            "1,000-year history as the province's supreme shrine"
        ],
        mustSee: "If visiting in mid-October, the Nada no Kenka Matsuri is unmissable — teams of men crash enormous portable shrines together at full force, splintering wood and igniting the crowd. Outside festival season, the shrine's quiet dignity contrasts powerfully with its violent alter ego.",
        tips: [
            "Combine with Himeji Castle (15 min by bus) for a full-day trip",
            "The fighting festival (October 14-15) draws massive crowds — arrive very early",
            "JR Himeji Station to Sosha by bus takes about 20 minutes",
            "The shrine's omamori feature the fighting mikoshi design"
        ],
        bestSeason: "October (Nada no Kenka Matsuri), spring (cherry blossoms near Himeji Castle)",
        access: "Bus from JR Himeji Station to Sosha stop (20 min)",
        hours: "Open 24 hours (shrine office 9:00-16:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000356")!,
        name: "Akashi Jinja",
        address: "1-1-3 Yamashita-cho, Akashi, Hyogo",
        description: "Perched overlooking the Akashi Strait and the famous Akashi Kaikyo Bridge, this shrine marks Japan's standard time meridian — the 135th degree east longitude line runs directly through its grounds. A sundial and meridian marker in the precincts commemorate this geographic distinction. The shrine dates to the 9th century and commands superb sea views.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6497, longitude: 135.0003),
        stampSlotId: 356,
        category: .jinja,
        tagline: "Where Japan's time begins — the shrine on the 135th meridian",
        highlights: [
            "Japan's standard time meridian (135°E) passes through the shrine grounds",
            "Panoramic views of Akashi Strait and Akashi Kaikyo Bridge",
            "Sundial and meridian markers within the precincts",
            "Ancient shrine dating to the 9th century with sea-facing grounds"
        ],
        mustSee: "Stand at the meridian marker and realize you are on the exact line that defines Japan Standard Time. Then look out over the Akashi Strait to see the world's longest suspension bridge stretching to Awaji Island.",
        tips: [
            "Akashi is famous for octopus — try akashiyaki (octopus dumplings) nearby",
            "The Uontana fish market near the station is a foodie must-visit",
            "Quick day trip from Kobe or Osaka on the JR line",
            "Sunset views over the strait from the shrine are spectacular"
        ],
        bestSeason: "Year-round, sunset views are best in winter when the air is clear",
        access: "10 min walk from JR Akashi Station or Sanyo Akashi Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000357")!,
        name: "Izushi Jinja",
        address: "Izushi-cho, Toyooka, Hyogo",
        description: "The Ichinomiya of ancient Tajima Province, set in the charming castle town of Izushi — often called Little Kyoto for its preserved Edo-era streets, samurai residences, and famous soba noodle shops. The shrine's grounds include a striking vermilion torii gate and forested hillside, perfectly complementing the town's nostalgic atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3447, longitude: 134.8694),
        stampSlotId: 357,
        category: .jinja,
        tagline: "First shrine of Tajima Province in a charming 'Little Kyoto' castle town",
        highlights: [
            "Ichinomiya of Tajima Province with centuries of prestige",
            "Set in Izushi — a beautifully preserved Edo-era castle town",
            "Forested hillside grounds with vermilion shrine buildings",
            "Gateway to the Kinosaki Onsen hot spring district"
        ],
        mustSee: "After visiting the shrine, explore Izushi's castle town — the watchtower, samurai residences, and Edo-era streetscape create one of Japan's best-preserved small-town atmospheres. Try Izushi sara-soba (plate soba) at one of the 40+ noodle shops.",
        tips: [
            "Izushi sara-soba is served on small plates — eating 5+ plates is the custom",
            "Combine with a visit to Kinosaki Onsen (30 min by car)",
            "The Izushi castle watchtower offers panoramic views of the town",
            "Access is easiest by car, but buses run from Toyooka Station"
        ],
        bestSeason: "Autumn for foliage, winter for crab season in nearby Kinosaki",
        access: "Bus from JR Toyooka Station to Izushi (30 min), or car",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000358")!,
        name: "Omi Jingu",
        address: "1-1 Jingu-cho, Otsu, Shiga",
        description: "A lakeside shrine on the shores of Lake Biwa dedicated to Emperor Tenji — the 7th-century ruler who introduced Japan's first water clock. Omi Jingu is the sacred venue for competitive karuta (the card game based on the Hyakunin Isshu poetry anthology), made famous globally by the manga and anime series Chihayafuru.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0264, longitude: 135.8576),
        stampSlotId: 358,
        category: .jinja,
        tagline: "Sacred battleground of competitive karuta on the shores of Lake Biwa",
        highlights: [
            "Official venue for the national competitive karuta championships",
            "Dedicated to Emperor Tenji, who created Japan's first water clock",
            "Pilgrimage site for fans of the Chihayafuru anime and manga",
            "Beautiful lakeside setting on the western shore of Lake Biwa"
        ],
        mustSee: "The karuta hall (Omi Kanjochoten) is where the annual Queen and Meijin championship matches take place every January. Even outside tournament season, the shrine's connection to Japan's ancient poetry tradition is deeply felt.",
        tips: [
            "Karuta championships are held in early January — check dates for viewing",
            "Chihayafuru fans can buy character-themed ema and omamori",
            "The lakeside location offers beautiful sunset views over Lake Biwa",
            "Just 10 minutes from central Kyoto by JR — an easy side trip"
        ],
        bestSeason: "January (karuta championships), spring (cherry blossoms along the lake)",
        access: "10 min walk from Otsukyo Station (JR Kosei Line) or Keihan Omi-Jingu-mae Station",
        hours: "6:00-18:00 (shrine office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000359")!,
        name: "Niutsuhime Jinja",
        address: "230 Kamiamagawa, Katsuragi, Wakayama",
        description: "A crimson-lacquered World Heritage shrine nestled in the mountains of Katsuragi, guarding the gateway to the sacred Koyasan monastery. The shrine honors Niutsuhime-no-Okami, who according to legend guided Kukai (Kobo Daishi) to Mount Koya. Its graceful arched bridge and vibrant vermilion buildings reflecting in the pond create a scene of ethereal beauty.",
        coordinate: CLLocationCoordinate2D(latitude: 34.2564, longitude: 135.5625),
        stampSlotId: 359,
        category: .jinja,
        tagline: "Vermilion gateway to Koyasan — where a goddess guided Kobo Daishi",
        highlights: [
            "UNESCO World Heritage Site as part of the Sacred Sites of Kii",
            "Mythical origin — the goddess who led Kukai to Mount Koya",
            "Stunning vermilion buildings reflected in a sacred pond",
            "Graceful arched bridge (taiko-bashi) over the approach"
        ],
        mustSee: "The vermilion shrine buildings reflected in the mirror-like pond, framed by the arched bridge — this scene, especially during autumn foliage, is one of rural Japan's most painterly shrine views.",
        tips: [
            "On the pilgrimage trail to Koyasan — visit on the way to or from Mount Koya",
            "Access by car is easiest; limited bus service from JR Myoji Station",
            "The surrounding mountain scenery is beautiful in every season",
            "Much quieter than Koyasan itself — savor the peaceful atmosphere"
        ],
        bestSeason: "November (autumn foliage with vermilion shrine), April (cherry blossoms)",
        access: "Bus from JR Myoji Station (Wakayama Line), or car recommended",
        hours: "8:30-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000360")!,
        name: "Tado Taisha",
        address: "1681 Tado-cho, Kuwana, Mie",
        description: "The Ichinomiya of Ise Province and one of Japan's most ancient shrines, Tado Taisha is famous for its dramatic Ageuma Festival — where riders charge horses up a near-vertical cliff face. The shrine enshrines the deity who aids Amaterasu at Ise and serves as a sister shrine to Ise Jingu, drawing pilgrims who visit both.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0636, longitude: 136.6081),
        stampSlotId: 360,
        category: .taisha,
        tagline: "Sister shrine of Ise — where horses charge up cliff walls",
        highlights: [
            "Ageuma Festival (May) — horses charge up a steep earthen wall",
            "Ichinomiya of Ise Province with deep ties to Ise Jingu",
            "Ancient shrine predating written records in the region",
            "Forested mountainside setting with waterfall"
        ],
        mustSee: "If visiting in early May, the Ageuma Festival is one of Japan's most thrilling shrine events — horses are driven up an impossibly steep earthen cliff while crowds roar. Success or failure is read as an agricultural omen for the year.",
        tips: [
            "Ageuma Festival is held May 4-5 — arrive very early for a good viewing spot",
            "Combine with a visit to Ise Jingu — Tado is the traditional complementary shrine",
            "The mountain trail behind the shrine leads to a waterfall",
            "Accessible from Nagoya by train (about 40 min to Kuwana, then bus)"
        ],
        bestSeason: "May (Ageuma Festival), spring (cherry blossoms), autumn (foliage)",
        access: "Bus from JR/Kintetsu Kuwana Station to Tado (20 min)",
        hours: "Open 24 hours (shrine office 8:30-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000361")!,
        name: "Futami Okitama Jinja",
        address: "575 Futami-cho E, Ise, Mie",
        description: "Home of the iconic Meoto Iwa — the Married Rocks — two sacred stones in the sea connected by a massive shimenawa rope weighing over a ton. The larger rock represents the husband, the smaller the wife. At dawn during summer solstice, the sun rises perfectly between them, and on clear winter days Mount Fuji is visible through the gap.",
        coordinate: CLLocationCoordinate2D(latitude: 34.5097, longitude: 136.7908),
        stampSlotId: 361,
        category: .jinja,
        tagline: "The Married Rocks — Japan's most iconic sacred seascape",
        highlights: [
            "Meoto Iwa (Married Rocks) connected by a sacred shimenawa rope",
            "Summer solstice sunrise appears perfectly between the two rocks",
            "Frog statues throughout — sacred to the shrine as symbols of safe return",
            "Traditional first stop before purification at Ise Jingu"
        ],
        mustSee: "Arrive before dawn during the summer solstice period (late May to mid-July) to see the sun rise between the Married Rocks. Outside this season, the rocks at any time of day are still one of Japan's most photographed sacred scenes.",
        tips: [
            "Traditionally visited before Ise Jingu for ocean purification",
            "The shimenawa rope is replaced three times a year in dramatic ceremonies",
            "Touch the frog statues for good luck — kaeru means both 'frog' and 'return safely'",
            "The adjacent Ise Sea Paradise aquarium is good for families"
        ],
        bestSeason: "Late May to mid-July (sunrise between the rocks), winter (chance of Fuji views)",
        access: "15 min walk from JR Futaminoura Station",
        hours: "Open 24 hours (free access)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000362")!,
        name: "Iga Hachimangu",
        address: "47-1 Igahachiman-cho, Okazaki, Aichi",
        description: "The shrine where Tokugawa Ieyasu — founder of the Tokugawa shogunate and one of Japan's three great unifiers — was born and had his first shrine visit as an infant. The placenta from his birth was buried here, and the camphor tree planted at his birth still stands after 480 years. A pilgrimage site for those seeking the patience and strategic wisdom of Ieyasu.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9553, longitude: 137.1689),
        stampSlotId: 362,
        category: .hachimangu,
        tagline: "Birthplace shrine of Tokugawa Ieyasu — where patience became power",
        highlights: [
            "Birth shrine of Tokugawa Ieyasu, founder of the shogunate",
            "480-year-old camphor tree planted at Ieyasu's birth",
            "Ieyasu's placenta buried in the shrine grounds",
            "Prayers for patience, strategy, and ultimate victory"
        ],
        mustSee: "The massive camphor tree planted in 1543 at Ieyasu's birth still towers over the shrine — 480 years of growth mirroring the enduring legacy of the man who waited decades before seizing power at age 60.",
        tips: [
            "Combine with Okazaki Castle (Ieyasu's birthplace castle) nearby",
            "The shrine's omamori feature Ieyasu's hollyhock crest",
            "Okazaki Castle park has excellent cherry blossoms in spring",
            "Part of a rich Ieyasu heritage trail through Okazaki city"
        ],
        bestSeason: "Spring (cherry blossoms at Okazaki Castle), year-round",
        access: "15 min walk from Meitetsu Higashi-Okazaki Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000363")!,
        name: "Shizuoka Sengen Jinja",
        address: "102-1 Miyagasaki-cho, Aoi, Shizuoka",
        description: "A lavishly decorated shrine complex at the base of Shizuoka's Shizuhata mountain, combining three shrines into one magnificent precinct. Young Tokugawa Ieyasu performed his coming-of-age ceremony here. The 26 shrine buildings, all designated Important Cultural Properties, showcase some of Japan's most elaborate and colorful architectural ornamentation.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9792, longitude: 138.3531),
        stampSlotId: 363,
        category: .jinja,
        tagline: "Where young Ieyasu came of age — 26 buildings of dazzling craftsmanship",
        highlights: [
            "26 buildings designated Important Cultural Properties",
            "Tokugawa Ieyasu's coming-of-age ceremony site",
            "Three shrines merged into one spectacular complex",
            "Among Japan's most ornately decorated shrine architecture"
        ],
        mustSee: "The main shrine buildings are covered in vibrant painted carvings — dragons, flowers, mythological creatures — rivaling the ornamentation of Nikko Toshogu. The sheer density of craftsmanship across 26 buildings is staggering.",
        tips: [
            "Free admission to the main grounds — the museum has a small fee",
            "The annual Shizuoka Festival (April) features elaborate processions",
            "Climb Shizuhata mountain behind the shrine for city views",
            "Near Shizuoka Station — easy to visit en route between Tokyo and Nagoya"
        ],
        bestSeason: "April (Shizuoka Festival), spring cherry blossoms",
        access: "10 min walk from JR Shizuoka Station, or bus to Sengen Jinja stop",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000364")!,
        name: "Shuzenji",
        address: "964 Shuzenji, Izu, Shizuoka",
        description: "A Shingon Buddhist temple said to have been founded by Kobo Daishi in 807, nestled in the heart of Shuzenji Onsen — one of the Izu Peninsula's most atmospheric hot spring towns. The temple sits alongside a bamboo-lined path and a river spanned by red bridges. Its history is stained with Minamoto clan tragedy — a young shogun was assassinated here.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9717, longitude: 138.9292),
        stampSlotId: 364,
        category: .tera,
        tagline: "Kobo Daishi's hot spring temple — where a young shogun met his end",
        highlights: [
            "Founded by Kobo Daishi in 807 at the heart of Shuzenji Onsen",
            "Site of the assassination of Minamoto no Yoriie (2nd Kamakura shogun)",
            "Bamboo grove path (Chikurin-no-Komichi) rivaling Arashiyama",
            "Historic hot spring town atmosphere with red bridges and ryokan"
        ],
        mustSee: "Walk the Chikurin-no-Komichi bamboo path beside the temple, then cross the red bridge over the Katsura River. In the river below, Tokko-no-Yu — the hot spring Kobo Daishi struck from rock with his staff — still steams.",
        tips: [
            "Stay at a ryokan in Shuzenji Onsen for the full experience",
            "The autumn foliage festival (November) illuminates the temple grounds at night",
            "Tokko-no-Yu foot bath in the river is free to use",
            "The Izu Hakone Railway from Mishima reaches Shuzenji in 35 minutes"
        ],
        bestSeason: "November (illuminated autumn foliage), year-round for onsen",
        access: "Bus from Shuzenji Station (Izu Hakone Railway) to Shuzenji Onsen (10 min)",
        hours: "8:30-16:30 (April-September), 8:30-16:00 (October-March)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000365")!,
        name: "Kai Zenko-ji",
        address: "5-23-1 Zenkoji, Kofu, Yamanashi",
        description: "When Takeda Shingen feared Nagano's Zenko-ji would be destroyed during his wars with Uesugi Kenshin, he built this replica temple and evacuated the original's sacred Amida Buddha statue here for safekeeping. The statue was eventually returned, but Kai Zenko-ji continued as a major temple. The inner sanctum offers the same pitch-black key-touching experience as its Nagano parent.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6689, longitude: 138.5647),
        stampSlotId: 365,
        category: .tera,
        tagline: "Shingen's sanctuary for a sacred Buddha — Zenko-ji's wartime twin",
        highlights: [
            "Built by Takeda Shingen to protect Zenko-ji's sacred Buddha",
            "Pitch-black kaidan-meguri passage beneath the altar",
            "Replica of Nagano's Zenko-ji with its own centuries of history",
            "Near Takeda Shingen's castle ruins (Takeda Shrine nearby)"
        ],
        mustSee: "Descend into the kaidan-meguri — the pitch-black passage beneath the main altar. In total darkness, feel along the wall until you touch the Lock of Paradise (gokuraku no jomae). Finding it guarantees rebirth in the Pure Land.",
        tips: [
            "Combine with Takeda Jinja and Kofu Castle ruins for a Shingen-themed day",
            "The kaidan-meguri experience costs a small fee — well worth it",
            "Kofu is easy to reach from Tokyo (90 min by Limited Express Azusa/Kaiji)",
            "The temple's setsubun (February 3) bean-throwing festival is lively"
        ],
        bestSeason: "Year-round, February (Setsubun), April (cherry blossoms)",
        access: "15 min walk from JR Kofu Station, or bus to Zenkoji stop",
        hours: "9:00-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000366")!,
        name: "Anraku-ji",
        address: "2361 Bessho Onsen, Ueda, Nagano",
        description: "Home to Japan's only surviving octagonal three-story pagoda — a National Treasure of extraordinary rarity and grace. Built in the late Kamakura period, the pagoda's unique eight-sided form was inspired by Song Dynasty Chinese architecture but executed in purely Japanese style. The temple sits in Bessho Onsen, a hot spring town with over 1,000 years of history.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3378, longitude: 138.1572),
        stampSlotId: 366,
        category: .tera,
        tagline: "Japan's only octagonal pagoda — a singular National Treasure",
        highlights: [
            "Japan's sole surviving octagonal three-story pagoda (National Treasure)",
            "Unique eight-sided form inspired by Song Dynasty architecture",
            "Set in Bessho Onsen — Nagano's most historic hot spring town",
            "Kamakura-period construction of extraordinary architectural rarity"
        ],
        mustSee: "The octagonal pagoda is unlike any other structure in Japan. Stand beneath it and count the eight sides — this architectural form, once common in China, survived nowhere in Japan except here. It is irreplaceable.",
        tips: [
            "Bessho Onsen has three free public bathhouses — soak after your temple visit",
            "The Ueda Electric Railway from Ueda Station is charmingly retro",
            "Combine with nearby Kitamuki Kannon and Jorakuji for a temple circuit",
            "Ueda Castle (Sanada clan) is a 30-minute train ride away"
        ],
        bestSeason: "Autumn foliage (November), year-round",
        access: "5 min walk from Bessho-Onsen Station (Ueda Electric Railway)",
        hours: "8:00-17:00 (March-October), 8:00-16:00 (November-February)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000367")!,
        name: "Imizu Jinja",
        address: "1 Imizumiya, Imizu, Toyama",
        description: "The Ichinomiya of ancient Etchu Province, this shrine has guarded the Toyama Bay coast for over 2,000 years according to tradition. It is one of the few shrines in Japan that enshrines both land and sea deities, reflecting the region's dependence on both rice farming and fishing. The tranquil forested grounds offer respite from the modern port city.",
        coordinate: CLLocationCoordinate2D(latitude: 36.7336, longitude: 137.0864),
        stampSlotId: 367,
        category: .jinja,
        tagline: "Ancient guardian of Toyama Bay — where land and sea gods meet",
        highlights: [
            "Ichinomiya of Etchu Province with 2,000+ years of tradition",
            "Enshrines both land and sea deities — rare dual guardianship",
            "Dense forest grounds offering peaceful walks",
            "October festival with traditional yabusame horseback archery"
        ],
        mustSee: "The shrine's approach through towering cryptomeria trees creates a cathedral-like atmosphere. In October, the festival features yabusame (horseback archery) — mounted archers in Heian costume gallop past targets at full speed.",
        tips: [
            "Near the coast — combine with Shinminato fishing port for fresh seafood",
            "The Takaoka area nearby has the Takaoka Daibutsu and Zuiryu-ji",
            "The Amaharashi Coast, visible from nearby, frames Mount Tateyama over the sea",
            "Less visited than major shrines — enjoy the authentic local atmosphere"
        ],
        bestSeason: "October (festival), spring, summer for Toyama Bay views",
        access: "10 min taxi from Ainokaze-Toyama Railway Koshino Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000368")!,
        name: "Keta Taisha",
        address: "1-1 Jike, Hakui, Ishikawa",
        description: "The Ichinomiya of Noto Province, facing the Sea of Japan on the windswept Noto Peninsula. This ancient shrine is known throughout Japan as the supreme shrine for en-musubi — the tying of romantic bonds. The shrine's Keta Festival in April features dramatic fire rituals and parades of ornate floats along the coast.",
        coordinate: CLLocationCoordinate2D(latitude: 36.8961, longitude: 136.7814),
        stampSlotId: 368,
        category: .taisha,
        tagline: "Noto's supreme matchmaking shrine on the wild Sea of Japan coast",
        highlights: [
            "Ichinomiya of Noto Province — one of Japan's top en-musubi shrines",
            "Dramatic Sea of Japan coastal setting on the Noto Peninsula",
            "Keta Festival (April) with fire rituals and ornate float processions",
            "Ancient worship site dating to at least the 8th century"
        ],
        mustSee: "The shrine's en-musubi ritual involves writing wishes for romantic connection on heart-shaped ema boards. The sea wind carries prayers across the Japan Sea — a poetic setting for matters of the heart.",
        tips: [
            "The Noto Peninsula is remote but rewarding — rent a car for best access",
            "Chirihama Beach nearby allows driving on the sand (one of few in Japan)",
            "Combine with Wajima Morning Market for a full Noto experience",
            "The coast is dramatic in winter storms — dress warmly"
        ],
        bestSeason: "April (Keta Festival), summer for coastal beauty, winter for drama",
        access: "15 min taxi from JR Hakui Station (Nanao Line)",
        hours: "8:30-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000369")!,
        name: "Wakasa Jingu",
        address: "68-2 Endojicho, Obama, Fukui",
        description: "Known as Wakasa Ichinomiya, this shrine in the picturesque port town of Obama (yes, really — the town famously celebrated the 2008 US presidential election) has served as the first-ranked shrine of Wakasa Province for over a millennium. The shrine's spring water is ritually sent to the sacred well at Todai-ji in Nara each March in the Omizu-okuri ceremony.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4836, longitude: 135.7372),
        stampSlotId: 369,
        category: .jinja,
        tagline: "The shrine that sends sacred water 200km to Nara's Todai-ji",
        highlights: [
            "Omizu-okuri ceremony — sacred water sent underground to Todai-ji in Nara",
            "Ichinomiya of Wakasa Province with over 1,000 years of history",
            "Located in Obama — the Japanese town that cheered for President Obama",
            "Connected to Nara's Omizu-tori festival via underground water channels"
        ],
        mustSee: "On March 2 each year, the Omizu-okuri ceremony sends sacred water flowing 200km underground to the well at Todai-ji, arriving in time for Nara's famous Omizu-tori water-drawing ceremony on March 12. Fire torches light the nighttime ritual.",
        tips: [
            "The Omizu-okuri ceremony (March 2) involves dramatic torch processions at night",
            "Obama town has a tongue-in-cheek Obama connection — souvenirs available",
            "Excellent saba (mackerel) cuisine — Obama was Kyoto's fish supplier via the Saba Kaido",
            "The drive along the Wakasa coast is scenic year-round"
        ],
        bestSeason: "March 2 (Omizu-okuri ceremony), year-round",
        access: "15 min walk from JR Obama Station",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000370")!,
        name: "Akagi Jinja Gunma",
        address: "Fujimi, Maebashi, Gunma",
        description: "Perched near the summit of Mount Akagi, this ancient shrine sits on the shore of the volcanic crater lake Onuma. As the Ichinomiya of Kozuke Province, it commands spiritual authority over the entire Gunma region. The lake, the surrounding forests, and the mountain's distinctive silhouette have been objects of worship since prehistoric times.",
        coordinate: CLLocationCoordinate2D(latitude: 36.5514, longitude: 139.1794),
        stampSlotId: 370,
        category: .jinja,
        tagline: "Crater-lake shrine atop Mount Akagi — guardian of ancient Kozuke",
        highlights: [
            "Ichinomiya of Kozuke Province on a volcanic crater lake",
            "Sacred Mount Akagi — one of Gunma's three great mountains",
            "Lake Onuma setting with mountain reflections",
            "Prehistoric origins of mountain worship still felt today"
        ],
        mustSee: "The shrine's red bridge over the crater lake with Mount Akagi reflected in the water is one of Gunma's most scenic views. In winter, the frozen lake creates an otherworldly landscape around the shrine.",
        tips: [
            "Different from Tokyo's Akagi Jinja — this is the original mountain shrine",
            "Mount Akagi is popular for hiking — multiple trails from the lake area",
            "The lake freezes in winter, offering ice fishing and frozen scenery",
            "Car access is easiest; buses from Maebashi Station run seasonally"
        ],
        bestSeason: "October (autumn foliage), January-February (frozen lake), June (azaleas)",
        access: "Bus from JR Maebashi Station (seasonal, about 70 min), or car",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000371")!,
        name: "Oya-ji",
        address: "1198 Oya-machi, Utsunomiya, Tochigi",
        description: "Carved into the volcanic tuff cliffs of Oya, this cave temple houses a magnificent 27-meter Kannon statue — Japan's largest rock-carved Buddha — chiseled directly from the cliff face over 1,000 years ago. The surrounding Oya quarry landscape, with its surreal geometric stone walls, has been used as a filming location for everything from period dramas to music videos.",
        coordinate: CLLocationCoordinate2D(latitude: 36.6058, longitude: 139.8342),
        stampSlotId: 371,
        category: .tera,
        tagline: "Japan's largest rock-carved Buddha inside a volcanic cliff temple",
        highlights: [
            "27-meter Kannon — Japan's largest rock-carved Buddhist statue",
            "Carved directly from volcanic tuff cliffs over 1,000 years ago",
            "Surrounding Oya stone quarry creates a surreal landscape",
            "The underground quarry space (Oya Museum) is cathedral-like"
        ],
        mustSee: "The Heiwa Kannon (Peace Kannon) is 27 meters tall and carved directly from the living rock — standing before it inside the cave is awe-inspiring. Then visit the nearby Oya Museum underground quarry — a vast subterranean cathedral of stone used for concerts and weddings.",
        tips: [
            "The Oya Museum underground quarry (separate admission) is absolutely worth visiting",
            "Utsunomiya is Japan's gyoza capital — don't leave without eating dumplings",
            "About 30 minutes from Utsunomiya Station by bus",
            "The cave temple is cool even in summer — bring a light layer"
        ],
        bestSeason: "Year-round (cave temperature is constant), autumn for surrounding scenery",
        access: "Bus from JR Utsunomiya Station to Oya Kannon-mae (30 min)",
        hours: "8:30-17:00 (April-September), 9:00-16:30 (October-March)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000372")!,
        name: "Tokiwa Jinja",
        address: "1-1-1 Tokiwa-cho, Mito, Ibaraki",
        description: "Located within the grounds of Kairakuen — one of Japan's Three Great Gardens — Tokiwa Jinja enshrines the Mito Tokugawa lords including Tokugawa Nariaki, who built Kairakuen. The shrine's setting amid 3,000 plum trees makes it the center of the famous Mito Plum Festival each February-March, when the entire garden erupts in pink and white blossoms.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3714, longitude: 140.4522),
        stampSlotId: 372,
        category: .jinja,
        tagline: "Shrine within Kairakuen — Japan's plum blossom paradise",
        highlights: [
            "Set within Kairakuen, one of Japan's Three Great Gardens",
            "Enshrines the Mito Tokugawa lords who shaped Mito's culture",
            "3,000 plum trees create Japan's most famous ume festival",
            "Mito Plum Festival (February-March) draws over a million visitors"
        ],
        mustSee: "During the Mito Plum Festival (mid-February to late March), 3,000 plum trees of over 100 varieties bloom in waves of pink, white, and red. Walk through the plum forest to the shrine — the fragrance is intoxicating.",
        tips: [
            "Time your visit for late February to early March for peak plum blossoms",
            "Kairakuen is free to enter (some facilities charge)",
            "Try ume-related foods — plum wine, plum rice balls, plum soft-serve",
            "The garden's Kobuntei pavilion offers excellent views over Senba Lake"
        ],
        bestSeason: "Late February to March (plum blossom festival)",
        access: "20 min walk from JR Mito Station, or bus to Kairakuen stop",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000373")!,
        name: "Hanitsu Jinja",
        address: "2-69 Nishi-Sakae-machi, Aizuwakamatsu, Fukushima",
        description: "The premier shrine of Aizu-Wakamatsu — the tragic samurai city where the Byakkotai (White Tiger Force) of teenage warriors committed ritual suicide during the Boshin War rather than face defeat. The shrine stands near where these events unfolded and serves as a spiritual center for Aizu's fierce warrior traditions and the bushido code of honor.",
        coordinate: CLLocationCoordinate2D(latitude: 37.4978, longitude: 139.9308),
        stampSlotId: 373,
        category: .jinja,
        tagline: "Spiritual heart of Aizu — where the samurai code burns brightest",
        highlights: [
            "Premier shrine of Aizu-Wakamatsu, city of tragic samurai loyalty",
            "Connected to the Byakkotai (White Tiger Force) story of Boshin War",
            "Center of Aizu's fierce bushido warrior traditions",
            "Beautiful grounds beneath Tsuruga Castle's shadow"
        ],
        mustSee: "Visit the shrine, then walk to nearby Iimoriyama hill where the 19 teenage Byakkotai warriors took their own lives after mistakenly believing Tsuruga Castle had fallen. The graves and memorial overlooking the castle are deeply moving.",
        tips: [
            "Combine with Tsuruga Castle (Aizu-Wakamatsu Castle) and Iimoriyama hill",
            "Aizu sake is excellent — visit one of the many local breweries",
            "Try Aizu kozuyu (traditional vegetable soup) and sauce katsudon",
            "The Aizu Railway from Aizu-Wakamatsu to Oze is scenic"
        ],
        bestSeason: "April (cherry blossoms at Tsuruga Castle), autumn foliage",
        access: "15 min walk from JR Aizu-Wakamatsu Station, or city bus",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000374")!,
        name: "Shinzan Jinja",
        address: "Kitaura Shinzan, Oga, Akita",
        description: "Set on the rugged Oga Peninsula jutting into the Sea of Japan, this shrine is the spiritual home of the Namahage — fearsome demon-like figures who descend from the mountains on New Year's Eve to terrify lazy villagers and disobedient children. The Namahage tradition, a UNESCO Intangible Cultural Heritage, has roots in this shrine's mountain worship.",
        coordinate: CLLocationCoordinate2D(latitude: 39.9167, longitude: 139.8000),
        stampSlotId: 374,
        category: .jinja,
        tagline: "Home of the Namahage demons — where monsters discipline the lazy",
        highlights: [
            "Spiritual home of the Namahage — terrifying mountain demons",
            "UNESCO Intangible Cultural Heritage tradition",
            "Dramatic Oga Peninsula coastal setting facing the Sea of Japan",
            "Namahage Sedo Festival (February) with fire and demon performances"
        ],
        mustSee: "The Namahage Sedo Festival in February brings the Namahage to life — masked demons in straw capes descend by firelight to the shrine, roaring 'Are there any crybabies here? Any lazy people?' The spectacle against the snowy mountain is unforgettable.",
        tips: [
            "Visit the Namahage Museum near the shrine for full cultural context",
            "The February Namahage Sedo Festival is the best way to experience the tradition",
            "The Oga Peninsula has dramatic coastal scenery worth exploring by car",
            "Try Oga's ishiyaki nabe — hot stone seafood pot, a local specialty"
        ],
        bestSeason: "February (Namahage Sedo Festival), summer for coastal scenery",
        access: "Car recommended; bus from JR Oga Station (limited service)",
        hours: "Open 24 hours (shrine office 9:00-16:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000375")!,
        name: "Osorezan Bodai-ji",
        address: "3-2 Tanabu Usoriyama, Mutsu, Aomori",
        description: "Built on the rim of a volcanic caldera at the tip of the Shimokita Peninsula, Osorezan (Mount Fear) is considered one of the three most sacred places in Japan alongside Koyasan and Hieizan. The sulfurous landscape of bubbling fumaroles, blood-red streams, and a pristine white-sand lake is said to represent both heaven and hell. Itako spirit mediums channel the dead during summer festivals.",
        coordinate: CLLocationCoordinate2D(latitude: 41.3283, longitude: 141.0900),
        stampSlotId: 375,
        category: .tera,
        tagline: "Mount Fear — Japan's gateway between the living and the dead",
        highlights: [
            "One of Japan's three most sacred places (with Koyasan and Hieizan)",
            "Volcanic hellscape of sulfur, red streams, and ethereal beauty",
            "Itako spirit mediums communicate with the dead (July festival)",
            "Paradise Beach (Gokurakuhama) — white sand on the caldera lake"
        ],
        mustSee: "Walk the circuit past bubbling sulfur vents and blood-red streams (the 'hells'), then emerge at Gokurakuhama — an impossibly serene white sand beach on the caldera lake. The contrast between hell and paradise is literal and breathtaking.",
        tips: [
            "Open only May to October due to heavy snowfall",
            "The Itako no Kuchiyose spirit medium festival is held in late July",
            "The sulfur smell is intense — those with respiratory issues should be cautious",
            "Very remote — bus from Mutsu city or car required"
        ],
        bestSeason: "July (Itako festival), June-September for clear weather access",
        access: "Bus from JR Shimokita Station to Osorezan (45 min, seasonal)",
        hours: "6:00-18:00 (May-October only, closed November-April)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000376")!,
        name: "Zensho-ji",
        address: "23 Honcho, Aomori, Aomori",
        description: "A Soto Zen temple in central Aomori famous for housing one of Japan's most unsettling Buddhist artworks — a painted scroll depicting the Six Realms of Existence in graphic detail, including torments of hell that would make Dante flinch. The temple also serves as a quiet counterpoint to Aomori's explosive Nebuta festival each August.",
        coordinate: CLLocationCoordinate2D(latitude: 40.8236, longitude: 140.7406),
        stampSlotId: 376,
        category: .tera,
        tagline: "Hell scrolls and Zen serenity in Aomori's festival city",
        highlights: [
            "Graphic Six Realms of Existence painted scrolls depicting hell",
            "Soto Zen temple with contemplative garden",
            "Central Aomori location — peaceful retreat near Nebuta festival routes",
            "Historical role as Tsugaru clan temple"
        ],
        mustSee: "Ask to view the jigoku-e (hell paintings) — the vivid depictions of Buddhist hell realms are fascinating and terrifying in equal measure. These paintings were used as teaching tools to encourage moral behavior.",
        tips: [
            "Best combined with the Aomori Nebuta Festival (August 2-7) visit",
            "The Aomori Museum of Art and Sannai-Maruyama ruins are nearby",
            "Aomori is the gateway to Shirakami Mountains (UNESCO World Heritage)",
            "Try Aomori's famous apple desserts and seafood market (Furukawa Market)"
        ],
        bestSeason: "August (Nebuta Festival), year-round for the temple",
        access: "10 min walk from JR Aomori Station",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000377")!,
        name: "Fujisaki Hachimangu",
        address: "30-1 Idegami-cho, Chuo, Kumamoto",
        description: "Kumamoto's most important shrine, said to have been founded in 935 AD by the famous calligrapher Ono no Michikaze. The shrine's autumn festival features one of Japan's most thrilling horseback events — riders gallop down the steep stone steps while the crowd gasps. A towering 800-year-old camphor tree, designated a Natural Monument, guards the approach.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7958, longitude: 130.7072),
        stampSlotId: 377,
        category: .hachimangu,
        tagline: "Kumamoto's guardian — where horses gallop down stone stairs",
        highlights: [
            "Autumn festival horseback descent of stone steps — thrilling spectacle",
            "800-year-old camphor tree (Natural Monument) at the entrance",
            "Kumamoto's premier shrine since the 10th century",
            "Dramatic stone stairway approach to the main hall"
        ],
        mustSee: "The enormous camphor tree at the shrine entrance is 800 years old and 13 meters in circumference. Its massive canopy shelters the entire approach — a living monument predating Kumamoto Castle by centuries.",
        tips: [
            "The autumn festival horseback event (September) is unique to this shrine",
            "Combine with Kumamoto Castle (under reconstruction but still impressive)",
            "Suizenji Garden, one of Japan's finest, is nearby",
            "Try Kumamoto's famous horse meat sashimi (basashi) and tonkotsu ramen"
        ],
        bestSeason: "September (autumn festival), spring (cherry blossoms)",
        access: "5 min walk from Kumamoto City Tram Gion-bashi stop",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000378")!,
        name: "Karatsu Jinja",
        address: "13-8 Minami-Jonai, Karatsu, Saga",
        description: "The central shrine of Karatsu city, famous for the spectacular Karatsu Kunchi festival — one of Japan's top three float festivals. Each November, 14 massive lacquered floats shaped as sea bream, lions, dragons, and samurai helmets parade through the streets, carried by teams of chanting men. The festival has been designated a UNESCO Intangible Cultural Heritage.",
        coordinate: CLLocationCoordinate2D(latitude: 33.4489, longitude: 129.9689),
        stampSlotId: 378,
        category: .jinja,
        tagline: "Festival of giant lacquered floats — UNESCO-honored Karatsu Kunchi",
        highlights: [
            "Karatsu Kunchi festival — UNESCO Intangible Cultural Heritage",
            "14 massive lacquered floats (hikiyama) shaped as creatures and helmets",
            "One of Japan's three greatest float festivals",
            "Karatsu Castle views from the shrine grounds"
        ],
        mustSee: "If you cannot visit during the November festival, the Hikiyama Exhibition Hall near the shrine displays all 14 floats year-round. These enormous lacquered creations — some over 200 years old — are stunning examples of Japanese festival craftsmanship.",
        tips: [
            "Karatsu Kunchi runs November 2-4 — book accommodation months in advance",
            "The Hikiyama Exhibition Hall (near the shrine) shows the floats year-round",
            "Karatsu Castle on the nearby hilltop has excellent coastal views",
            "Famous for Karatsu-yaki pottery — visit workshops in the area"
        ],
        bestSeason: "November 2-4 (Karatsu Kunchi festival)",
        access: "10 min walk from JR Karatsu Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000379")!,
        name: "Tsurugane Jinja",
        address: "28-8 Yoshino-cho, Kagoshima, Kagoshima",
        description: "A Shimazu clan shrine near the famous Sengan-en garden in Kagoshima, offering sweeping views of Sakurajima volcano across Kinko Bay. The shrine's history is intertwined with the Shimazu lords who ruled Satsuma for 700 years and played a decisive role in the Meiji Restoration that ended the samurai era.",
        coordinate: CLLocationCoordinate2D(latitude: 31.6106, longitude: 130.5714),
        stampSlotId: 379,
        category: .jinja,
        tagline: "Shimazu clan shrine with Sakurajima volcano views",
        highlights: [
            "Panoramic views of Sakurajima volcano across Kinko Bay",
            "Connected to the Shimazu clan — rulers of Satsuma for 700 years",
            "Near Sengan-en, the magnificent Shimazu villa garden",
            "Meiji Restoration history — Satsuma warriors changed Japan here"
        ],
        mustSee: "The view from the shrine grounds captures Sakurajima in all its smoking glory across the bay. On clear days, the active volcano's plume rises behind the shrine buildings — a scene unique to Kagoshima.",
        tips: [
            "Combine with Sengan-en garden and Shoko Shuseikan museum for a full day",
            "Sakurajima erupts regularly — check ash fall forecasts",
            "Take the Sakurajima ferry for close-up volcano views (15 min crossing)",
            "Try Kagoshima kurobuta (black pork) tonkatsu — Japan's finest"
        ],
        bestSeason: "Year-round, clear winter days offer the best volcano views",
        access: "City bus to Sengan-en mae stop, or 30 min walk from Kagoshima Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000380")!,
        name: "Sueyoshi-gu",
        address: "1-29-11 Shurisueyoshi-cho, Naha, Okinawa",
        description: "Okinawa's oldest shrine, established in the Ryukyu Kingdom era and situated on a forested hillside near Shuri Castle. Unlike mainland Japanese shrines, Sueyoshi-gu blends Ryukyuan spiritual traditions with Shinto, reflecting the unique cultural fusion of the Okinawan islands. The shrine's sacred forest (utaki) contains ancient stones of worship predating the shrine buildings.",
        coordinate: CLLocationCoordinate2D(latitude: 26.2231, longitude: 127.7156),
        stampSlotId: 380,
        category: .jinja,
        tagline: "Okinawa's oldest shrine — where Ryukyuan spirits meet Shinto gods",
        highlights: [
            "Okinawa's oldest shrine with Ryukyu Kingdom origins",
            "Sacred utaki forest with pre-Shinto worship stones",
            "Blend of Ryukyuan and Shinto spiritual traditions",
            "Near Shuri Castle — UNESCO World Heritage Site"
        ],
        mustSee: "Walk into the sacred forest behind the shrine — the moss-covered stones and banyan roots create an atmosphere entirely different from mainland shrines. This is utaki worship, the indigenous Ryukyuan spiritual practice older than any building here.",
        tips: [
            "Combine with Shuri Castle (10 min walk) for a full day",
            "The forest is humid year-round — bring water and insect repellent",
            "Okinawan shrine architecture differs visibly from mainland styles",
            "Try nearby Shuri soba for lunch — Okinawa's signature noodle soup"
        ],
        bestSeason: "Year-round (subtropical climate), avoid typhoon season (August-October)",
        access: "10 min walk from Yui Rail Shuri Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000381")!,
        name: "Futenma-gu",
        address: "1-27-10 Futenma, Ginowan, Okinawa",
        description: "Built above a massive limestone cave on a hilltop in Ginowan, Futenma-gu is one of the Ryukyu Eight Shrines designated by the ancient Ryukyu Kingdom. The cave beneath the shrine extends deep into the limestone karst and was used as a shelter during the Battle of Okinawa. The shrine blends Okinawan folk religion with Buddhist and Shinto elements.",
        coordinate: CLLocationCoordinate2D(latitude: 26.3378, longitude: 127.7778),
        stampSlotId: 381,
        category: .jinja,
        tagline: "A Ryukyu Kingdom shrine above a vast limestone cave",
        highlights: [
            "One of the Ryukyu Eight Shrines of the ancient kingdom",
            "Built above a massive limestone cave open to visitors",
            "Blend of Okinawan folk religion, Buddhism, and Shinto",
            "WWII history — the cave sheltered civilians during the Battle of Okinawa"
        ],
        mustSee: "Descend into the limestone cave beneath the shrine — the stalactites and vast chambers are impressive, and the spiritual weight of a place that served as both sacred space and wartime shelter is palpable.",
        tips: [
            "The cave tour is available during shrine office hours — ask at the reception",
            "The area is near MCAS Futenma — a complex modern reality alongside ancient faith",
            "Combine with Shuri Castle and other Naha sightseeing",
            "Okinawan shiisa (guardian lion-dog) statues here differ from mainland komainu"
        ],
        bestSeason: "Year-round (subtropical), spring for mild weather",
        access: "Bus from Naha to Futenma stop (30 min), or car",
        hours: "Open 24 hours (cave tours 10:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000382")!,
        name: "Fujii-dera",
        address: "Fujii-dera, Yoshinogawa, Tokushima",
        description: "Temple #11 on the Shikoku 88 Temple Pilgrimage, Fujii-dera is known for its remarkable ceiling painting of a coiling dragon and the challenging mountain trail that follows to Temple #12. The temple sits at the base of the mountains and marks the transition from flatland walking to serious mountain pilgrimage — many henro (pilgrims) consider this the point where the real journey begins.",
        coordinate: CLLocationCoordinate2D(latitude: 34.0206, longitude: 134.1572),
        stampSlotId: 382,
        category: .tera,
        tagline: "Shikoku Pilgrimage #11 — where the mountain challenge begins",
        highlights: [
            "Temple #11 of the Shikoku 88 Temple Pilgrimage",
            "Stunning dragon ceiling painting in the main hall",
            "Gateway to the most challenging mountain section of the pilgrimage",
            "Wisteria (fuji) gardens — the temple's namesake flower"
        ],
        mustSee: "Look up inside the main hall — the dragon ceiling painting writhes across the wooden panels with startling vitality. Then contemplate the mountain trail ahead to Temple #12 (Shosan-ji), widely considered the pilgrimage's toughest stretch.",
        tips: [
            "If walking the pilgrimage, the trail to #12 is 12.9km of steep mountain paths",
            "Wisteria blooms in late April to early May — the temple's most beautiful season",
            "Stamp books (nokyocho) are stamped and calligraphed at the temple office",
            "Driving pilgrims can access the temple easily from Route 192"
        ],
        bestSeason: "Late April-May (wisteria), year-round for pilgrimage",
        access: "30 min walk from JR Kamojima Station, or taxi",
        hours: "7:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000383")!,
        name: "Yakuo-ji",
        address: "Hiwasa, Minami, Tokushima",
        description: "Temple #23 on the Shikoku 88 Temple Pilgrimage, perched on a hillside overlooking the Pacific Ocean at Hiwasa. Known as the temple for yakuyoke — warding off bad luck at unlucky ages. Pilgrims climb the 33 women's steps and 42 men's steps (matching the unlucky ages), placing coins on each step. The ocean views from the pagoda are magnificent.",
        coordinate: CLLocationCoordinate2D(latitude: 33.7317, longitude: 134.5283),
        stampSlotId: 383,
        category: .tera,
        tagline: "Shikoku #23 — climb the unlucky-age steps above the Pacific",
        highlights: [
            "Temple #23 of the Shikoku 88 Temple Pilgrimage",
            "Famous yakuyoke (bad luck warding) stairway tradition",
            "33 women's steps and 42 men's steps with coin offerings",
            "Panoramic Pacific Ocean views from the vermilion pagoda"
        ],
        mustSee: "Climb the yakuyoke stairs, placing a coin on each step as you ascend. At the top, the vermilion pagoda commands a sweeping view of the Pacific — a moment of triumph after symbolically leaving your bad luck on the steps behind you.",
        tips: [
            "Hiwasa is famous for sea turtle nesting — visit the turtle museum nearby",
            "The nearby Hiwasa Castle ruins offer additional ocean panoramas",
            "Coins placed on the steps are collected and used for temple maintenance",
            "Between Temples #22 and #24, this is a natural rest stop on the pilgrimage"
        ],
        bestSeason: "Year-round, summer for sea turtle season at nearby beaches",
        access: "10 min walk from JR Hiwasa Station (Mugi Line)",
        hours: "7:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000384")!,
        name: "Chikurin-ji",
        address: "3577 Godaisan, Kochi",
        description: "Temple #31 on the Shikoku 88 Temple Pilgrimage, set atop Mount Godai with commanding views over Kochi city and the Pacific coast. The temple's five-story pagoda rising above a lush botanical garden is one of Shikoku's most photogenic scenes. The treasure house contains an important collection of Heian-period Buddhist statues designated as Important Cultural Properties.",
        coordinate: CLLocationCoordinate2D(latitude: 33.5344, longitude: 133.5761),
        stampSlotId: 384,
        category: .tera,
        tagline: "Shikoku #31 — five-story pagoda above Kochi's Pacific panorama",
        highlights: [
            "Temple #31 of the Shikoku 88 Temple Pilgrimage",
            "Five-story pagoda rising above a botanical garden",
            "Panoramic views of Kochi city and the Pacific Ocean",
            "Important Heian-period Buddhist statuary collection"
        ],
        mustSee: "The five-story pagoda framed by the botanical garden's diverse flora — from subtropical palms to Japanese maples — creates a scene unlike any other temple on the pilgrimage. The Makino Botanical Garden adjacent is also superb.",
        tips: [
            "The adjacent Makino Botanical Garden is one of Japan's best — allow extra time",
            "My Bus sightseeing bus from Kochi Station stops here",
            "The treasure house requires separate admission but is worth it for Buddhist art fans",
            "Sunday market in Kochi city is one of Japan's largest street markets"
        ],
        bestSeason: "Spring (garden blooms), autumn (foliage with pagoda)",
        access: "My Bus from JR Kochi Station (25 min), or city bus to Godaisan stop",
        hours: "8:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000385")!,
        name: "Miyajidake Jinja",
        address: "7-1 Miyaji-moto-machi, Fukutsu, Fukuoka",
        description: "Famous across Japan for its spectacular 'Road of Light' phenomenon — twice a year during the spring and autumn equinoxes, the setting sun aligns perfectly with the shrine's long stairway approach, creating a golden pathway of light stretching from the shrine to the sea. The shrine also boasts Japan's largest shimenawa rope and the largest pair of bronze bells.",
        coordinate: CLLocationCoordinate2D(latitude: 33.7783, longitude: 130.4892),
        stampSlotId: 385,
        category: .jinja,
        tagline: "Road of Light — when the sunset aligns perfectly with the shrine path",
        highlights: [
            "Road of Light phenomenon at spring and autumn equinoxes",
            "Japan's largest shimenawa (sacred rope) — 11 meters, 3 tons",
            "Japan's largest pair of bronze bells",
            "Stunning sunset alignment from shrine to sea"
        ],
        mustSee: "Visit during the equinox periods (late February/October) when the setting sun creates a golden road of light along the shrine's approach to the ocean. Arrive 2 hours early to secure a viewing spot — this event draws enormous crowds.",
        tips: [
            "The Light Road occurs approximately February 20-28 and October 15-25",
            "Arrive very early on equinox days — the viewing area fills up hours before sunset",
            "The shrine is photogenic year-round, even without the light alignment",
            "Fukutsu's beaches are beautiful — combine with coastal sightseeing"
        ],
        bestSeason: "Late February and late October (Road of Light phenomenon)",
        access: "Bus from JR Fukuma Station (10 min), or 25 min walk",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000386")!,
        name: "Suizenji Jokoen Izumi Jinja",
        address: "8-1 Suizenji-koen, Chuo, Kumamoto",
        description: "A shrine set within the exquisite Suizenji Jojuen Garden — a Momoyama-era strolling garden that recreates the 53 stations of the old Tokaido road in miniature, including a Mount Fuji-shaped hill. The garden's spring-fed pond, fed by underground water from Mount Aso, is so clear that the miniature landscapes are perfectly reflected.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7881, longitude: 130.7264),
        stampSlotId: 386,
        category: .jinja,
        tagline: "Shrine within a garden that recreates all 53 Tokaido stations",
        highlights: [
            "Set within Suizenji Jojuen — one of Japan's finest strolling gardens",
            "Miniature recreation of the 53 stations of the Tokaido road",
            "Mount Fuji-shaped hill reflected in crystal-clear spring water",
            "Garden fed by underground springs from volcanic Mount Aso"
        ],
        mustSee: "Stand at the garden's mini Mount Fuji — a perfectly shaped grass mound — and imagine the Hosokawa lords who built this as a way to enjoy the Tokaido journey without leaving Kumamoto. The spring water clarity makes every reflection flawless.",
        tips: [
            "The garden charges admission (400 yen) — the shrine is inside the garden",
            "Early morning visits avoid crowds and offer the best reflections",
            "Combine with Kumamoto Castle (15 min by tram)",
            "Matcha tea service is available in the garden's teahouse"
        ],
        bestSeason: "Year-round, early morning for reflections",
        access: "5 min walk from Kumamoto City Tram Suizenji-koen stop",
        hours: "7:30-18:00 (March-November), 8:30-17:00 (December-February)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000387")!,
        name: "Hakuto Jinja",
        address: "Hakuto, Tottori, Tottori",
        description: "A seaside shrine on the white-sand coast of Hakuto, enshrining the White Rabbit of Inaba — the mythological hare who tricked crocodiles into forming a bridge across the sea, only to be skinned alive as punishment, then healed by the god Okuninushi. The shrine sits on the very beach where the myth took place and is popular for prayers of skin healing and romantic matchmaking.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5228, longitude: 134.0922),
        stampSlotId: 387,
        category: .jinja,
        tagline: "The beach where a mythical rabbit tricked crocodiles — and found love",
        highlights: [
            "Site of the White Rabbit of Inaba myth from the Kojiki",
            "Beachside setting on the actual coast of the legend",
            "Popular for skin healing and romantic matchmaking prayers",
            "Cute rabbit motifs throughout — ema, statues, omamori"
        ],
        mustSee: "Walk the beach and imagine the white rabbit hopping across the backs of sea crocodiles lined up in the waves. Rabbit statues dot the shrine grounds — find them all for good luck in love, as the rabbit later became a divine matchmaker.",
        tips: [
            "The nearby Tottori Sand Dunes are a must-see — Japan's largest dune system",
            "Rabbit-themed omamori and ema make charming souvenirs",
            "The beach is swimmable in summer — combine shrine visit with ocean time",
            "About 20 minutes from Tottori Station by bus"
        ],
        bestSeason: "Year-round, summer for beach and swimming",
        access: "Bus from JR Tottori Station to Hakuto Jinja-mae (20 min)",
        hours: "Open 24 hours (shrine office 9:00-16:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000388")!,
        name: "Motonosumi Jinja",
        address: "498 Yuyatsuo, Nagato, Yamaguchi",
        description: "One of Japan's most photogenic shrines — 123 vermilion torii gates snake down a seaside cliff to the crashing waves of the Sea of Japan below. The shrine's offertory box is deliberately placed 5 meters high atop the final torii gate — successfully tossing a coin into it is said to grant your wish. CNN named it one of Japan's 31 most beautiful places.",
        coordinate: CLLocationCoordinate2D(latitude: 34.4158, longitude: 131.0753),
        stampSlotId: 388,
        category: .jinja,
        tagline: "123 red torii gates cascading down a cliff into the sea",
        highlights: [
            "123 vermilion torii gates descending a cliff to the ocean",
            "CNN-listed as one of Japan's 31 most beautiful places",
            "Offertory box placed 5 meters high — toss your coin to make a wish",
            "Dramatic Sea of Japan coastline setting"
        ],
        mustSee: "The view from above — 123 red torii gates zigzagging down the green cliff to the deep blue sea — is one of Japan's most spectacular shrine scenes. Try tossing a coin into the elevated offertory box at the bottom torii — it takes most people many attempts.",
        tips: [
            "Best photographed from the parking area above, looking down",
            "The coin-toss challenge at the elevated offertory box is great fun",
            "Remote location — car is essential, limited parking on busy days",
            "Combine with Tsunoshima Bridge and Motonosumi area coastal scenery"
        ],
        bestSeason: "Year-round, clear days for best sea-and-torii contrast",
        access: "Car only — about 30 min from JR Nagato-Furuichi Station",
        hours: "Open 24 hours (free access, parking available dawn to dusk)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000389")!,
        name: "Tottori Higashi Shorenji",
        address: "7 Higashimachi, Tottori, Tottori",
        description: "A Zen temple in central Tottori known for its beautifully maintained dry landscape garden and its role as the family temple of the Ikeda lords who ruled the Tottori domain. The temple's autumn illumination, when the garden's maple trees are lit up at night and reflected in the pond, ranks among San'in region's most beautiful seasonal events.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4972, longitude: 134.2342),
        stampSlotId: 389,
        category: .tera,
        tagline: "Illuminated autumn nights in Tottori's most elegant Zen garden",
        highlights: [
            "Stunning autumn illumination event with maple reflections",
            "Well-maintained karesansui dry landscape garden",
            "Family temple of the Ikeda lords of Tottori domain",
            "Central Tottori location — easy to visit"
        ],
        mustSee: "During autumn illumination (late November), the garden's maple trees glow crimson against the night sky, their reflections creating a mirror world in the pond. This is one of western Japan's most atmospheric evening temple events.",
        tips: [
            "Autumn illumination dates vary — check the temple's schedule in advance",
            "By day, the dry landscape garden is quietly contemplative",
            "Combine with Tottori Sand Dunes and Hakuto Jinja for a full day",
            "Tottori pear (nashi) season in autumn pairs well with temple visits"
        ],
        bestSeason: "Late November (autumn illumination), year-round for gardens",
        access: "15 min walk from JR Tottori Station",
        hours: "9:00-17:00 (extended during illumination events)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000390")!,
        name: "Sado Kokubunji",
        address: "113 Kokubu-ji, Sado, Niigata",
        description: "The ancient provincial temple of Sado Island, where the exiled Emperor Juntoku and the monk Nichiren both spent time in banishment. The temple ruins preserve massive foundation stones from the original 8th-century Nara-period complex, while the current temple maintains a peaceful atmosphere amid rice paddies. Sado Island's isolation preserved traditions lost on the mainland.",
        coordinate: CLLocationCoordinate2D(latitude: 38.0200, longitude: 138.3933),
        stampSlotId: 390,
        category: .tera,
        tagline: "Island exile temple — where emperors and monks found unexpected peace",
        highlights: [
            "Ancient provincial temple on remote Sado Island",
            "Connected to exiled Emperor Juntoku and Nichiren",
            "Nara-period foundation stones from the original 8th-century complex",
            "Sado Island preserves traditions lost on the mainland"
        ],
        mustSee: "The massive foundation stones of the original 8th-century temple hint at its former grandeur — this was meant to be a beacon of imperial authority on a remote island. Walk the grounds imagining the exiled emperor gazing toward a capital he would never see again.",
        tips: [
            "Sado Island is reached by Sado Kisen ferry from Niigata Port (1-2.5 hours)",
            "Rent a car on Sado — public transport is very limited",
            "Combine with Earth Celebration (Kodo taiko) in August if timing allows",
            "Sado gold mine ruins and tub boat rides are other island highlights"
        ],
        bestSeason: "May-October for pleasant island weather, August for festivals",
        access: "Car recommended on Sado Island; ferry from Niigata Port",
        hours: "8:30-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000391")!,
        name: "Kumano Nachi Hiro Jinja",
        address: "1 Nachisan, Nachikatsuura, Wakayama",
        description: "Adjacent to Kumano Nachi Taisha and the famous Nachi Waterfall, this shrine specifically enshrines the spirit of the great waterfall itself — Hiro Gongen, the deity of the cascade. The 133-meter Nachi Falls, Japan's tallest single-drop waterfall, has been worshipped here since before recorded history. The vermilion pagoda framed against the waterfall is one of Japan's most iconic views.",
        coordinate: CLLocationCoordinate2D(latitude: 33.6706, longitude: 135.8897),
        stampSlotId: 391,
        category: .jinja,
        tagline: "Where Japan's tallest waterfall is worshipped as a living god",
        highlights: [
            "Enshrines the spirit of Nachi Falls — Japan's tallest waterfall (133m)",
            "Vermilion pagoda with waterfall backdrop — Japan's most iconic view",
            "Pre-Buddhist waterfall worship predating recorded history",
            "Part of the Kumano Kodo pilgrimage UNESCO World Heritage Site"
        ],
        mustSee: "The vermilion three-story pagoda with the 133-meter Nachi Waterfall cascading behind it is arguably Japan's single most photographed scene. Morning light is best — arrive early before tour groups.",
        tips: [
            "Walk down to the waterfall base for the full 133-meter perspective",
            "Combine with Kumano Nachi Taisha (adjacent) and the Daimon-zaka stone stairway",
            "The Kumano Kodo pilgrimage trail passes through this area",
            "July 14 Nachi Fire Festival features enormous torches carried down the stairs"
        ],
        bestSeason: "Year-round, July 14 (Fire Festival), autumn and spring for pilgrim trails",
        access: "Bus from JR Nachi Station to Nachi-no-Taki-mae (30 min)",
        hours: "7:00-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000392")!,
        name: "Tsubaki Grand Shrine",
        address: "1871 Yamamoto-cho, Suzuka, Mie",
        description: "Japan's oldest shrine dedicated to Sarutahiko-no-Okami — the towering earthly deity who guided the heavenly gods to Japan in mythology. Tsubaki Grand Shrine has a powerful, grounding energy and is especially popular among martial artists, who come to receive blessings for strength and protection. The shrine's forest is home to ancient Japanese cedars and a sacred waterfall for misogi purification.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9256, longitude: 136.4539),
        stampSlotId: 392,
        category: .jinja,
        tagline: "Japan's oldest Sarutahiko shrine — where martial artists seek blessings",
        highlights: [
            "Japan's oldest shrine to Sarutahiko, the earthly guide of the gods",
            "Popular among martial artists for strength and protection blessings",
            "Sacred waterfall for misogi (cold water purification) rituals",
            "Ancient cedar forest creating a powerful spiritual atmosphere"
        ],
        mustSee: "The misogi waterfall experience — standing beneath a sacred cascade in white robes, chanting Shinto prayers as ice-cold water pounds your shoulders. Reservations required, but this is one of the most authentic spiritual experiences available at any Japanese shrine.",
        tips: [
            "Misogi (waterfall purification) can be arranged — contact the shrine in advance",
            "The shrine has a branch in Granite Falls, Washington (USA)",
            "Near Suzuka Circuit — combine if visiting for motorsport events",
            "The shrine's kagura dance performances are held on festival days"
        ],
        bestSeason: "Year-round, festival days for kagura performances",
        access: "Bus from Kintetsu Tsubaki-Okami-mae Station (5 min walk)",
        hours: "Open 24 hours (shrine office 8:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000393")!,
        name: "Zeniarai Benzaiten",
        address: "2-25-16 Sasuke, Kamakura, Kanagawa",
        description: "Hidden in a cave in the Kamakura hills, this unique shrine is dedicated to Benzaiten, goddess of wealth. Visitors wash their money in the cave's sacred spring water — legend holds that money washed here will multiply. The approach through a tunnel carved into the rock and the cave setting with dripping water create an atmosphere unlike any other shrine in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3247, longitude: 139.5403),
        stampSlotId: 393,
        category: .jinja,
        tagline: "Wash your money in a sacred cave — and watch it multiply",
        highlights: [
            "Unique money-washing ritual in a natural cave spring",
            "Dedicated to Benzaiten, goddess of wealth and good fortune",
            "Atmospheric approach through a rock tunnel into the hillside",
            "Cave shrine setting with sacred spring water"
        ],
        mustSee: "Place your coins (or even bills) in the provided baskets and wash them in the cave spring water while praying for prosperity. The flickering candles, dripping water, and close cave walls make this feel like discovering a secret treasure grotto.",
        tips: [
            "Bring coins and small bills to wash — the shrine provides baskets",
            "The approach from Kamakura Station is uphill (20 min walk)",
            "Washed money should be spent, not saved — the circulation multiplies it",
            "Combine with the Daibutsu hiking trail which passes nearby"
        ],
        bestSeason: "Year-round, Mi-no-Hi (Snake Day) is considered especially auspicious",
        access: "20 min walk from JR Kamakura Station (uphill)",
        hours: "8:00-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000394")!,
        name: "Goshanotaki Jinja",
        address: "Gosho Otaki, Nagatoro, Saitama",
        description: "Nestled beside a series of cascading waterfalls in the Chichibu mountains, this shrine draws visitors to its sacred falls used for takigyō (waterfall meditation practice). The main waterfall drops in dramatic tiers through moss-covered rocks surrounded by dense forest. The autumn foliage framing the waterfalls creates one of Saitama's most spectacular seasonal views.",
        coordinate: CLLocationCoordinate2D(latitude: 36.1064, longitude: 139.1028),
        stampSlotId: 394,
        category: .jinja,
        tagline: "Sacred waterfalls in the Chichibu mountains for meditative practice",
        highlights: [
            "Cascading waterfalls used for takigyō meditation practice",
            "Dense forest setting in the Chichibu mountain foothills",
            "Spectacular autumn foliage framing the falls",
            "Near Nagatoro — famous for river gorge boat rides"
        ],
        mustSee: "The multi-tiered waterfall cascading through moss-covered rocks is mesmerizing. In November, the surrounding maples turn brilliant red, framing the white water in crimson — bring a camera with a slow-shutter capability.",
        tips: [
            "Combine with Nagatoro river boat rides through the scenic gorge",
            "The Chichibu area has many other shrines — Chichibu Jinja, Mitsumine, Hodosan",
            "Wear sturdy shoes — the path to the falls can be slippery",
            "The Chichibu Railway from Kumagaya is a scenic ride"
        ],
        bestSeason: "November (autumn foliage), summer for waterfall coolness",
        access: "Car recommended; nearest station is Chichibu Railway Nagatoro Station",
        hours: "Open 24 hours (free access)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000395")!,
        name: "Suwa Taisha Kamisha",
        address: "Kamisha-mae, Suwa, Nagano",
        description: "The Upper Shrine (Kamisha) of Suwa Taisha — one of Japan's oldest and most mysterious shrine complexes. Uniquely among major shrines, Suwa Taisha has no main hall (honden) — the mountain behind serves as the object of worship itself. The shrine is famous for the Onbashira Festival, held every six years, where massive logs are ridden down mountainsides in a terrifyingly dangerous ritual.",
        coordinate: CLLocationCoordinate2D(latitude: 36.0753, longitude: 138.1111),
        stampSlotId: 395,
        category: .taisha,
        tagline: "No main hall — the mountain itself is god, honored by death-defying log rides",
        highlights: [
            "No honden — the mountain behind IS the deity worshipped",
            "Onbashira Festival (every 6 years) — men ride massive logs downhill",
            "One of Japan's oldest shrine complexes with prehistoric origins",
            "Four Onbashira (sacred pillars) mark the shrine's corners"
        ],
        mustSee: "Look for the four massive Onbashira pillars at the corners of the shrine — these logs were cut from the mountains, ridden downhill by daredevils, then hauled upright in a ceremony that costs lives each generation. The absence of a main hall forces you to contemplate the mountain as a living deity.",
        tips: [
            "Onbashira Festival years: 2028, 2034, etc. (Years of Tiger and Monkey)",
            "Suwa Taisha has four shrines — Kamisha Honmiya and Maemiya, Shimosha Harumiya and Akimiya",
            "Visit all four for the complete Suwa experience (car recommended)",
            "The area's onsen (hot springs) are among Nagano's best"
        ],
        bestSeason: "Onbashira years (April-May), year-round",
        access: "15 min walk from JR Chino Station, or bus to Kamisha-mae",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000396")!,
        name: "Fushimi Momoyama Goryo",
        address: "Momoyama-cho Furijo, Fushimi, Kyoto",
        description: "The imperial mausoleum of Emperor Meiji — the transformative ruler who oversaw Japan's leap from feudal isolation to modern world power during the Meiji Restoration. Set atop Fushimi Castle hill, the massive burial mound is approached through a solemn avenue of trees. The site offers panoramic views and a profound sense of the weight of modern Japanese history.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9367, longitude: 135.7906),
        stampSlotId: 396,
        category: .jinja,
        tagline: "Emperor Meiji's final rest — atop the hill where Japan became modern",
        highlights: [
            "Imperial mausoleum of Emperor Meiji (reigned 1868-1912)",
            "Built on the site of Fushimi Castle (Toyotomi Hideyoshi's last castle)",
            "Solemn tree-lined approach to the burial mound",
            "Panoramic views of Kyoto and the surrounding mountains"
        ],
        mustSee: "The long approach through towering trees to the enormous burial mound creates a powerful atmosphere of reverence. This is where modern Japan's founding emperor rests — the man who transformed the country from a feudal society into a world power in a single lifetime.",
        tips: [
            "The site is large and quiet — very few tourists venture here",
            "Fushimi is famous for sake — over 30 breweries are nearby",
            "Combine with Fushimi Inari Taisha (different Fushimi area, but connected by train)",
            "The Imperial Household Agency maintains the site — respectful behavior is expected"
        ],
        bestSeason: "Year-round, especially clear autumn and winter days",
        access: "15 min walk from Momoyama Station (JR Nara Line) or Momoyama-Goryo-mae Station (Kintetsu)",
        hours: "8:30-17:00 (last entry 16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000397")!,
        name: "Hikawa Jinja Omiya",
        address: "1-407 Takahana-cho, Omiya, Saitama",
        description: "The head shrine of over 280 Hikawa shrines across the Kanto region, with a 2,000-year history making it one of Japan's most ancient. The shrine's approach (sando) stretches an impressive 2 kilometers — the longest in Japan — lined with towering keyaki (zelkova) trees. As the spiritual protector of the Musashi Province, it was the most important shrine in the entire Kanto region.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9069, longitude: 139.6289),
        stampSlotId: 397,
        category: .jinja,
        tagline: "Japan's longest shrine approach — 2km of zelkova trees in Kanto's holiest shrine",
        highlights: [
            "Head shrine of 280+ Hikawa shrines across Kanto",
            "Japan's longest shrine approach (sando) — 2 kilometers",
            "Over 2,000 years of history as Musashi Province's premier shrine",
            "Massive sacred precinct within Omiya Park"
        ],
        mustSee: "Walk the full 2-kilometer sando from Saitama-Shintoshin Station — the zelkova-lined approach builds anticipation over 30 minutes of walking, culminating at the grand shrine. This processional experience is unmatched in Japan.",
        tips: [
            "Different from Hikawa Jinja Akasaka in Tokyo — this is the head shrine",
            "The shrine is within Omiya Park, which has a bonsai village worth visiting",
            "Hatsumode (New Year) draws over 2 million visitors — expect massive crowds",
            "The name Omiya literally means 'great shrine' — referring to this shrine"
        ],
        bestSeason: "Year-round, avoiding New Year crowds unless you want the experience",
        access: "15 min walk from JR Omiya Station or Saitama-Shintoshin Station",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000398")!,
        name: "Yanaka Tennoji",
        address: "7-14-8 Yanaka, Taito, Tokyo",
        description: "A weathered Tendai temple in the heart of Tokyo's nostalgic Yanaka district — one of the few neighborhoods that survived WWII bombing and retains its pre-war shitamachi atmosphere. The temple's bronze seated Buddha overlooks Yanaka Cemetery, where the last Tokugawa shogun is buried. The surrounding streets of traditional shops and cats create Tokyo's most time-warped experience.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7261, longitude: 139.7678),
        stampSlotId: 398,
        category: .tera,
        tagline: "Bronze Buddha watching over old Tokyo's most nostalgic neighborhood",
        highlights: [
            "Bronze seated Buddha overlooking historic Yanaka Cemetery",
            "Heart of Yanaka — Tokyo's best-preserved shitamachi district",
            "Yanaka Cemetery contains the grave of the last Tokugawa shogun",
            "Surrounding streets filled with traditional shops and stray cats"
        ],
        mustSee: "The bronze seated Buddha gazing serenely over the cemetery and Yanaka's rooftops captures something essential about old Tokyo — continuity amid change. Walk through the cemetery to find the last shogun's grave, then explore Yanaka Ginza shopping street.",
        tips: [
            "Yanaka Ginza sunset stairway (Yuyake Dandan) offers a lovely evening view",
            "The neighborhood is famous for its cats — look for cat-themed shops",
            "Combine with Nezu Jinja and Ueno Park for a full northeast Tokyo day",
            "Weekday visits are much quieter than weekends"
        ],
        bestSeason: "Spring (cherry blossoms in cemetery), autumn for pleasant walks",
        access: "5 min walk from JR/Keisei Nippori Station",
        hours: "Open 24 hours (free access to grounds)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000399")!,
        name: "Chichibu Imamiya Jinja",
        address: "8-15 Naka-machi, Chichibu, Saitama",
        description: "A powerful shrine in the heart of Chichibu known for its Ryujin-ike (Dragon God Pond) and enormous sacred zelkova tree. The shrine serves as the starting point for the Chichibu Night Festival — one of Japan's three great float festivals and a UNESCO Intangible Cultural Heritage. In December, enormous illuminated floats parade through the streets accompanied by spectacular fireworks.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9919, longitude: 139.0842),
        stampSlotId: 399,
        category: .jinja,
        tagline: "Where the Chichibu Night Festival begins — fireworks, floats, and dragon gods",
        highlights: [
            "Starting point of Chichibu Night Festival (UNESCO heritage, December)",
            "Ryujin-ike (Dragon God Pond) for spiritual purification",
            "Enormous sacred zelkova tree at the shrine entrance",
            "One of Japan's three great float festivals"
        ],
        mustSee: "During the Chichibu Night Festival (December 2-3), enormous floats weighing up to 20 tons are hauled through the streets to the shrine amid spectacular fireworks. The combination of winter cold, fire, and thundering drums creates a primal, electrifying atmosphere.",
        tips: [
            "Chichibu Night Festival is December 2-3 — book transport and lodging far in advance",
            "Trains from Ikebukuro (Seibu Line) reach Chichibu in about 80 minutes",
            "Combine with Chichibu Jinja and the 34 Kannon pilgrimage temples",
            "Chichibu whiskey and local sake are excellent souvenirs"
        ],
        bestSeason: "December 2-3 (Night Festival), spring for Shibazakura phlox fields",
        access: "10 min walk from Seibu-Chichibu Station or Chichibu Railway Ohanabatake Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000400")!,
        name: "Izumo Daijingu Kyoto",
        address: "Izumo-ji Dono-uchi-cho, Kamigyo, Kyoto",
        description: "A branch of the great Izumo Taisha in the heart of Kyoto, making the powerful en-musubi (matchmaking) blessings of the Izumo gods accessible without traveling to remote Shimane. The shrine's massive shimenawa rope mirrors the one at Izumo Taisha, and the same unique ritual of clapping four times instead of the standard two is practiced here. Young couples flock here for relationship blessings.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0289, longitude: 135.7472),
        stampSlotId: 400,
        category: .jinja,
        tagline: "Izumo's matchmaking magic in the heart of Kyoto",
        highlights: [
            "Branch shrine of Izumo Taisha — Japan's supreme matchmaking shrine",
            "Massive shimenawa rope mirroring the original in Shimane",
            "Unique four-clap worship ritual instead of the standard two",
            "Hugely popular with couples seeking en-musubi blessings"
        ],
        mustSee: "Perform the unique Izumo worship — bow twice, clap four times (not the usual two), then bow once. The quadruple clap connects you spiritually to the great Izumo Taisha 500km away. The en-musubi (love-knot) amulets are among Kyoto's most popular.",
        tips: [
            "Much more accessible than traveling to Izumo Taisha in Shimane",
            "The en-musubi amulets come in pairs — buy two for you and your partner",
            "Located in a quiet residential area of Kamigyo — peaceful atmosphere",
            "Combine with nearby Kitano Tenmangu (15 min walk)"
        ],
        bestSeason: "Year-round, especially popular during Shinto wedding season (spring/autumn)",
        access: "Bus from Kyoto Station to Izumo-ji-mae stop, or 10 min walk from Imadegawa Station",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kanto Expanded (401-480)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    // --- Tokyo ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000401")!,
        name: "Hatonomori Hachiman Jinja",
        address: "1-1-24 Sendagaya, Shibuya, Tokyo",
        description: "Tucked beside the National Stadium in Sendagaya, Hatonomori Hachiman is one of Tokyo's hidden gems. Its name means 'Dove Forest,' and wild doves still nest in the towering zelkova canopy. The shrine houses a shogi hall where Japan's top professional matches are played, making it a pilgrimage site for board-game enthusiasts alongside the faithful.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6805, longitude: 139.7112),
        stampSlotId: 401,
        category: .hachimangu,
        tagline: "Dove forest and shogi battles beside the National Stadium",
        highlights: [
            "Sacred dove forest with wild doves nesting in ancient zelkova trees",
            "Shogi Hall where top professional title matches are held",
            "Noh stage used for traditional performances",
            "Mount Fuji-shaped mound (Fuji-zuka) for miniature Fuji worship"
        ],
        mustSee: "Climb the Fuji-zuka, a miniature replica of Mount Fuji built from volcanic rock. This Edo-era tradition let commoners who couldn't travel to Fuji experience its spiritual power locally. The view from the top reveals the shrine's lush canopy spreading beneath you.",
        tips: [
            "Just a 5-minute walk from the New National Stadium — combine with event visits",
            "The shogi amulets are unique to this shrine and popular with strategy-game fans",
            "Quiet even on weekends despite its central location",
            "Meiji Jingu Gaien Ginkgo Avenue is a short walk away"
        ],
        bestSeason: "Autumn for ginkgo colors along nearby Gaien avenue, year-round for doves",
        access: "5 min walk from JR Sendagaya Station or Toei Oedo Kokuritsu-Kyogijo Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000402")!,
        name: "Nishiarai Daishi",
        address: "1-15-1 Nishiarai, Adachi, Tokyo",
        description: "Formally known as Soji-ji, Nishiarai Daishi is one of the Kanto region's most important Kobo Daishi temples. Founded in 826 when Kobo Daishi struck the ground and a healing spring erupted, its name literally means 'new well in the west.' The temple draws enormous New Year crowds and is revered for warding off misfortune and illness.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7783, longitude: 139.7875),
        stampSlotId: 402,
        category: .daishi,
        tagline: "Kobo Daishi's healing spring — Kanto's great misfortune-warding temple",
        highlights: [
            "One of the Three Great Daishi temples of the Kanto region",
            "Sacred healing well dug by Kobo Daishi himself in 826",
            "Spectacular peony garden with over 100 varieties",
            "Massive hatsumode (New Year) crowds — among Tokyo's busiest"
        ],
        mustSee: "Visit the original 'Nishiarai' — the sacred well that gave the area its name. According to legend, Kobo Daishi prayed to cure a plague, struck the earth with his staff, and a spring of healing water burst forth. The well still stands within the temple grounds.",
        tips: [
            "Avoid New Year's first three days unless you enjoy epic crowds",
            "The peony garden blooms spectacularly in late April to early May",
            "Daruma doll market in February is colorful and festive",
            "Easy access from Nishiarai Daishi-mae Station on the Tobu Daishi Line"
        ],
        bestSeason: "Late April–May for peonies, February for daruma market",
        access: "5 min walk from Tobu Daishi Line Daishi-mae Station",
        hours: "6:00-20:00 (main hall), grounds open earlier",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000403")!,
        name: "Togoshi Hachiman Jinja",
        address: "3-1-8 Togoshi, Shinagawa, Tokyo",
        description: "Nestled at the edge of one of Tokyo's longest shopping streets, Togoshi Hachiman is a neighborhood shrine with an unexpectedly grand presence. Its clear spring-fed pond, filled with koi, creates a reflective oasis in the busy Togoshi Ginza district. The shrine's history stretches back to 1526 and it remains the spiritual anchor of this lively shitamachi neighborhood.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6136, longitude: 139.7166),
        stampSlotId: 403,
        category: .hachimangu,
        tagline: "Spring-fed serenity beside Tokyo's longest shopping street",
        highlights: [
            "Crystal-clear spring-fed koi pond within the shrine grounds",
            "Adjacent to Togoshi Ginza — one of Tokyo's longest shotengai streets",
            "500-year history as the neighborhood's spiritual guardian",
            "Beautiful stone torii gate framing the approach"
        ],
        mustSee: "Admire the spring-fed pond where massive koi glide beneath a curtain of overhanging maples. The water is remarkably clear for central Tokyo, fed by an underground spring. In autumn, the reflected scarlet leaves make this one of Shinagawa's most photogenic spots.",
        tips: [
            "Combine with a walk down Togoshi Ginza shopping street for street food",
            "The croquettes (korokke) from nearby shops are famous citywide",
            "Quiet and uncrowded most days — a genuine local shrine experience",
            "10-minute walk connects to Ebara Jinja for a shrine-hopping route"
        ],
        bestSeason: "Autumn for maple reflections in the koi pond, year-round for shopping street",
        access: "3 min walk from Togoshi Station (Toei Asakusa Line) or Togoshi-Ginza Station (Tokyu Ikegami Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000404")!,
        name: "Ebara Jinja",
        address: "2-30-28 Kitashinagawa, Shinagawa, Tokyo",
        description: "Ebara Jinja stands where the old Tokaido road meets the Meguro River, marking the gateway to Edo since ancient times. Founded in 709, it enshrines Takeokami-no-Kami, the dragon god of water. Its Tennō Matsuri in June features portable shrines being plunged into the sea at Shinagawa — a rare and exhilarating urban ocean festival.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6200, longitude: 139.7399),
        stampSlotId: 404,
        category: .jinja,
        tagline: "Dragon-god shrine where mikoshi dive into Tokyo Bay",
        highlights: [
            "Tennō Matsuri — mikoshi are carried into the ocean at Shinagawa",
            "Over 1,300 years of history as Shinagawa's guardian shrine",
            "Dragon-god deity (Takeokami) associated with water and rain",
            "Scenic location at the confluence of old Tokaido and Meguro River"
        ],
        mustSee: "If you visit in June, witness the Tennō Matsuri where teams of bearers charge into the shallow waters of old Shinagawa harbor carrying massive mikoshi. The sight of ornate portable shrines splashing through ocean waves with Tokyo's skyline behind them is unforgettable.",
        tips: [
            "Tennō Matsuri is held in early June — check exact dates each year",
            "Combine with Togoshi Hachiman (10 min walk) for a shrine pair",
            "The old Tokaido road nearby has preserved Edo-era atmosphere",
            "Cherry blossoms along the Meguro River are stunning in spring"
        ],
        bestSeason: "June for Tennō Matsuri, spring for Meguro River cherry blossoms",
        access: "1 min walk from Shimbamba Station (Keikyu Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000405")!,
        name: "Meguro Daien-ji",
        address: "1-8-5 Shimomeguro, Meguro, Tokyo",
        description: "This hillside Tendai temple is famous for its haunting collection of 500 Rakan (arhat) stone statues, carved to memorialize victims of the Great Meireki Fire of 1657 that devastated Edo. Each figure has a unique expression — smiling, weeping, meditating, laughing — and visitors are said to find one that resembles someone they know. The mossy statues create an atmospheric scene unlike anything in modern Meguro.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6332, longitude: 139.7126),
        stampSlotId: 405,
        category: .tera,
        tagline: "Five hundred stone faces remembering Edo's great fire",
        highlights: [
            "500 unique Rakan (arhat) statues with individually carved expressions",
            "Memorial to victims of the devastating Meireki Fire of 1657",
            "Atmospheric moss-covered hillside temple grounds",
            "Jizo statues and Kannon hall along the approach"
        ],
        mustSee: "Walk slowly among the 500 Rakan statues, each carved with a different expression. Tradition says you will find one face that resembles a loved one — or yourself. The moss-covered stone figures beneath the tree canopy create an otherworldly atmosphere, especially on misty mornings.",
        tips: [
            "Located on the opposite side of Meguro Station from the river — easy to miss",
            "Best photographed in early morning light or after rain when moss glows green",
            "The Gyōnin-zaka slope beside the temple is historic and picturesque",
            "Combine with Meguro Fudo (Ryusen-ji) for a Meguro temple walk"
        ],
        bestSeason: "Year-round; rainy season (June) enhances the mossy atmosphere",
        access: "3 min walk from JR/Tokyu Meguro Station (west exit)",
        hours: "8:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000406")!,
        name: "Hikawa Jinja Shibuya",
        address: "1-4-5 Higashi, Shibuya, Tokyo",
        description: "Hidden on a forested hilltop just minutes from the neon chaos of Shibuya Crossing, this 1,100-year-old Hikawa Shrine feels like stepping through a portal to old Edo. Giant zelkova trees tower over the approach, and the serene atmosphere makes it almost impossible to believe you are in the heart of Shibuya. It is the ward's oldest shrine and a powerful en-musubi (matchmaking) spot.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6554, longitude: 139.7136),
        stampSlotId: 406,
        category: .jinja,
        tagline: "An ancient forest shrine hiding in plain sight behind Shibuya",
        highlights: [
            "Over 1,100 years old — Shibuya ward's oldest shrine",
            "Towering zelkova trees creating a forest canopy in central Tokyo",
            "Popular en-musubi (matchmaking) blessings and amulets",
            "Monthly en-musubi festival on the 15th with special ceremonies"
        ],
        mustSee: "Stand at the base of the main approach and look up at the canopy of ancient zelkova trees. The silence is startling given that Shibuya Crossing is barely 10 minutes away on foot. The contrast between this primeval forest corridor and the surrounding city is Shibuya's greatest secret.",
        tips: [
            "The monthly en-musubi ceremony on the 15th is popular — arrive early",
            "Enter from the south approach for the most dramatic tree-lined walk",
            "Practically unknown to tourists despite proximity to Shibuya Station",
            "Combine with a walk through the quiet backstreets of Higashi Shibuya"
        ],
        bestSeason: "Year-round; autumn for zelkova colors, monthly 15th for en-musubi",
        access: "15 min walk from JR Shibuya Station east exit, or 8 min from Miyamasuzaka",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000407")!,
        name: "Ana Hachimangu",
        address: "2-1-11 Nishiwaseda, Shinjuku, Tokyo",
        description: "Perched on a hill overlooking Waseda University, Ana Hachimangu is famous for its annual Takada no Baba Yabusame — a spectacular horseback archery ritual performed on a busy Tokyo street. The 'Ana' (cave) in its name refers to a golden light that allegedly emanated from a hillside cave where a sacred image was discovered. The shrine is especially revered at year-end for its Ichiyō-raifuku winter solstice amulets.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7114, longitude: 139.7189),
        stampSlotId: 407,
        category: .hachimangu,
        tagline: "Horseback archery on city streets and golden-light cave legends",
        highlights: [
            "Annual yabusame (horseback archery) at Takada no Baba in October",
            "Legendary golden light cave origin story",
            "Famous Ichiyō-raifuku amulets available only at winter solstice",
            "Historic hilltop location overlooking the Waseda district"
        ],
        mustSee: "The Ichiyō-raifuku amulet, available only around the winter solstice, is one of Tokyo's most sought-after lucky charms. People queue for hours before dawn to purchase one. The amulet represents 'one positive return' — the turning point when darkness gives way to increasing light.",
        tips: [
            "Yabusame (horseback archery) is in early October at nearby Takada no Baba",
            "Winter solstice amulet sales draw huge pre-dawn queues — dress warmly",
            "Walking distance from Waseda University campus",
            "The surrounding Nishiwaseda area has great student-priced restaurants"
        ],
        bestSeason: "Winter solstice for Ichiyō-raifuku amulets, October for yabusame",
        access: "5 min walk from Tokyo Metro Waseda Station (Tozai Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000408")!,
        name: "Otori Jinja Asakusa",
        address: "3-18-7 Senzoku, Taito, Tokyo",
        description: "Home of the legendary Tori no Ichi festival, Otori Jinja comes alive every November when thousands pack its grounds to buy elaborately decorated kumade (bamboo rakes) believed to 'rake in' good fortune and business success. The festival atmosphere — with vendors shouting, crowds clapping, and massive golden kumade glittering under festival lights — is one of Tokyo's most energetic and authentic matsuri experiences.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7247, longitude: 139.7937),
        stampSlotId: 408,
        category: .jinja,
        tagline: "Rake in your fortune at Tokyo's electrifying Tori no Ichi festival",
        highlights: [
            "Birthplace of the Tori no Ichi festival (November, rooster days)",
            "Spectacular kumade (lucky bamboo rake) market",
            "One of Tokyo's most atmospheric and authentic festival experiences",
            "Adjacent to Yoshiwara historic district"
        ],
        mustSee: "Visit during Tori no Ichi (November, on days of the rooster in the Chinese zodiac). Watch as business owners purchase increasingly elaborate kumade rakes — some costing millions of yen — and the vendors lead the crowd in rhythmic hand-clapping to seal each deal. The energy is absolutely infectious.",
        tips: [
            "Tori no Ichi dates change yearly based on the Chinese zodiac — check in advance",
            "Come after dark for the best atmosphere — lanterns and food stalls glow spectacularly",
            "Even a small kumade makes a wonderful and authentic souvenir",
            "The adjacent Chōmeiji temple also participates in Tori no Ichi"
        ],
        bestSeason: "November for Tori no Ichi (essential), otherwise year-round",
        access: "7 min walk from Iriya Station (Tokyo Metro Hibiya Line) or Minowa Station (Hibiya Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00, extended during Tori no Ichi)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000409")!,
        name: "Ushijima Jinja",
        address: "1-4-1 Mukojima, Sumida, Tokyo",
        description: "Sitting quietly on the banks of the Sumida River, Ushijima Jinja has guarded this stretch of water for over 1,100 years. Its name means 'Ox Island Shrine' and a beloved stone ox statue in the grounds is said to heal ailments — rub the part of the ox that corresponds to your ailing body part. The shrine offers peaceful river views and a genuine shitamachi atmosphere away from the Skytree crowds nearby.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7140, longitude: 139.8064),
        stampSlotId: 409,
        category: .jinja,
        tagline: "Rub the healing ox beside the ancient Sumida River",
        highlights: [
            "Healing stone ox statue (nade-ushi) — rub it to cure ailments",
            "Over 1,100 years of history on the banks of the Sumida River",
            "Genuine shitamachi atmosphere in the Mukojima district",
            "Beautiful views of the river and Tokyo Skytree"
        ],
        mustSee: "Find the stone ox (nade-ushi) near the main hall. Rub the corresponding part of the ox's body to heal your own ailment — its head for headaches, legs for knee pain, belly for digestive troubles. The statue has been polished smooth by centuries of hopeful hands.",
        tips: [
            "Combine with a stroll along the Sumida River and Mukojima Hyakkaen garden",
            "The Mukojima neighborhood has wonderful old-fashioned sweet shops",
            "Tokyo Skytree is visible from the shrine grounds — great photo angle",
            "Much quieter than the Asakusa side of the river"
        ],
        bestSeason: "Spring for cherry blossoms along the Sumida, summer for fireworks views",
        access: "5 min walk from Tobu Skytree Line Hikifune Station or Honjo-Azumabashi Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000410")!,
        name: "Fukagawa Shinmeigu",
        address: "2-4-11 Morishita, Koto, Tokyo",
        description: "A compact but beautifully maintained shrine in the heart of old Fukagawa, Shinmeigu is an Ise Jingu branch shrine that brings the spiritual power of Japan's most sacred sanctuary to downtown Tokyo. Its striking modern goshuincho (stamp books) and artistic goshuin have made it a sensation among stamp collectors. The shrine is a masterclass in how traditional spirituality can embrace contemporary design.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6835, longitude: 139.8014),
        stampSlotId: 410,
        category: .jinja,
        tagline: "Ise's sacred light in Fukagawa — where tradition meets modern stamp art",
        highlights: [
            "Branch shrine of Ise Jingu in the Fukagawa district",
            "Famous for beautifully artistic and seasonal goshuin designs",
            "Elegant modern shrine aesthetic while maintaining traditional worship",
            "Popular starting point for Fukagawa shrine-hopping walks"
        ],
        mustSee: "Collect the shrine's goshuin, widely regarded as among the most beautiful in Tokyo. The designs change with the seasons and special occasions, featuring hand-drawn illustrations, gold leaf, and calligraphy that transform the traditional stamp into genuine art.",
        tips: [
            "Check their social media for current limited-edition goshuin designs",
            "Popular goshuin may sell out — visit early in the day",
            "Combine with Tomioka Hachimangu and Fukagawa Fudo for a full Fukagawa pilgrimage",
            "The surrounding Morishita area has excellent old-school kissaten (coffee shops)"
        ],
        bestSeason: "Year-round; seasonal goshuin designs change throughout the year",
        access: "5 min walk from Morishita Station (Toei Shinjuku/Oedo Line)",
        hours: "9:00-16:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000411")!,
        name: "Kumano Jinja Shinjuku",
        address: "2-11-2 Nishishinjuku, Shinjuku, Tokyo",
        description: "Wedged between Shinjuku's gleaming office towers, this branch of the sacred Kumano Sanzan provides an improbable pocket of spiritual calm in the heart of Tokyo's busiest business district. The yatagarasu — the mythical three-legged crow of the Kumano faith — adorns the shrine's amulets and is also the symbol of the Japan Football Association, making this a pilgrimage site for football fans before major matches.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6908, longitude: 139.6936),
        stampSlotId: 411,
        category: .jinja,
        tagline: "The three-legged crow of Kumano watches over Shinjuku's skyscrapers",
        highlights: [
            "Branch shrine of the sacred Kumano Sanzan pilgrimage network",
            "Yatagarasu (three-legged crow) — symbol shared with Japan's football association",
            "Spiritual oasis surrounded by Nishishinjuku skyscrapers",
            "Popular with J-League and Samurai Blue football fans"
        ],
        mustSee: "Get a yatagarasu amulet featuring the three-legged crow. This mythical bird guided Emperor Jimmu through the wilderness, and the same symbol appears on the Japan Football Association crest. Football fans visit before matches to pray for victory.",
        tips: [
            "The yatagarasu victory amulets are especially popular during World Cup season",
            "Just a 5-minute walk from the west exit of Shinjuku Station",
            "Tiny grounds but powerful atmosphere amid the towers",
            "The small waterfall purification area is surprisingly peaceful"
        ],
        bestSeason: "Year-round; before major football tournaments for victory prayers",
        access: "5 min walk from JR Shinjuku Station west exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000412")!,
        name: "Araiyakushi Baishoin",
        address: "5-3-5 Arai, Nakano, Tokyo",
        description: "Formally known as Baishoin, this Shingon temple in Nakano is dedicated to Yakushi Nyorai, the Buddha of Healing. It became famous when a sacred Yakushi image — said to cure eye diseases — was discovered here in 1586. The temple's antique market on the first Sunday of each month draws vintage hunters from across Tokyo, while the meticulously maintained garden provides year-round botanical beauty.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7171, longitude: 139.6614),
        stampSlotId: 412,
        category: .tera,
        tagline: "The eye-healing Buddha of Nakano with a beloved antique market",
        highlights: [
            "Sacred Yakushi Nyorai image famous for curing eye ailments since 1586",
            "Monthly antique market (first Sunday) drawing collectors citywide",
            "Beautiful botanical garden within the temple grounds",
            "Important Shingon temple of the Nakano area"
        ],
        mustSee: "Pray to the Yakushi Nyorai for eye health — the tradition dates to when Tokugawa Hidetada's daughter was cured of an eye disease after prayers here. The main hall's atmosphere is intimate and powerful, with the scent of incense and the glow of candlelight.",
        tips: [
            "Visit on the first Sunday of the month for the antique/flea market",
            "The shopping street leading to the temple has charming local shops",
            "Less than 5 minutes from Araiyakushimae Station — very accessible",
            "Combine with Nakano Broadway for a unique culture-and-faith day"
        ],
        bestSeason: "Year-round; first Sundays for antique market, spring for garden blooms",
        access: "5 min walk from Seibu Shinjuku Line Araiyakushimae Station",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000413")!,
        name: "Shakujii Hikawa Jinja",
        address: "1-18-24 Shakujiidai, Nerima, Tokyo",
        description: "Standing beside the serene Shakujii Park ponds, this Hikawa Shrine offers a rare combination of Musashino woodland and sacred architecture. The surrounding park preserves one of Tokyo's last fragments of primeval Musashino Plain forest, with spring-fed ponds that mirror the seasons. The ruins of Shakujii Castle on the adjacent hilltop add a layer of samurai history.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7413, longitude: 139.5982),
        stampSlotId: 413,
        category: .jinja,
        tagline: "Where sacred waters meet the last primeval forest of Musashino",
        highlights: [
            "Adjacent to Shakujii Park's spring-fed ponds and primeval forest",
            "Nearby ruins of Shakujii Castle (14th century Toshima clan)",
            "Musashino Plain forest remnant — rare in modern Tokyo",
            "Tranquil waterside setting with seasonal reflections"
        ],
        mustSee: "Walk from the shrine through Shakujii Park's forest trail around the two ponds — Sanpoji-ike and Shakujii-ike. The spring-fed waters have never run dry, and in autumn the reflected foliage creates mirror-perfect scenes. The adjacent castle ruins trail adds samurai-era atmosphere.",
        tips: [
            "Rent a rowboat on Shakujii Pond for a different perspective",
            "The park is one of Tokyo's best autumn foliage spots — uncrowded",
            "Castle ruins trail is short but atmospheric (15 min loop)",
            "Good bird-watching area — kingfishers are spotted regularly"
        ],
        bestSeason: "Autumn for spectacular foliage around the ponds, spring for cherry blossoms",
        access: "15 min walk from Seibu Ikebukuro Line Shakujii-Koen Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000414")!,
        name: "Kasai Jinja",
        address: "1-15-1 Chuokasai, Edogawa, Tokyo",
        description: "The guardian shrine of Kasai in eastern Tokyo, this shrine sits near the mouth of the old Edo River where it meets Tokyo Bay. Connected to the vast Kasai Rinkai Park and its seaside vistas, a visit here combines spiritual tradition with Tokyo's most accessible oceanfront. The shrine is particularly revered for safe childbirth and child-rearing blessings.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6616, longitude: 139.8669),
        stampSlotId: 414,
        category: .jinja,
        tagline: "Blessings for children where the Edo River meets Tokyo Bay",
        highlights: [
            "Guardian shrine of the Kasai district near Tokyo Bay",
            "Revered for safe childbirth and child-rearing blessings",
            "Near Kasai Rinkai Park's seaside promenade and aquarium",
            "Historic connection to Edo River fishermen communities"
        ],
        mustSee: "After visiting the shrine, walk to nearby Kasai Rinkai Park for panoramic views of Tokyo Bay, the Tokyo Gate Bridge, and on clear days, Mount Fuji across the water. The combination of traditional shrine visit and oceanfront scenery is unique in Tokyo.",
        tips: [
            "Combine with Kasai Rinkai Park aquarium and the Diamond and Flower Ferris wheel",
            "The area's seafood restaurants serve excellent Edomae-style dishes",
            "Easy to reach but far from typical tourist routes — very local atmosphere",
            "October festival features impressive float processions"
        ],
        bestSeason: "Year-round; winter for clearest Mount Fuji views from the bay",
        access: "10 min walk from JR Kasai Rinkai-Koen Station or Tokyo Metro Kasai Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000415")!,
        name: "Tokumaru Kitano Jinja",
        address: "5-7 Tokumaru, Itabashi, Tokyo",
        description: "In the residential heartland of northern Tokyo's Itabashi ward, Tokumaru Kitano Jinja is dedicated to Sugawara no Michizane, the god of learning. Its annual dengaku (field music) performance, designated an Intangible Folk Cultural Property of Tokyo, preserves a medieval art form that has nearly vanished elsewhere. The shrine's quiet grounds and scholarly blessings make it a favorite with local families during exam season.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7713, longitude: 139.6506),
        stampSlotId: 415,
        category: .tenmangu,
        tagline: "Medieval dengaku dances and scholarly blessings in northern Tokyo",
        highlights: [
            "Annual dengaku performance — Tokyo Intangible Folk Cultural Property",
            "Dedicated to Sugawara no Michizane, god of learning",
            "Tranquil grounds in the residential Tokumaru district",
            "Plum blossoms in February honoring the Tenjin tradition"
        ],
        mustSee: "If you visit in late February, witness the annual Tagara Dengaku — a rare survival of medieval rice-planting dances performed to ensure bountiful harvests. This ritualized performance, with its distinctive drums and flutes, has been passed down unbroken for centuries.",
        tips: [
            "Dengaku performance is in late February — check exact date each year",
            "Popular during January exam season for academic success prayers",
            "The plum grove is small but lovely when in bloom",
            "Accessible from Tobu Tojo Line Tobu-Nerima Station"
        ],
        bestSeason: "Late February for dengaku performance and plum blossoms",
        access: "10 min walk from Tobu Tojo Line Tobu-Nerima Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000416")!,
        name: "Otori Jinja Meguro",
        address: "1-6-3 Shimomeguro, Meguro, Tokyo",
        description: "One of Tokyo's principal Otori shrines, Meguro's Otori Jinja has hosted its own Tori no Ichi festival since the Edo period. Though smaller than the famous Asakusa version, the Meguro festival offers a more intimate atmosphere where you can study the intricate kumade craftsmanship up close. The shrine is also associated with Yamato Takeru, the legendary warrior prince.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6342, longitude: 139.7099),
        stampSlotId: 416,
        category: .jinja,
        tagline: "Meguro's intimate Tori no Ichi — kumade rakes and warrior legends",
        highlights: [
            "Historic Tori no Ichi festival — more intimate than the Asakusa version",
            "Enshrines Yamato Takeru, legendary warrior prince of Japan",
            "Beautiful approach road lined with traditional lanterns during festivals",
            "One of the guardian shrines of the Meguro district"
        ],
        mustSee: "Visit during the November Tori no Ichi to see ornate kumade rakes displayed like works of art. The smaller scale means you can take your time examining the incredible detail — golden cranes, turtles, coin-laden ships — that goes into each handcrafted rake.",
        tips: [
            "Tori no Ichi here is less crowded than Asakusa — better for photography",
            "Just 2 minutes from Meguro Station — very accessible",
            "Combine with Meguro Daien-ji across the road for a temple-shrine pair",
            "The approach from Meguro-dori has nice local restaurants"
        ],
        bestSeason: "November for Tori no Ichi, year-round otherwise",
        access: "2 min walk from JR/Tokyu Meguro Station west exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000417")!,
        name: "Tsukiji Honganji",
        address: "3-15-1 Tsukiji, Chuo, Tokyo",
        description: "This extraordinary Jodo Shinshu Buddhist temple looks like an ancient Indian palace transplanted to central Tokyo. Designed by architect Ito Chuta in 1934, its Indo-Saracenic style features lotus motifs, stained glass, animal sculptures, and even a pipe organ — making it utterly unique among Japanese temples. The morning sutra chanting accompanied by organ music is a transcendent cross-cultural experience.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6657, longitude: 139.7718),
        stampSlotId: 417,
        category: .tera,
        tagline: "An Indian palace in Tokyo — where Buddhist chanting meets pipe organ",
        highlights: [
            "Unique Indo-Saracenic architecture by architect Ito Chuta (1934)",
            "Pipe organ concerts accompanying Buddhist sutra chanting",
            "Stained glass windows and carved animal motifs on the exterior",
            "Stylish temple café with Tsukiji-sourced breakfast menu"
        ],
        mustSee: "Attend the morning prayer service (7:00) to hear Buddhist sutras accompanied by a pipe organ — a combination found nowhere else on earth. The sound reverberates through the Indo-Saracenic interior while morning light filters through stained glass. Lunchtime organ concerts are also held.",
        tips: [
            "The temple café '18 Tsumugi' serves excellent Tsukiji-sourced breakfast sets",
            "Pipe organ concerts are held periodically — check the schedule online",
            "Architecture buffs should examine the exterior animal sculptures in detail",
            "Tsukiji Outer Market is steps away for a post-visit food crawl"
        ],
        bestSeason: "Year-round; morning visits for prayer services and breakfast",
        access: "1 min walk from Tokyo Metro Tsukiji Station (Hibiya Line)",
        hours: "6:00-16:00 (main hall)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000418")!,
        name: "Zenpuku-ji Azabu",
        address: "1-6-21 Motoazabu, Minato, Tokyo",
        description: "One of Tokyo's most historically layered temples, Zenpuku-ji in Azabu was founded by Kobo Daishi in 824, served as the first American legation in Japan when Townsend Harris arrived in 1859, and shelters a colossal 750-year-old ginkgo tree designated a national natural monument. The temple's quiet grounds in the heart of the embassy district feel worlds apart from the surrounding luxury.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6515, longitude: 139.7339),
        stampSlotId: 418,
        category: .tera,
        tagline: "Kobo Daishi's founding, America's first embassy, and a 750-year-old ginkgo",
        highlights: [
            "Founded by Kobo Daishi in 824 — over 1,200 years of history",
            "Site of the first American legation in Japan (1859, Townsend Harris)",
            "750-year-old ginkgo tree — designated national natural monument",
            "Serene Jodo Shinshu temple in the heart of the Azabu embassy district"
        ],
        mustSee: "Stand beneath the 750-year-old ginkgo tree, its trunk so massive it takes several people to encircle it. In November, the tree sheds a golden carpet of leaves that blankets the temple grounds. A plaque marks where Townsend Harris established America's first diplomatic outpost in Japan.",
        tips: [
            "November is spectacular when the giant ginkgo turns gold",
            "The Harris memorial stone is near the main gate — easy to miss",
            "Motoazabu neighborhood has excellent international restaurants",
            "Combine with Roppongi Hills or Tokyo Tower, both walkable"
        ],
        bestSeason: "November for the giant ginkgo's golden display",
        access: "8 min walk from Azabu-Juban Station (Namboku/Oedo Line) or Roppongi Station",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000419")!,
        name: "Ohmiya Hachimangu",
        address: "2-3-1 Ohmiya, Suginami, Tokyo",
        description: "Known as 'Tokyo's Bellybutton' for its location near the geographic center of the city, Ohmiya Hachimangu is Suginami ward's most important shrine. Its vast forested grounds — with towering cryptomeria, zelkova, and camphor trees — form an urban nature sanctuary. The shrine is a renowned power spot for safe childbirth, as it enshrines Ojin Tenno and his mother Empress Jingu, patron of expectant mothers.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6836, longitude: 139.6398),
        stampSlotId: 419,
        category: .hachimangu,
        tagline: "Tokyo's bellybutton — a forested power spot for safe childbirth",
        highlights: [
            "Called 'Tokyo no Heso' (Tokyo's Bellybutton) — near the city's geographic center",
            "Massive forested grounds forming an urban nature sanctuary",
            "Premier safe-childbirth shrine — Empress Jingu as patron of mothers",
            "One of the largest shrine forests remaining in central Tokyo"
        ],
        mustSee: "Walk the long, tree-canopied approach road that stretches from Ohmiya Hachimangu-mae bus stop deep into the forest. The cathedral-like canopy of ancient trees is among the most impressive in all of Tokyo's shrines, rivaling even Meiji Jingu for atmosphere.",
        tips: [
            "The September grand festival features spirited mikoshi processions",
            "Popular with expecting parents — anzan (safe birth) amulets are beautifully designed",
            "The forest is excellent for bird-watching — look for Japanese pygmy woodpeckers",
            "Accessible from Nishi-Eifuku Station on the Keio Inokashira Line"
        ],
        bestSeason: "Year-round for the forest; September for the grand festival",
        access: "7 min walk from Nishi-Eifuku Station (Keio Inokashira Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000420")!,
        name: "Igusa Hachimangu",
        address: "1-15-1 Zenpukuji, Suginami, Tokyo",
        description: "Set amid the greenery near Zenpukuji Park in western Suginami, Igusa Hachimangu is a grand shrine with an unexpectedly imposing presence. Its massive stone torii and broad approach give the feeling of entering a countryside shrine despite being within Tokyo's 23 wards. The shrine hosts one of the city's last remaining traditional horseback archery (yabusame) ceremonies each October.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7133, longitude: 139.5984),
        stampSlotId: 420,
        category: .hachimangu,
        tagline: "Grand countryside atmosphere and horseback archery in western Tokyo",
        highlights: [
            "Annual yabusame (horseback archery) ceremony in October",
            "Impressively grand stone torii and broad approach road",
            "Adjacent to the lush greenery of Zenpukuji Park",
            "Countryside-scale shrine within Tokyo's 23 wards"
        ],
        mustSee: "Attend the October yabusame ceremony where mounted archers in Kamakura-era costume gallop down a course within the shrine grounds, loosing arrows at wooden targets. The thundering hooves, flying arrows, and samurai-era spectacle draw large crowds to this surprisingly spacious shrine.",
        tips: [
            "Yabusame is held on a Sunday in early October — verify the date",
            "Zenpukuji Park next door has a beautiful spring-fed pond",
            "The approach road from the south is impressively long and tree-lined",
            "Less crowded alternative to Meiji Jingu for a forested shrine experience"
        ],
        bestSeason: "October for yabusame, spring for Zenpukuji Park cherry blossoms",
        access: "15 min walk from Nishi-Ogikubo Station (JR Chuo Line) or bus to Igusa Hachimangu-mae",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000421")!,
        name: "Musashino Hachimangu",
        address: "1-1-3 Gotenyama, Musashino, Tokyo",
        description: "The central shrine of Musashino City, located near the popular Kichijoji district. Surrounded by towering keyaki trees, its spacious grounds provide a refreshing escape from the bustle of Kichijoji's shopping streets. The shrine has guarded this area since the Edo period when settlers first cleared the Musashino Plain for farming.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7043, longitude: 139.5700),
        stampSlotId: 421,
        category: .hachimangu,
        tagline: "Guardian of the Musashino Plain beside vibrant Kichijoji",
        highlights: [
            "Central shrine of Musashino City with Edo-period origins",
            "Towering keyaki (zelkova) forest canopy",
            "Walking distance from Kichijoji's famous Inokashira Park",
            "Autumn festival with spirited mikoshi processions"
        ],
        mustSee: "Walk beneath the towering zelkova canopy along the main approach. The trees form a natural cathedral that changes dramatically with the seasons — fresh green in spring, deep shade in summer, golden fire in autumn. The contrast with nearby Kichijoji's urban energy is striking.",
        tips: [
            "Combine with Inokashira Park and its benzaiten shrine for a full day",
            "Kichijoji's Harmonica Yokocho alley is nearby for post-visit drinks",
            "The autumn festival in September is lively with local participation",
            "Less than 10 minutes from Kichijoji Station's north exit"
        ],
        bestSeason: "Autumn for zelkova foliage, September for the autumn festival",
        access: "8 min walk from JR/Keio Inokashira Line Kichijoji Station north exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000422")!,
        name: "Setagaya Hachimangu",
        address: "1-26-3 Miyasaka, Setagaya, Tokyo",
        description: "Perched atop a wooded hill in residential Setagaya, this shrine is the ward's foremost Hachiman shrine and a local power spot. Its elevated position provides a commanding view, and the long stone staircase approach builds anticipation. The shrine is closely tied to the samurai heritage of the Kira and later Ii clans who governed this area.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6502, longitude: 139.6460),
        stampSlotId: 422,
        category: .hachimangu,
        tagline: "Hilltop guardian of Setagaya with samurai-clan roots",
        highlights: [
            "Elevated hilltop position with commanding stone staircase",
            "Samurai heritage tied to the Kira and Ii clans",
            "Setagaya ward's principal Hachiman shrine",
            "Shichi-go-san season draws beautifully dressed local families"
        ],
        mustSee: "Climb the dramatic stone staircase from the street to the hilltop shrine. The ascent through the tree canopy feels like leaving the modern city behind. At the top, the main hall sits in serene isolation, surrounded by ancient trees that muffle the sounds of the neighborhood below.",
        tips: [
            "The staircase is steep — take your time and enjoy the canopy",
            "Beautiful during Shichi-go-san (November) with kimono-clad children",
            "Combine with nearby Gotoku-ji (the maneki-neko temple) for a Setagaya walk",
            "The quiet residential streets around the shrine are pleasant for wandering"
        ],
        bestSeason: "November for Shichi-go-san, autumn for hilltop foliage",
        access: "5 min walk from Tokyu Setagaya Line Miyasaka Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000423")!,
        name: "Shitaya Jinja",
        address: "1-29-14 Higashiueno, Taito, Tokyo",
        description: "One of the oldest shrines in the Ueno area, Shitaya Jinja has watched over the shitamachi lowlands since the Heian period. Enshrining Onamuchi-no-Mikoto (the deity of Izumo), it is a powerful en-musubi (relationship) shrine. The annual Shitaya Matsuri features one of the most energetic mikoshi parades in downtown Tokyo, with bearers surging through the narrow old streets.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7100, longitude: 139.7756),
        stampSlotId: 423,
        category: .jinja,
        tagline: "Shitamachi's Heian-era guardian with one of Tokyo's wildest mikoshi parades",
        highlights: [
            "Over 1,000 years old — one of Ueno area's most ancient shrines",
            "Enshrines Onamuchi (Izumo deity) for en-musubi blessings",
            "Wild Shitaya Matsuri mikoshi parade through narrow old streets",
            "Located in the atmospheric Higashiueno shitamachi district"
        ],
        mustSee: "During the Shitaya Matsuri (May), watch as mikoshi bearers charge through the tight streets of old shitamachi, the portable shrines swaying dangerously close to shop awnings and electric poles. The energy and controlled chaos embody the spirit of downtown Tokyo's festival culture.",
        tips: [
            "Shitaya Matsuri is in mid-May — one of the first big summer festivals",
            "Just a 3-minute walk from Ueno Station — very accessible",
            "The Higashiueno neighborhood has authentic shitamachi character",
            "Combine with Ueno Park temples and Ameyoko market"
        ],
        bestSeason: "May for Shitaya Matsuri, year-round for shitamachi atmosphere",
        access: "3 min walk from JR Ueno Station Hirokoji exit or Tokyo Metro Inaricho Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- Kanagawa ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000424")!,
        name: "Yugyo-ji",
        address: "1-8-1 Nishitomi, Fujisawa, Kanagawa",
        description: "The head temple of the Ji sect of Buddhism, Yugyo-ji is where the itinerant monk Ippen Shonin's dancing-nembutsu tradition lives on. The massive temple complex in central Fujisawa features a striking main hall, an elegant garden, and a treasure house with Important Cultural Properties. Its annual Bon Odori is among the Shonan coast's most spirited summer dance events.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3419, longitude: 139.4877),
        stampSlotId: 424,
        category: .tera,
        tagline: "Head temple of the dancing-nembutsu — where faith meets movement",
        highlights: [
            "Head temple (sohonzan) of the Ji sect of Buddhism",
            "Legacy of Ippen Shonin's ecstatic dancing-nembutsu practice",
            "Large elegant temple garden with seasonal beauty",
            "Treasure house with Important Cultural Properties"
        ],
        mustSee: "Explore the grand main hall where the tradition of odori-nembutsu (dancing while chanting the Buddha's name) originated. Ippen Shonin believed that joyful physical movement could bring anyone to enlightenment regardless of learning or status — a radical democratization of Buddhist practice.",
        tips: [
            "The treasure house requires a small admission fee but is worth it",
            "Central Fujisawa location makes it easy to combine with Enoshima visits",
            "The temple's Bon Odori in August is open to public participation",
            "Fujisawa is also the gateway to the Tokaido's historic post-town sites"
        ],
        bestSeason: "August for Bon Odori, spring for garden beauty",
        access: "15 min walk from JR/Odakyu Fujisawa Station north exit",
        hours: "5:00-17:00 (treasure house 9:30-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000425")!,
        name: "Tsurumi Jinja",
        address: "1-13-8 Tsurumi-chuo, Tsurumi, Yokohama, Kanagawa",
        description: "Claiming to be one of the oldest shrines in Kanagawa, Tsurumi Jinja's history stretches back to at least the Nara period. Standing near the mouth of the Tsurumi River, it was a vital spiritual waypoint on the old Tokaido road between Edo and Kyoto. Archaeological excavations have uncovered Yayoi and Jomon artifacts on its grounds, confirming millennia of human activity at this sacred site.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5081, longitude: 139.6751),
        stampSlotId: 425,
        category: .jinja,
        tagline: "Millennia of worship from Jomon pottery to Tokaido travelers",
        highlights: [
            "Archaeological evidence of worship since the Jomon/Yayoi periods",
            "Historic waypoint on the old Tokaido road",
            "Located near the mouth of the Tsurumi River",
            "One of the oldest shrines in all of Kanagawa Prefecture"
        ],
        mustSee: "Consider that as you stand on these grounds, people have gathered here for spiritual purposes for potentially over 2,000 years. Jomon pottery and Yayoi-era artifacts discovered during excavations confirm this as one of the longest continuously sacred sites in the Kanto region.",
        tips: [
            "Soji-ji (Soto Zen head temple) is a short walk away — combine both",
            "The old Tokaido road traces can still be followed through the neighborhood",
            "JR Tsurumi Station is just a few minutes away",
            "The riverside walk along the Tsurumi River is pleasant in good weather"
        ],
        bestSeason: "Year-round; New Year for hatsumode crowds",
        access: "5 min walk from JR Tsurumi Station west exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000426")!,
        name: "Kamakura-gu",
        address: "154 Nikaido, Kamakura, Kanagawa",
        description: "Founded in 1869 by Emperor Meiji himself, Kamakura-gu enshrines the tragic Prince Morinaga, son of Emperor Go-Daigo, who was imprisoned and executed in a cave on this very site during the power struggles of the 14th century. The cave-prison (tōrō) can still be entered, creating a visceral connection to one of Japanese history's most dramatic stories of imperial loyalty and betrayal.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3244, longitude: 139.5608),
        stampSlotId: 426,
        category: .jinja,
        tagline: "A tragic prince's cave-prison — imperial loyalty carved in stone",
        highlights: [
            "Founded by Emperor Meiji to honor the tragic Prince Morinaga",
            "Actual cave-prison where the prince was held and executed (enterable)",
            "Vivid connection to the Kenmu Restoration power struggles",
            "Surrounded by the lush hills of Kamakura's Nikaido district"
        ],
        mustSee: "Enter the tōrō — the actual cave where Prince Morinaga was imprisoned for nine months before his execution in 1335. The cool darkness and rough stone walls make the 700-year-old tragedy feel immediate and real. Few historical sites in Japan offer such a visceral, physical connection to the past.",
        tips: [
            "The cave requires a small admission fee — absolutely worth it",
            "Less crowded than Tsurugaoka Hachimangu but deeply moving",
            "The autumn foliage in the Nikaido hills is exceptional",
            "Combine with the Kamakura hiking trails that pass nearby"
        ],
        bestSeason: "Autumn for foliage in the surrounding hills, year-round for the cave",
        access: "25 min walk from JR Kamakura Station or bus to Kamakura-gu-mae",
        hours: "9:00-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000427")!,
        name: "Suwa Jinja Yokosuka",
        address: "1-11 Ogawa-cho, Yokosuka, Kanagawa",
        description: "The principal shrine of Yokosuka, a city famous for its US naval base and Japanese maritime forces. Suwa Jinja sits on a hilltop overlooking the harbor and has protected sailors and naval personnel since the area became Japan's primary naval port in the Meiji era. The shrine festival in May is one of the Miura Peninsula's most exciting, with mikoshi parades through the port city streets.",
        coordinate: CLLocationCoordinate2D(latitude: 35.2790, longitude: 139.6702),
        stampSlotId: 427,
        category: .jinja,
        tagline: "Hilltop guardian of Japan's naval port city",
        highlights: [
            "Principal shrine of Yokosuka, Japan's historic naval city",
            "Hilltop location with views over Yokosuka Harbor",
            "Protector of sailors and maritime personnel since the Meiji era",
            "May festival with energetic mikoshi through the port streets"
        ],
        mustSee: "From the shrine's hilltop position, take in the sweeping view of Yokosuka Harbor where Japanese Maritime Self-Defense Force vessels and occasionally US Navy ships are docked. The juxtaposition of ancient shrine and modern warships encapsulates Yokosuka's unique character.",
        tips: [
            "Yokosuka Navy Curry is the city's signature dish — try it after your visit",
            "The Mikasa Park and memorial battleship Mikasa are nearby",
            "Dobuita Street near the base has a unique US-Japan fusion atmosphere",
            "Good starting point for exploring the Miura Peninsula"
        ],
        bestSeason: "May for the shrine festival, year-round for harbor views",
        access: "10 min walk from Keikyu Yokosuka-Chuo Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000428")!,
        name: "Rokusho Jinja",
        address: "1-10-19 Hinata, Oiso, Kanagawa",
        description: "One of the Sagami Province's most important shrines, Rokusho Jinja serves as the sōja — a combined shrine representing all the major deities of the region. Its history stretches deep into the ancient provincial system, when governors would visit to pay respects to all local gods in one location. The approach through a quiet residential area opens suddenly into sacred space.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3064, longitude: 139.3106),
        stampSlotId: 428,
        category: .jinja,
        tagline: "Sagami Province's combined shrine — all the region's gods in one place",
        highlights: [
            "Sōja shrine representing all major deities of old Sagami Province",
            "Deep roots in Japan's ancient provincial shrine system",
            "Connected to the Oiso historic Tokaido post-town",
            "Serene atmosphere in a quiet Shonan coastal town"
        ],
        mustSee: "Understand the sōja concept: in ancient Japan, provincial governors had to visit every major shrine in their domain. Eventually, combined shrines were built so all gods could be honored in one trip. Standing here, you are symbolically before every deity of the Sagami region.",
        tips: [
            "Oiso is a charming Shonan beach town — combine shrine with seaside walk",
            "The old Tokaido post-town atmosphere is preserved in parts of Oiso",
            "Much quieter than nearby Kamakura or Enoshima",
            "Try Oiso's famous yokan (sweet bean jelly) as a souvenir"
        ],
        bestSeason: "Year-round; summer for combining with Oiso beach",
        access: "10 min walk from JR Oiso Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000429")!,
        name: "Iiyama Kannon",
        address: "5605 Iiyama, Atsugi, Kanagawa",
        description: "Formally known as Choko-ji, Iiyama Kannon is nestled in the forested hills west of Atsugi and has been one of the Kanto region's most beloved cherry blossom viewing spots for centuries. The mountainside temple is accessed by climbing hundreds of stone steps through a forest that transforms into a pink tunnel during hanami season. The panoramic views from the hilltop over the Tanzawa Mountains are breathtaking.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4597, longitude: 139.3268),
        stampSlotId: 429,
        category: .tera,
        tagline: "Hundreds of stone steps through a cherry-blossom mountain tunnel",
        highlights: [
            "One of Kanto's top cherry blossom spots — mountainside sakura tunnel",
            "Hundreds of atmospheric stone steps through forest",
            "Panoramic views over the Tanzawa Mountains from the hilltop",
            "Ancient Kannon temple with centuries of pilgrimage history"
        ],
        mustSee: "Climb the stone steps during cherry blossom season, when the entire mountainside erupts in pink. The steps rise through a corridor of ancient sakura trees whose branches arch overhead to form a living tunnel. At the top, turn around for a view across the blooming hillside to the Tanzawa range beyond.",
        tips: [
            "Peak cherry blossom is typically late March to early April",
            "The climb is moderate but bring water — several hundred steps",
            "Iiyama Onsen hot springs nearby for a post-climb soak",
            "Atsugi city has good dining options for dinner after the visit"
        ],
        bestSeason: "Late March–early April for cherry blossoms (essential)",
        access: "Bus from Hon-Atsugi Station (Odakyu Line) to Iiyama Kannon-mae, about 25 min",
        hours: "Open 24 hours (temple office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000430")!,
        name: "Shonan Enryaku-ji Eifuku-ji",
        address: "1-23-17 Kugenuma Sakuragaoka, Fujisawa, Kanagawa",
        description: "A serene Tendai temple in Fujisawa's Kugenuma district, Eifuku-ji features a striking pagoda visible from the Shonan coast roads. While less famous than its Kamakura neighbors, this temple offers a contemplative retreat with beautiful seasonal gardens. Its connection to the Tendai tradition of Mount Hiei gives it deep spiritual gravitas.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3284, longitude: 139.4644),
        stampSlotId: 430,
        category: .tera,
        tagline: "A Tendai pagoda rising above the Shonan coast",
        highlights: [
            "Striking pagoda visible from the Shonan coast roads",
            "Connected to the Tendai tradition of Mount Hiei",
            "Peaceful seasonal gardens in the Kugenuma district",
            "A contemplative alternative to crowded Kamakura temples"
        ],
        mustSee: "Admire the multi-story pagoda that rises above the surrounding residential neighborhood. From the right angle, the pagoda frames against the Shonan sky beautifully. The interior gardens are meticulously maintained and offer a welcome respite from the busy coastal area.",
        tips: [
            "Combine with a walk along Kugenuma Beach for a spiritual-seaside day",
            "Much less crowded than Kamakura or Enoshima temples",
            "Fujisawa's Yugyo-ji is also nearby for a temple-pairing route",
            "The surrounding Kugenuma neighborhood has charming cafés"
        ],
        bestSeason: "Year-round; spring for garden blooms",
        access: "10 min walk from Odakyu Kugenuma-Kaigan Station",
        hours: "9:00-16:30",
        imageURLs: []
    ),

    // --- Saitama ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000431")!,
        name: "Washinomiya Jinja",
        address: "1 Washinomiya, Kuki, Saitama",
        description: "One of the oldest shrines in the Kanto region, Washinomiya Jinja gained modern fame as the real-world setting of the anime 'Lucky Star,' sparking one of Japan's first anime pilgrimage booms. But behind the otaku popularity lies a genuinely ancient shrine — possibly dating to the mythical age of Emperor Sujin — with a solemn atmosphere, sacred kagura dances, and deep roots in Musashi Province's spiritual history.",
        coordinate: CLLocationCoordinate2D(latitude: 36.0722, longitude: 139.6007),
        stampSlotId: 431,
        category: .jinja,
        tagline: "Ancient Kanto shrine turned anime pilgrimage icon",
        highlights: [
            "One of the oldest shrines in the Kanto region — possibly 2,000+ years",
            "Famous anime pilgrimage site (Lucky Star) — pioneer of 'seichi junrei'",
            "Sacred Washinomiya Kagura dance — Intangible Folk Cultural Property",
            "Important shrine of old Musashi Province"
        ],
        mustSee: "Witness the Washinomiya Kagura, a cycle of 12 sacred dances performed on festival days. This ancient ritual predates the anime fame by centuries and is designated a National Important Intangible Folk Cultural Property. The contrast between solemn kagura and cheerful anime ema (votive tablets) perfectly captures modern Japan.",
        tips: [
            "Anime fans still leave creative ema tablets — a unique cultural sight",
            "Kagura performances are held during major festival days (check schedule)",
            "New Year hatsumode draws huge crowds — plan for wait times",
            "Easy access from Tobu Isesaki Line Washinomiya Station"
        ],
        bestSeason: "New Year for hatsumode, festival days for kagura dances",
        access: "10 min walk from Tobu Isesaki Line Washinomiya Station",
        hours: "Open 24 hours (shrine office 9:00-16:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000432")!,
        name: "Koma Jinja",
        address: "763 Niihori, Hidaka, Saitama",
        description: "A shrine with roots in the ancient Korean kingdom of Goguryeo, Koma Jinja was founded in the 8th century when refugees from the fallen kingdom settled in the Musashi Province. The shrine's architecture and rituals preserve echoes of continental Korean culture transplanted to the Japanese countryside. The surrounding Kinchaku-da area bursts with millions of red spider lilies (higanbana) each September.",
        coordinate: CLLocationCoordinate2D(latitude: 35.8905, longitude: 139.3243),
        stampSlotId: 432,
        category: .jinja,
        tagline: "Korean kingdom heritage and five million scarlet spider lilies",
        highlights: [
            "Founded by refugees from the ancient Korean kingdom of Goguryeo",
            "Unique continental cultural influences in architecture and rituals",
            "Adjacent Kinchaku-da — five million red spider lilies in September",
            "Shōrai Tenno-mon gate with Korean-style guardian figures"
        ],
        mustSee: "Visit in late September when the adjacent Kinchaku-da riverbank meadow erupts with approximately five million red spider lilies (higanbana). The carpet of scarlet flowers stretching to the river is one of the most spectacular natural displays in the Kanto region.",
        tips: [
            "Spider lily peak is late September — timing is everything",
            "The Shōrai Tenno-mon gate has distinctive Korean-style carvings",
            "Koma is also famous for yuzu citrus — try yuzu products at the shrine shop",
            "Combine with hiking in the Hanno hills area"
        ],
        bestSeason: "Late September for spider lily bloom (essential)",
        access: "15 min walk from JR Kawagoe Line/Hachiko Line Koma Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000433")!,
        name: "Tokorozawa Jinja",
        address: "1-3-4 Miyamoto-cho, Tokorozawa, Saitama",
        description: "The principal shrine of Tokorozawa, a city that claims the title of Japan's aviation birthplace — the first military flight took off from a nearby field in 1911. While the shrine itself predates aviation by centuries, its modern identity embraces this heritage. The shrine grounds are lush with ancient trees, and the autumn festival fills the streets with decorated floats.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7961, longitude: 139.4694),
        stampSlotId: 433,
        category: .jinja,
        tagline: "Guardian shrine of Japan's aviation birthplace",
        highlights: [
            "Principal shrine of Tokorozawa — Japan's first aviation city",
            "Ancient tree-filled grounds in the heart of the city",
            "Autumn festival with elaborate decorated float processions",
            "Long history predating the city's famous aviation heritage"
        ],
        mustSee: "Walk the tree-shaded approach that feels remarkably rural for a shrine in a major commuter city. The ancient zelkova and camphor trees create a natural sanctuary that has anchored this community through centuries of change — from farming village to aviation pioneer to modern bedroom community.",
        tips: [
            "The Aviation Memorial Park nearby tells the aviation history story",
            "Autumn festival in October features decorated floats through town",
            "Walking distance from Tokorozawa Station on the Seibu Line",
            "Combine with the Totoro Forest Trust trails in the surrounding hills"
        ],
        bestSeason: "October for autumn festival, year-round for forest atmosphere",
        access: "10 min walk from Seibu Line Tokorozawa Station west exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000434")!,
        name: "Tsuki Jinja Urawa",
        address: "1-12-1 Kishiki, Urawa, Saitama",
        description: "One of Saitama's most unique shrines, Tsuki Jinja — the 'Moon Shrine' — has no main hall. Instead, worshippers pray directly toward a sacred grove of ancient trees, preserving an archaic form of Shinto worship that predates the construction of shrine buildings. The rabbit motifs throughout (rabbits being associated with the moon in Japanese folklore) make it especially popular during the Year of the Rabbit.",
        coordinate: CLLocationCoordinate2D(latitude: 35.8612, longitude: 139.6316),
        stampSlotId: 434,
        category: .jinja,
        tagline: "The Moon Shrine with no hall — praying to an ancient sacred grove",
        highlights: [
            "No main hall — worshippers pray directly toward a sacred grove",
            "Preserves archaic pre-architectural Shinto worship style",
            "Rabbit motifs throughout (moon-rabbit folklore connection)",
            "Reads as 'Tsuki' (moon) — associated with lunar blessings"
        ],
        mustSee: "Stand at the worship area and face the sacred grove where the deity resides — not in a building, but in the ancient trees themselves. This hall-less worship style is extremely rare and offers a glimpse into how all Shinto was practiced before shrine architecture was invented.",
        tips: [
            "The rabbit-themed amulets and ema are adorable and popular",
            "Especially crowded during Year of the Rabbit zodiac years",
            "The 'no main hall' concept is fascinating for shrine architecture enthusiasts",
            "Walking distance from JR Urawa or Kita-Urawa Station"
        ],
        bestSeason: "Year-round; full moon nights and mid-autumn festival",
        access: "15 min walk from JR Urawa Station or Kita-Urawa Station",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000435")!,
        name: "Menuma Shodenzan",
        address: "627 Menuma, Kumagaya, Saitama",
        description: "Often called 'the Nikko of Saitama,' Menuma Shodenzan is a Shingon temple famous for its breathtakingly ornate polychrome wood carvings that rival Nikko Toshogu in artistry. The Kangiden hall is covered in hundreds of intricate carvings of flowers, birds, dragons, and legendary figures, all painted in vivid colors. Despite being a National Treasure, it remains relatively uncrowded — a true hidden gem.",
        coordinate: CLLocationCoordinate2D(latitude: 36.2098, longitude: 139.3878),
        stampSlotId: 435,
        category: .tera,
        tagline: "The Nikko of Saitama — National Treasure carvings in dazzling color",
        highlights: [
            "National Treasure Kangiden hall with polychrome wood carvings",
            "Hundreds of intricate carvings rivaling Nikko Toshogu in artistry",
            "Often called 'Saitama's Nikko' — without the crowds",
            "Shingon temple dedicated to Kangiten (Ganesh-derived deity)"
        ],
        mustSee: "Study the Kangiden hall's exterior carvings in detail — every surface is covered with dragons, phoenixes, flowers, waves, and mythological scenes painted in vivid vermillion, green, gold, and blue. Binoculars or a zoom lens help appreciate the upper-level details. This National Treasure truly rivals Nikko.",
        tips: [
            "Bring binoculars to appreciate the upper-level carving details",
            "The en-musubi (matchmaking) blessings here are considered very powerful",
            "Kumagaya is Japan's hottest city in summer — visit in cooler months",
            "Relatively uncrowded even on weekends — savor the experience"
        ],
        bestSeason: "Spring and autumn for comfortable weather; avoid midsummer heat",
        access: "Bus from Kumagaya Station (JR Takasaki Line) to Menuma Shodenzan-mae, about 30 min",
        hours: "10:00-15:30 (closed some days — check in advance)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000436")!,
        name: "Gyoda Hachiman Jinja",
        address: "16-23 Gyoda, Gyoda, Saitama",
        description: "The guardian shrine of Gyoda, a castle town known for its ancient burial mounds and the dramatic Oshi Castle that withstood Toyotomi Hideyoshi's massive water attack in 1590. The shrine's history is intertwined with the castle's samurai garrison, and the September festival echoes with the pride of a town that held out against Japan's greatest warlord.",
        coordinate: CLLocationCoordinate2D(latitude: 36.1380, longitude: 139.4558),
        stampSlotId: 436,
        category: .hachimangu,
        tagline: "Guardian of the castle that defied Hideyoshi's flood",
        highlights: [
            "Guardian shrine of Oshi Castle — famously withstood Hideyoshi's water siege",
            "September festival with samurai-heritage parade",
            "Surrounded by the Sakitama ancient burial mounds",
            "Castle town atmosphere preserved in the Gyoda district"
        ],
        mustSee: "Learn the incredible story of the Oshi Castle water siege of 1590: Toyotomi Hideyoshi diverted a river to flood the castle, but the garrison held out behind hastily raised earthen levees. The shrine's festival commemorates this defiant stand against impossible odds.",
        tips: [
            "Visit the reconstructed Oshi Castle and burial mound museum nearby",
            "Gyoda is famous for zeri-furai (fried potato patty) — a local delicacy",
            "The Sakitama burial mounds are an easy walk from the shrine",
            "Less than an hour from Tokyo on the JR Takasaki Line"
        ],
        bestSeason: "September for the festival, spring for castle park cherry blossoms",
        access: "15 min walk from JR Gyoda Station or Chichibu Railway Gyoda-shi Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- Chiba ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000437")!,
        name: "Kozaki Jinja",
        address: "2942 Kozaki, Kozaki, Katori District, Chiba",
        description: "A deeply atmospheric shrine in the sake-brewing town of Kozaki on the Tone River, Kozaki Jinja is closely tied to the Japanese tradition of sacred sake-making. The town has brewed sake since the Edo period using Tone River water, and the shrine blesses each year's brewing season. The annual Kozaki Sake Festival in March draws thousands of sake lovers to this tiny riverside town.",
        coordinate: CLLocationCoordinate2D(latitude: 35.8972, longitude: 140.4047),
        stampSlotId: 437,
        category: .jinja,
        tagline: "Sacred sake shrine in a riverside brewing town",
        highlights: [
            "Guardian shrine of Kozaki — a town devoted to sake brewing",
            "Blesses each year's brewing season with sacred rituals",
            "Annual Kozaki Sake Festival in March draws thousands",
            "Atmospheric riverside location on the Tone River"
        ],
        mustSee: "If you visit during the March Sake Festival, sample fresh sake from multiple local breweries set up around the shrine and town. The atmosphere — part sacred ritual, part joyful celebration — perfectly encapsulates the spiritual dimension of Japanese sake culture.",
        tips: [
            "The March Sake Festival is the highlight — book transport early",
            "Niida and Nabedana breweries offer tours year-round",
            "Combine with nearby Katori Jingu for a full Tone River spiritual day",
            "The rural Tone River scenery is lovely and photogenic"
        ],
        bestSeason: "March for the Sake Festival, winter for brewing season atmosphere",
        access: "5 min walk from JR Narita Line Shimosa-Kozaki Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000438")!,
        name: "Susaki Jinja",
        address: "1344 Sunosaki, Tateyama, Chiba",
        description: "Standing at the very southern tip of the Boso Peninsula where Tokyo Bay meets the Pacific Ocean, Susaki Jinja commands dramatic ocean views from its clifftop position. On clear winter days, Mount Fuji rises across the bay in perfect profile. The shrine is dedicated to safe maritime navigation and has been a beacon for fishermen and sailors for over a millennium.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9595, longitude: 139.7575),
        stampSlotId: 438,
        category: .jinja,
        tagline: "Clifftop guardian where Tokyo Bay meets the Pacific — Fuji views included",
        highlights: [
            "Dramatic clifftop position at the southern tip of Boso Peninsula",
            "Spectacular Mount Fuji views across Tokyo Bay on clear days",
            "Dedicated to maritime safety for fishermen and sailors",
            "Over 1,000 years of history as a coastal navigation beacon"
        ],
        mustSee: "On a clear winter day, stand at the shrine and gaze across Tokyo Bay. Mount Fuji rises in perfect symmetry above the water, framed by the shrine's sacred structures. This view — ocean, mountain, and sacred architecture — is one of the most stunning panoramas in the Kanto region.",
        tips: [
            "Winter offers the clearest Fuji views — summer haze often obscures it",
            "Tateyama is also famous for early spring rapeseed flowers (January-March)",
            "The Boso Peninsula's seafood is excellent — don't miss local sushi",
            "Combine with the Tateyama Castle ruins for a full day"
        ],
        bestSeason: "Winter for clearest Mount Fuji views, January–March for rapeseed flowers",
        access: "Bus from JR Tateyama Station to Sunosaki Lighthouse, about 15 min, then 5 min walk",
        hours: "Open 24 hours",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000439")!,
        name: "Tomisaki Jinja",
        address: "1 Hamakatsuura, Katsuura, Chiba",
        description: "Every February and March, Tomisaki Jinja's stone steps become the stage for one of Japan's most photogenic festivals: the Katsuura Big Hina Matsuri, when approximately 1,800 hina dolls are displayed on the 60 steep stone steps leading to the shrine. The cascade of dolls in their brilliant red and gold costumes against the grey stone is breathtaking and draws photographers from across the country.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1490, longitude: 140.3192),
        stampSlotId: 439,
        category: .jinja,
        tagline: "1,800 hina dolls cascading down sixty stone steps",
        highlights: [
            "Katsuura Big Hina Matsuri — 1,800 dolls on 60 stone steps",
            "One of Japan's most photogenic festival displays",
            "Dramatic ocean-facing hilltop shrine position",
            "Katsuura's signature cultural event drawing nationwide attention"
        ],
        mustSee: "Visit during the Big Hina Matsuri (late February to early March) to see the cascade of 1,800 hina dolls arranged on the stone steps. The dolls — in their elaborate court costumes of red, gold, and white — create a river of color flowing down from the shrine. Evening illumination adds another dimension.",
        tips: [
            "The display is typically late February through March 3 (Girls' Day)",
            "Come early morning or at dusk for the best photography light",
            "Katsuura's morning market (one of Japan's three great markets) is nearby",
            "The Sotobo Line train ride along the coast is scenic"
        ],
        bestSeason: "Late February–early March for Hina Matsuri (essential)",
        access: "10 min walk from JR Sotobo Line Katsuura Station",
        hours: "Open 24 hours (festival display during daylight hours)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000440")!,
        name: "Sobano Jinja",
        address: "2-11-20 Soga, Chuo, Chiba",
        description: "An ancient shrine in the Soga district of Chiba City, Sobano Jinja has roots stretching back over 1,900 years to the legendary era of Yamato Takeru. The shrine is particularly revered for its spring plum blossom grove, which blooms alongside the nearby Soga Bairin plum orchard — one of the Kanto region's premier early-spring flower-viewing destinations.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5833, longitude: 140.1290),
        stampSlotId: 440,
        category: .jinja,
        tagline: "Ancient Yamato Takeru shrine amid Kanto's finest plum blossoms",
        highlights: [
            "Over 1,900 years of history — legendary Yamato Takeru connection",
            "Adjacent to Soga Bairin plum orchard — Kanto's premier plum viewing",
            "Early spring plum blossoms (ume) from January to March",
            "Guardian shrine of the historic Soga district"
        ],
        mustSee: "Visit in February when the nearby Soga Bairin erupts with thousands of plum blossoms in white, pink, and red. The shrine serves as a spiritual anchor for this floral spectacle, and the combination of sacred atmosphere with fragrant plum blossoms is quintessentially Japanese.",
        tips: [
            "Peak plum blossom viewing is mid-February to early March",
            "Soga Bairin has approximately 2,000 plum trees — allow time to explore",
            "Much less crowded than cherry blossom spots — a more intimate experience",
            "Accessible from JR Soga Station — combine with Chiba city sightseeing"
        ],
        bestSeason: "February–March for plum blossoms (essential)",
        access: "20 min walk from JR Soga Station or bus to Soga Bairin",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000441")!,
        name: "Sagami Jinja",
        address: "3-17-25 Sagamihara, Chuo, Sagamihara, Kanagawa",
        description: "The principal shrine of Sagamihara City, one of Kanagawa's largest municipalities. Set in a grove of towering cedar and zelkova trees, the shrine provides a verdant anchor in a rapidly modernizing commuter city. Its annual festival features impressive float processions, and the shrine is revered for traffic safety blessings — fitting for a city built around major transportation corridors.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5742, longitude: 139.3719),
        stampSlotId: 441,
        category: .jinja,
        tagline: "Cedar-grove guardian of Kanagawa's largest inland city",
        highlights: [
            "Principal shrine of Sagamihara with towering cedar grove",
            "Revered for traffic safety blessings",
            "Annual festival with impressive float processions",
            "Verdant oasis in a modern commuter city"
        ],
        mustSee: "Walk beneath the ancient cedar trees that tower over the shrine approach. These trees have watched Sagamihara transform from a quiet farming village to a city of over 700,000 people, and their enduring presence provides a sense of continuity amid rapid change.",
        tips: [
            "Traffic safety amulets are popular with new drivers",
            "The autumn festival features decorated yatai floats",
            "Convenient to reach from Sagamihara Station on the JR Yokohama Line",
            "Combine with a visit to nearby Lake Sagami for a nature day"
        ],
        bestSeason: "Autumn for festival and foliage, spring for fresh greenery",
        access: "10 min walk from JR Yokohama Line Sagamihara Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- Ibaraki ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000442")!,
        name: "Hitachinokuni Sosha",
        address: "4-3-2 Sosha, Ishioka, Ibaraki",
        description: "The sōja (combined shrine) of Hitachi Province, this shrine once represented all the major deities of modern-day Ibaraki. Its greatest claim to fame is the Ishioka Matsuri, one of the Kanto region's most impressive festivals, featuring enormous lion-head floats (shishi) and ornate festival wagons parading through the old post-town streets. The festival is designated a UNESCO Intangible Cultural Heritage.",
        coordinate: CLLocationCoordinate2D(latitude: 36.1908, longitude: 140.2770),
        stampSlotId: 442,
        category: .jinja,
        tagline: "UNESCO-heritage festival with enormous lion floats in old Hitachi",
        highlights: [
            "Sōja shrine representing all deities of old Hitachi Province",
            "Ishioka Matsuri — UNESCO Intangible Cultural Heritage",
            "Enormous shishi (lion-head) floats parading through town",
            "Historic Ishioka post-town atmosphere"
        ],
        mustSee: "During the Ishioka Matsuri (September), witness the massive shishi — towering lion-head floats with fabric bodies — being hauled through the narrow streets alongside ornate festival wagons. The shishi 'dance' at intersections, their enormous jaws snapping to the rhythm of drums. It is one of the Kanto region's most spectacular festival sights.",
        tips: [
            "Ishioka Matsuri is mid-September — one of Kanto's three great festivals",
            "The town preserves charming Meiji-era buildings worth exploring",
            "Ishioka is on the JR Joban Line — about 70 min from Ueno Station",
            "Combine with a trip to nearby Tsukubasan Jinja"
        ],
        bestSeason: "Mid-September for Ishioka Matsuri (essential)",
        access: "10 min walk from JR Joban Line Ishioka Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000443")!,
        name: "Mito Toshogu",
        address: "1-3-3 Miyamachi, Mito, Ibaraki",
        description: "One of the Three Great Toshogu shrines in Japan, Mito Toshogu was built by Tokugawa Yorifusa, the first lord of the Mito Domain, to enshrine his father Tokugawa Ieyasu. Though smaller than Nikko, its elaborate carvings and lacquerwork are exquisite. The shrine stands adjacent to the famous Kairakuen Garden, creating an unbeatable combination of sacred architecture and landscape beauty.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3730, longitude: 140.4545),
        stampSlotId: 443,
        category: .jinja,
        tagline: "One of Japan's Three Great Toshogu — Tokugawa splendor beside Kairakuen",
        highlights: [
            "One of the Three Great Toshogu shrines in Japan",
            "Built by the first Mito Domain lord for his father Ieyasu",
            "Elaborate carvings and gold lacquerwork on the main hall",
            "Adjacent to Kairakuen — one of Japan's Three Great Gardens"
        ],
        mustSee: "Examine the main hall's detailed carved panels and gold-leaf decoration. While less overwhelming than Nikko, the craftsmanship is equally fine, and the intimate scale allows closer appreciation. Then walk to adjacent Kairakuen to see its 3,000 plum trees — especially stunning in February–March.",
        tips: [
            "Combine with Kairakuen Garden — they share the same hilltop",
            "Plum blossom season (February–March) is the ideal time to visit",
            "The Mito Tokugawa Museum nearby has fascinating clan artifacts",
            "Mito's natto is famous — try it at a local restaurant"
        ],
        bestSeason: "February–March for Kairakuen plum blossoms, autumn for foliage",
        access: "20 min walk from JR Mito Station north exit or bus to Kairakuen-mae",
        hours: "9:00-16:30 (varies by season)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000444")!,
        name: "Hitachi Kamine Jinja",
        address: "1-2-1 Kaminemachi, Hitachi, Ibaraki",
        description: "Perched on a hilltop overlooking the Pacific Ocean in Hitachi City, Kamine Jinja offers sweeping coastal views from its elevated shrine grounds. The adjacent Kamine Park features cherry blossoms, a zoo, and an amusement park, making this a wonderful destination for families. The shrine's ocean-facing position gives it a unique energy — wind, salt air, and limitless horizon.",
        coordinate: CLLocationCoordinate2D(latitude: 36.5906, longitude: 140.6561),
        stampSlotId: 444,
        category: .jinja,
        tagline: "Hilltop shrine overlooking the Pacific with ocean breezes and cherry blossoms",
        highlights: [
            "Elevated hilltop position with panoramic Pacific Ocean views",
            "Adjacent Kamine Park with renowned cherry blossom displays",
            "Ocean-facing shrine with invigorating sea breeze atmosphere",
            "Family-friendly destination combining sacred and recreational"
        ],
        mustSee: "Stand at the shrine's highest point and take in the sweeping view of the Pacific Ocean stretching to the horizon. The salt wind, the sound of waves below, and the limitless blue create a spiritually charged atmosphere unique among Kanto's inland-oriented shrines.",
        tips: [
            "Cherry blossom season at Kamine Park is spectacular — one of Ibaraki's best",
            "The park's zoo and small amusement park make it great for families",
            "Hitachi City is also famous for the Hitachi Seaside Park nemophila blooms",
            "Fresh seafood at the nearby fishing port is excellent"
        ],
        bestSeason: "Spring for cherry blossoms, April-May for nemophila at Seaside Park",
        access: "Bus from JR Hitachi Station to Kamine Koen-guchi, about 10 min",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000445")!,
        name: "Fuchu Jinja",
        address: "1286 Fuchu-cho, Ishioka, Ibaraki",
        description: "An ancient shrine in the Fuchu district of Ishioka, historically the seat of the provincial governor of Hitachi. The shrine's quiet grounds preserve the atmosphere of old Hitachi Province's administrative center. Its connection to the provincial government system gives it a historical significance that belies its modest appearance.",
        coordinate: CLLocationCoordinate2D(latitude: 36.1741, longitude: 140.2913),
        stampSlotId: 445,
        category: .jinja,
        tagline: "Ancient seat of Hitachi Province's spiritual authority",
        highlights: [
            "Located in old Hitachi Province's administrative capital",
            "Historical ties to the provincial governor system",
            "Quiet atmospheric grounds in the Fuchu district",
            "Deep roots in Ibaraki's ancient political-spiritual landscape"
        ],
        mustSee: "Contemplate the layers of history — this area served as the political and spiritual center of Hitachi Province for centuries. The modest shrine grounds belie the enormous historical importance of this site as the nexus of governance and faith in ancient Ibaraki.",
        tips: [
            "Combine with Hitachinokuni Sosha shrine in nearby Ishioka",
            "The surrounding Fuchu district preserves rural Ibaraki atmosphere",
            "Less than 10 minutes from Ishioka Station by car",
            "The Ishioka area has several historic sake breweries worth visiting"
        ],
        bestSeason: "Year-round; autumn for surrounding rice harvest scenery",
        access: "15 min by car or taxi from JR Ishioka Station",
        hours: "Open 24 hours",
        imageURLs: []
    ),

    // --- Tochigi ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000446")!,
        name: "Utsunomiya Futaarayama Jinja",
        address: "1-1-1 Baba-dori, Utsunomiya, Tochigi",
        description: "The spiritual heart of Utsunomiya — Tochigi Prefecture's capital — this grand shrine has stood at the center of the city for over 1,500 years. Its name is shared with the famous Futarasan Jinja in Nikko, reflecting their common heritage as guardians of the Shimotsuke Province. The massive stone steps leading up from the city center create a dramatic entrance that transports visitors from urban bustle to sacred serenity.",
        coordinate: CLLocationCoordinate2D(latitude: 36.5594, longitude: 139.8867),
        stampSlotId: 446,
        category: .jinja,
        tagline: "Utsunomiya's 1,500-year-old spiritual heart at the top of grand stone steps",
        highlights: [
            "Over 1,500 years as Utsunomiya's central guardian shrine",
            "Dramatic stone staircase rising from the city center",
            "Shared heritage with Nikko's Futarasan Jinja",
            "Important shrine of old Shimotsuke Province"
        ],
        mustSee: "Climb the impressive stone staircase from the busy city streets up to the shrine plateau. The transition from the commercial district below to the quiet, tree-filled sacred space above is dramatic and immediate — like ascending from the mundane world into the divine.",
        tips: [
            "Utsunomiya is Japan's gyoza capital — enjoy dumplings after your visit",
            "The shrine is in the absolute center of the city — impossible to miss",
            "The view from the top of the steps over the city is excellent",
            "Nikko is just 40 minutes away by train for a combined spiritual journey"
        ],
        bestSeason: "Year-round; November for fall festival and autumn foliage",
        access: "15 min walk from JR Utsunomiya Station west exit or bus to Baba-dori",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000447")!,
        name: "Ashikaga Orihime Jinja",
        address: "4-1-1 Nishimiyacho, Ashikaga, Tochigi",
        description: "Dedicated to the gods of weaving and dyeing — fitting for Ashikaga, a city with over 1,200 years of textile heritage — Orihime Jinja sits atop a hill with commanding views over the Watarase River valley. The name 'Orihime' (Weaving Princess) also evokes the Tanabata star-crossed lovers legend, making this one of the Kanto region's most romantic shrines. The shrine is illuminated at night, creating a magical hilltop beacon.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3410, longitude: 139.4410),
        stampSlotId: 447,
        category: .jinja,
        tagline: "The Weaving Princess's hilltop shrine — romance and textile heritage",
        highlights: [
            "Dedicated to gods of weaving — honoring Ashikaga's textile heritage",
            "Romantic 'Weaving Princess' (Orihime/Tanabata) associations",
            "Hilltop views over the Watarase River valley",
            "Beautiful nighttime illumination creating a hilltop beacon"
        ],
        mustSee: "Visit at sunset and stay for the illumination. As daylight fades, the shrine is lit in warm amber light against the darkening sky, creating a floating beacon above the city. The connection to the Tanabata Weaving Princess legend — eternally separated from her lover across the Milky Way — adds romantic poignancy.",
        tips: [
            "The hilltop steps are numerous — it's a good workout",
            "Evening illumination is stunning — plan a sunset visit",
            "Ashikaga Flower Park (Great Wisteria) is nearby — combine in May",
            "The Ashikaga Gakko (Japan's oldest school) is worth visiting too"
        ],
        bestSeason: "Tanabata season (July 7), May for nearby wisteria, evening for illumination",
        access: "20 min walk from JR Ashikaga Station or Tobu Ashikagashi Station",
        hours: "Open 24 hours (illumination until 21:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000448")!,
        name: "Sano Yakuyoke Daishi",
        address: "2233 Kinugawacho, Sano, Tochigi",
        description: "One of the Kanto region's three great yakuyoke (misfortune-warding) temples, Sano Yakuyoke Daishi draws massive crowds during the New Year period — over a million visitors in the first three days alone. The Tendai temple is dedicated to protecting worshippers from yakudoshi (unlucky years), and its powerful reputation makes it one of North Kanto's most important spiritual destinations.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3072, longitude: 139.5844),
        stampSlotId: 448,
        category: .daishi,
        tagline: "Kanto's great misfortune-warding temple — a million visitors at New Year",
        highlights: [
            "One of the Three Great Yakuyoke temples in the Kanto region",
            "Over one million visitors during the first three days of New Year",
            "Powerful yakudoshi (unlucky year) protection blessings",
            "Important Tendai temple of North Kanto"
        ],
        mustSee: "Experience the sheer scale of devotion during hatsumode (New Year visits), when over a million people stream through the temple to receive yakuyoke protection for the coming year. The massive crowds, incense smoke, and fervent prayers create an overwhelming atmosphere of communal faith.",
        tips: [
            "Avoid January 1-3 unless you enjoy massive crowds — mid-January is calmer",
            "Sano is also famous for Sano Ramen — excellent local noodle style",
            "Sano Premium Outlets are nearby for a shopping-and-spirituality day",
            "The yakuyoke amulets make meaningful gifts for friends in yakudoshi years"
        ],
        bestSeason: "New Year for the full experience, year-round for yakuyoke blessings",
        access: "15 min walk from Tobu Sano Line Sano Station",
        hours: "8:20-17:00 (extended during New Year period)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000449")!,
        name: "Nikko-zan Chuzen-ji",
        address: "2578 Chugushi, Nikko, Tochigi",
        description: "Standing on the shores of the crater lake that bears its name, Chuzen-ji is a Tendai temple founded in 784 by the monk Shodo Shonin. The temple's greatest treasure is a massive standing Kannon statue said to have been carved by Shodo himself from a single living tree on the slopes of Mount Nantai. Lake Chuzenji's deep blue waters and the surrounding mountain peaks create a setting of extraordinary natural beauty.",
        coordinate: CLLocationCoordinate2D(latitude: 36.7405, longitude: 139.4895),
        stampSlotId: 449,
        category: .tera,
        tagline: "Lakeside Kannon temple at the foot of sacred Mount Nantai",
        highlights: [
            "Standing Kannon carved from a single living tree by Shodo Shonin",
            "Spectacular Lake Chuzenji shoreline setting",
            "Founded in 784 — one of the oldest temples in the Nikko area",
            "Views of Mount Nantai and Kegon Falls from the area"
        ],
        mustSee: "View the massive standing Kannon statue — carved from a single tree trunk over 1,200 years ago. The figure's serene expression and the warm wood grain create a powerful impression. Then step outside to Lake Chuzenji's deep blue waters reflecting Mount Nantai above.",
        tips: [
            "Kegon Falls is a short walk away — one of Japan's Three Great Waterfalls",
            "Autumn foliage around the lake is among Tochigi's most spectacular",
            "The Irohazaka winding road up from central Nikko is thrilling",
            "Lake Chuzenji boat cruises offer views of lakeside shrines and mountains"
        ],
        bestSeason: "Mid-October for peak autumn foliage around the lake",
        access: "Bus from JR/Tobu Nikko Station to Chuzenji Onsen, about 50 min",
        hours: "8:00-17:00 (April-October), 8:00-16:00 (November-March)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000450")!,
        name: "Nasutemari Onsen Jinja",
        address: "17-68 Yumoto, Nasu, Tochigi",
        description: "Set amid the steaming hot springs of the Nasu highland resort area, Nasu Yumoto Onsen Jinja (commonly Nasu Onsen Jinja) has watched over the thermal waters for centuries. The nearby Sessho-seki (Killing Stone) — a volcanic boulder said to contain the spirit of the legendary nine-tailed fox Tamamo-no-Mae — cracked open dramatically in 2022, making international news and reigniting interest in this mythical site.",
        coordinate: CLLocationCoordinate2D(latitude: 37.1072, longitude: 139.9629),
        stampSlotId: 450,
        category: .jinja,
        tagline: "Hot springs guardian near the legendary nine-tailed fox's Killing Stone",
        highlights: [
            "Guardian shrine of Nasu Yumoto hot springs",
            "Near the famous Sessho-seki (Killing Stone) — cracked open in 2022",
            "Connection to the Tamamo-no-Mae nine-tailed fox legend",
            "Set amid atmospheric volcanic steam vents"
        ],
        mustSee: "Visit the nearby Sessho-seki (Killing Stone), which dramatically split in two in March 2022 after centuries of containing the spirit of the nine-tailed fox Tamamo-no-Mae. The cracked boulder, the sulfurous steam, and the barren volcanic landscape create an eerie, mythological atmosphere.",
        tips: [
            "The Sessho-seki is a short walk from the shrine — don't miss it",
            "Enjoy a soak in Nasu Yumoto Onsen after your shrine visit",
            "The Nasu highland area has excellent hiking trails",
            "The Imperial Villa is nearby — Nasu is a favorite retreat of the Imperial family"
        ],
        bestSeason: "Autumn for highland foliage, year-round for hot springs",
        access: "Bus from JR Nasushiobara Station to Nasu Yumoto Onsen, about 50 min",
        hours: "Open 24 hours",
        imageURLs: []
    ),

    // --- Gunma ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000451")!,
        name: "Ikaho Jinja",
        address: "2 Ikaho, Ikaho, Shibukawa, Gunma",
        description: "Perched at the very top of Ikaho Onsen's famous 365 stone steps, Ikaho Jinja rewards climbers with a sense of achievement, mountain views, and the spiritual energy of this ancient hot-spring town. Each of the 365 steps represents a day of the year, and the climb past ryokan, souvenir shops, and steaming spring water is one of the most atmospheric approaches to any shrine in the Kanto region.",
        coordinate: CLLocationCoordinate2D(latitude: 36.4959, longitude: 138.9367),
        stampSlotId: 451,
        category: .jinja,
        tagline: "Summit shrine atop 365 stone steps through a steaming hot-spring town",
        highlights: [
            "Crowns the top of Ikaho Onsen's famous 365 stone steps",
            "Each step represents one day of the year",
            "Atmospheric approach past ryokan, shops, and steaming springs",
            "Mountain views from the hilltop shrine grounds"
        ],
        mustSee: "Climb all 365 stone steps from the bottom of Ikaho's onsen district to the shrine at the summit. Iron-rich spring water runs in channels alongside the steps, ryokan steam rises between buildings, and the air smells of mineral water and roasting senbei. It is one of Japan's most sensory shrine approaches.",
        tips: [
            "Start at the bottom for the full 365-step experience",
            "Stop at the Kogane no Yu (free public foot bath) partway up",
            "The 365 steps are manageable but take your time — enjoy the atmosphere",
            "Reward yourself with an onsen soak at one of the many ryokan after"
        ],
        bestSeason: "Autumn for mountain foliage, winter for hot-spring atmosphere",
        access: "Bus from JR Shibukawa Station to Ikaho Onsen, about 25 min, then climb the steps",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000452")!,
        name: "Morinji",
        address: "1570 Horikocho, Tatebayashi, Gunma",
        description: "The temple behind one of Japan's most beloved folktales — Bunbuku Chagama (The Lucky Tea Kettle), about a tanuki (raccoon dog) that transforms into a tea kettle to help a kind monk. The temple grounds are filled with charming tanuki statues of all sizes, and the legendary tea kettle itself is enshrined within. The whimsical atmosphere makes it a delightful destination for families and folklore enthusiasts.",
        coordinate: CLLocationCoordinate2D(latitude: 36.2394, longitude: 139.5478),
        stampSlotId: 452,
        category: .tera,
        tagline: "Home of the shapeshifting tea kettle — tanuki statues and folk-tale magic",
        highlights: [
            "Origin temple of the Bunbuku Chagama folktale",
            "Charming tanuki (raccoon dog) statues throughout the grounds",
            "The legendary tea kettle enshrined within the temple",
            "Whimsical atmosphere beloved by families and folklore fans"
        ],
        mustSee: "Seek out the legendary Bunbuku Chagama tea kettle enshrined in the temple hall. Then explore the grounds where dozens of tanuki statues — from dignified to comically rotund — pose amid the trees. The whimsy and warmth of this place embody the gentle humor of Japanese folk religion.",
        tips: [
            "Children love the tanuki statues — a great family destination",
            "Tatebayashi is also famous for its spectacular azalea gardens in spring",
            "The surrounding Soto Zen temple grounds are peaceful for walking",
            "Tatebayashi udon is excellent — try it at a local shop"
        ],
        bestSeason: "Spring for nearby azalea gardens, year-round for tanuki charm",
        access: "20 min walk from Tobu Isesaki Line Tatebayashi Station",
        hours: "9:00-16:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000453")!,
        name: "Takasaki Byakue Daikannon",
        address: "2710-1 Ishiharamachi, Takasaki, Gunma",
        description: "A towering 41.8-meter white Kannon statue on a hilltop overlooking Takasaki City, this concrete bodhisattva is one of the most recognizable landmarks in Gunma Prefecture. Built in 1936, visitors can climb inside the hollow statue to observation windows that offer panoramic views of the Kanto Plain and surrounding mountains. The sheer scale creates an awe-inspiring presence visible from miles around.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3355, longitude: 139.0214),
        stampSlotId: 453,
        category: .tera,
        tagline: "41 meters of white Kannon — climb inside for Kanto Plain panoramas",
        highlights: [
            "41.8-meter-tall white Kannon statue — Gunma's iconic landmark",
            "Climbable interior with observation windows for panoramic views",
            "Visible from miles around, dominating the Takasaki skyline",
            "Built in 1936 — nearly 90 years of watching over the city"
        ],
        mustSee: "Climb the interior staircase to the observation windows near the statue's shoulders. From here, the Kanto Plain stretches endlessly eastward while the Jomo Sanzan mountains (Akagi, Haruna, Myogi) form a dramatic western wall. On clear days, Tokyo Skytree is visible in the far distance.",
        tips: [
            "Takasaki is the daruma capital of Japan — buy one as a souvenir",
            "The interior climb is easy — suitable for all fitness levels",
            "Cherry blossoms around the base are beautiful in spring",
            "Combine with Shorinzan Daruma-ji (daruma temple) for a full Takasaki day"
        ],
        bestSeason: "Winter for clearest mountain views, spring for cherry blossoms",
        access: "Bus from JR Takasaki Station to Byakue Daikannon-mae, about 20 min",
        hours: "9:00-17:00 (March-October), 9:00-16:30 (November-February)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000454")!,
        name: "Kusatsu Onsen Kusatsu Hakusan Jinja",
        address: "538 Kusatsu, Agatsuma District, Gunma",
        description: "Overlooking the famous Yubatake (hot water field) at the center of Kusatsu Onsen — one of Japan's top three hot springs — Hakusan Jinja is the spiritual guardian of these healing waters. The shrine's position directly above the steaming Yubatake creates a dramatic scene, especially when illuminated at night. Worshippers pray for health and healing, drawing on the same therapeutic powers that make Kusatsu legendary.",
        coordinate: CLLocationCoordinate2D(latitude: 36.6217, longitude: 138.5958),
        stampSlotId: 454,
        category: .jinja,
        tagline: "Overlooking the steaming heart of Japan's greatest hot spring",
        highlights: [
            "Overlooks the Yubatake — Kusatsu's iconic steaming hot water field",
            "Spiritual guardian of one of Japan's top three onsen",
            "Dramatic nighttime illumination with steam rising below",
            "Health and healing blessings from the onsen deity"
        ],
        mustSee: "Stand at the shrine and look down at the Yubatake — wooden channels directing steaming, sulfurous water in neat rows as it cools before distribution to the town's bathhouses. At night, the illuminated emerald water and rising steam create a scene that looks like a gateway to another world.",
        tips: [
            "Visit at night for the most dramatic Yubatake illumination views",
            "Soak in one of the free public baths (rotenburo) after your shrine visit",
            "Kusatsu is one of Japan's highest-altitude onsen — bring warm clothes",
            "The yumomi (water-stirring) show is a unique Kusatsu tradition"
        ],
        bestSeason: "Winter for snow-and-steam atmosphere, year-round for onsen",
        access: "Bus from JR Naganohara-Kusatsuguchi Station to Kusatsu Onsen, about 25 min, then 5 min walk",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000455")!,
        name: "Nunobiki Kannon",
        address: "1 Gojoyama, Takasaki, Gunma",
        description: "Hidden deep in a mountain valley west of Takasaki, Nunobiki Kannon (formally Chokoku-ji) is a cliffside Kannon temple accessible only by a winding mountain road. The dramatic setting — with the main hall perched against a sheer rock face — recalls the hanging temples of China. The temple is one of the Bando 33 Kannon pilgrimage sites and offers visitors genuine mountain-temple solitude.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3539, longitude: 138.9178),
        stampSlotId: 455,
        category: .tera,
        tagline: "A hanging temple on a cliff face hidden in a mountain valley",
        highlights: [
            "Main hall perched dramatically against a sheer cliff face",
            "Station 15 on the Bando 33 Kannon pilgrimage",
            "Secluded mountain valley location with genuine solitude",
            "Recalls the famous hanging temples of Chinese Buddhism"
        ],
        mustSee: "Look up at the main hall clinging to the cliff face above you. The architectural achievement of building a temple hall on a near-vertical rock wall, deep in a mountain valley, speaks to the extraordinary devotion of the builders. The waterfall nearby adds to the mystical mountain atmosphere.",
        tips: [
            "Access requires a car or taxi — no convenient public transit",
            "The mountain road is narrow and winding — drive carefully",
            "Combine with Takasaki Byakui Daikannon for a full day",
            "Autumn foliage in the valley is spectacular"
        ],
        bestSeason: "Autumn for mountain valley foliage, year-round for cliff temple views",
        access: "30 min by car from JR Takasaki Station (limited public transit)",
        hours: "8:30-16:30",
        imageURLs: []
    ),

    // --- Yamanashi ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000456")!,
        name: "Kai Zenko-ji Yakushi-do",
        address: "3-36-1 Zenkoji, Kofu, Yamanashi",
        description: "Adjacent to Kai Zenko-ji, the Yakushi-do (Medicine Buddha Hall) is an Important Cultural Property dating to the Muromachi period. Its elegant thatched roof and refined proportions represent the pinnacle of medieval Buddhist architecture in the Kofu Basin. The Yakushi Nyorai inside is revered for healing, and the hall's intimate scale creates a more personal spiritual encounter than the grand main temple.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6716, longitude: 138.5600),
        stampSlotId: 456,
        category: .tera,
        tagline: "Medieval Medicine Buddha hall with a thatched roof in the Kofu Basin",
        highlights: [
            "Important Cultural Property from the Muromachi period",
            "Elegant thatched-roof architecture — pinnacle of medieval style",
            "Yakushi Nyorai (Medicine Buddha) for healing blessings",
            "Intimate scale offering a personal spiritual encounter"
        ],
        mustSee: "Admire the thatched-roof hall's refined proportions — the gentle curve of the roof, the aged timber, and the quiet setting create an atmosphere of medieval contemplation. This is architecture as spiritual practice, every proportion calculated to calm the mind and open the heart.",
        tips: [
            "Combine with the adjacent Kai Zenko-ji for a complete temple visit",
            "The thatched roof is especially photogenic after rain or light snow",
            "Kofu is the gateway to the Shosenkyo Gorge — stunning in autumn",
            "Yamanashi's wine and hoto noodles are excellent local specialties"
        ],
        bestSeason: "Autumn for Kofu Basin foliage, winter for snow on the thatched roof",
        access: "15 min walk from JR Kofu Station south exit",
        hours: "9:00-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000457")!,
        name: "Erinji",
        address: "2280 Enzan-Kosugi, Koshu, Yamanashi",
        description: "The temple where the great warlord Takeda Shingen was secretly cremated after his death in 1573. According to legend, as the flames consumed his body, Shingen spoke his famous last words: 'My body is the castle of Kai.' The temple's magnificent Zen garden — designed by the great Muso Soseki — is designated a National Place of Scenic Beauty and is breathtaking during autumn foliage season.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7213, longitude: 138.7539),
        stampSlotId: 457,
        category: .tera,
        tagline: "Takeda Shingen's secret cremation temple with a masterpiece Zen garden",
        highlights: [
            "Secret cremation site of warlord Takeda Shingen (1573)",
            "Zen garden by master Muso Soseki — National Place of Scenic Beauty",
            "Spectacular autumn foliage — one of Yamanashi's finest",
            "Deep connections to the Takeda samurai clan legacy"
        ],
        mustSee: "Sit before the Zen garden designed by Muso Soseki and contemplate its layered beauty. During autumn, the maples surrounding the garden explode in scarlet and gold, reflecting in the pond and creating what many consider Yamanashi Prefecture's single most beautiful scene.",
        tips: [
            "Autumn foliage peak is typically mid-November — one of Yamanashi's best",
            "The temple requires an admission fee — worth every yen",
            "Koshu is wine country — combine with a winery visit",
            "Takeda Jinja in nearby Kofu celebrates the same warlord"
        ],
        bestSeason: "Mid-November for autumn foliage (essential)",
        access: "Bus from JR Enzan Station, about 10 min, or 30 min walk",
        hours: "8:30-16:30 (may vary seasonally)",
        imageURLs: []
    ),

    // --- Shizuoka ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000458")!,
        name: "Shuzen-ji Okuno-in",
        address: "1160-1 Shuzenji, Izu, Shizuoka",
        description: "Deep in the forested hills above Shuzenji Onsen, Okuno-in (the inner temple) is a hidden retreat reached by a quiet mountain trail. Here Kobo Daishi is said to have meditated in a cave, and the site preserves a raw spiritual intensity that the more accessible main temple in the valley below has long since softened. The moss-covered stones, ancient cedars, and mountain silence create a powerful atmosphere of solitary devotion.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9788, longitude: 138.9340),
        stampSlotId: 458,
        category: .tera,
        tagline: "Kobo Daishi's mountain meditation cave above Izu's hot springs",
        highlights: [
            "Kobo Daishi's meditation cave deep in the mountain forest",
            "Raw spiritual intensity preserved by mountain isolation",
            "Moss-covered stones and ancient cedar forest atmosphere",
            "Hidden retreat above the popular Shuzenji Onsen valley"
        ],
        mustSee: "Find the cave where Kobo Daishi is said to have meditated. The small dark space, set into the hillside amid ancient trees, strips away all distraction. The silence of the mountain, broken only by birdsong and wind, helps you understand why Buddhist masters sought out such places for spiritual practice.",
        tips: [
            "The trail from Shuzenji Onsen takes about 30-40 minutes — moderate difficulty",
            "Wear proper walking shoes — the path can be muddy after rain",
            "Very few visitors come here — genuine solitude is likely",
            "Combine with the main Shuzenji temple in the valley for contrast"
        ],
        bestSeason: "Year-round; moss is greenest in rainy season (June)",
        access: "30-40 min walk from Shuzenji Onsen bus terminal via mountain trail",
        hours: "Daylight hours (no formal closing time)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000459")!,
        name: "Kogane Jinja",
        address: "1-2-1 Shimogawara, Shimoda, Shizuoka",
        description: "The guardian shrine of Shimoda, the port where Commodore Perry's Black Ships anchored in 1854, forcing Japan open to the world. From the shrine's hilltop position, you can see the very harbor where Perry's fleet dropped anchor — a view that connects you directly to one of the most pivotal moments in Japanese history. The shrine's annual Black Ships Festival in May recreates the arrival with historical pageantry.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6729, longitude: 138.9435),
        stampSlotId: 459,
        category: .jinja,
        tagline: "Hilltop guardian overlooking the harbor where Perry's Black Ships anchored",
        highlights: [
            "Overlooks the harbor where Perry's Black Ships arrived in 1854",
            "Direct visual connection to one of Japan's most pivotal historical moments",
            "Annual Black Ships Festival in May with historical reenactment",
            "Hilltop position with panoramic views over Shimoda Bay"
        ],
        mustSee: "Stand at the shrine and look out over Shimoda Harbor. In 1854, Commodore Perry's fleet anchored in this very bay, beginning the chain of events that ended 250 years of isolation and transformed Japan into a modern nation. The view is both beautiful and historically charged.",
        tips: [
            "The Black Ships Festival (May) features US Navy participation and parades",
            "Shimoda's beaches are among the Izu Peninsula's finest",
            "Perry Road — a charming waterside lane — has cafés and galleries",
            "Ryosen-ji temple nearby is where the US-Japan treaty was negotiated"
        ],
        bestSeason: "May for the Black Ships Festival, summer for beaches",
        access: "10 min walk from Izukyu Shimoda Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000460")!,
        name: "Kunōzan Tōshōgū",
        address: "390 Kunozan, Suruga, Shizuoka",
        description: "The original resting place of Tokugawa Ieyasu, built before the more famous Nikko Toshogu. Kunōzan Toshogu clings to a clifftop overlooking Suruga Bay, accessible only by climbing 1,159 stone steps or by ropeway. Its ornate Gongen-style architecture, designated a National Treasure, glows with gold leaf and polychrome carvings. Many historians consider it more authentic than its grander Nikko successor.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9561, longitude: 138.4667),
        stampSlotId: 460,
        category: .jinja,
        tagline: "Ieyasu's original tomb — National Treasure on a Suruga Bay clifftop",
        highlights: [
            "Original resting place of Tokugawa Ieyasu — before Nikko",
            "National Treasure main hall with gold leaf and polychrome carvings",
            "Dramatic clifftop position overlooking Suruga Bay",
            "1,159 stone steps or ropeway access adding adventure to the visit"
        ],
        mustSee: "Climb the 1,159 stone steps for the most rewarding approach (or take the Nihondaira Ropeway for easier access). The National Treasure main hall explodes with gold leaf, carved dragons, and vivid colors. Then visit Ieyasu's actual tomb at the summit — simpler and more moving than the grandiose Nikko version.",
        tips: [
            "The 1,159 steps are steep but manageable — take rests at the viewpoints",
            "Nihondaira Ropeway offers an alternative approach with bay views",
            "Combine with the Nihondaira plateau for panoramic Fuji-and-ocean views",
            "Shizuoka's matcha (green tea) and sakura ebi (shrimp) are local specialties"
        ],
        bestSeason: "Winter for clearest bay and Fuji views, spring for cherry blossoms",
        access: "Ropeway from Nihondaira (bus from JR Shizuoka Station, about 40 min), or 1,159 steps from the coast",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    // --- More Tokyo ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000461")!,
        name: "Shinjuku Juniso Kumano Jinja",
        address: "2-11-2 Nishishinjuku, Shinjuku, Tokyo",
        description: "Hidden in a residential pocket of Nishishinjuku, this small Kumano branch shrine preserves the memory of a time when twelve spring-fed ponds dotted this area — hence 'Juniso' (Twelve Ponds). While the ponds are long gone, swallowed by urban development, the shrine maintains a tranquil atmosphere and connection to Shinjuku's vanished waterscape. A poignant reminder of Tokyo's lost natural landscape.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6928, longitude: 139.6968),
        stampSlotId: 461,
        category: .jinja,
        tagline: "Memory of twelve vanished ponds in a quiet corner of Shinjuku",
        highlights: [
            "Preserves the memory of Shinjuku's vanished Twelve Ponds landscape",
            "Branch of the Kumano Sanzan sacred network",
            "Tranquil pocket shrine amid Nishishinjuku's residential streets",
            "A poignant connection to Tokyo's lost natural waterscape"
        ],
        mustSee: "Stand in this quiet shrine and imagine the landscape as it once was — twelve spring-fed ponds surrounded by marshland and forest, in what is now one of the densest urban environments on Earth. The shrine is the sole surviving witness to Shinjuku's vanished pastoral past.",
        tips: [
            "Very close to the Shinjuku Kumano Jinja — visit both for a contrast",
            "The tiny grounds feel surprisingly removed from Shinjuku's energy",
            "Easy to combine with Shinjuku Gyoen park, a 10-minute walk away",
            "Best appreciated by those who enjoy contemplating urban transformation"
        ],
        bestSeason: "Year-round",
        access: "5 min walk from JR Shinjuku Station west exit or Seibu Shinjuku Station",
        hours: "Open 24 hours",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000462")!,
        name: "Suwa Jinja Nishiwaseda",
        address: "18-15 Takadanobaba, Shinjuku, Tokyo",
        description: "A neighborhood shrine in the student quarter of Takadanobaba-Waseda, Suwa Jinja has ancient origins but a thoroughly local character. Students from nearby Waseda University pray here before exams, and the shrine's intimate scale and genuine community atmosphere provide an authentic counterpoint to Tokyo's grand tourist shrines. The approach through residential streets feels like discovering a village shrine in the heart of the city.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7132, longitude: 139.7079),
        stampSlotId: 462,
        category: .jinja,
        tagline: "A village-scale shrine in the heart of Tokyo's student quarter",
        highlights: [
            "Authentic neighborhood shrine in the Waseda student district",
            "Popular with students praying for exam success",
            "Intimate village-like atmosphere in central Tokyo",
            "Ancient origins with genuine community connection"
        ],
        mustSee: "Experience a truly local shrine visit — no tourist crowds, no English signs, just neighborhood residents paying respects and students stopping by before class. The shrine's modest scale and genuine character offer a window into everyday Japanese spiritual life that grand shrines cannot provide.",
        tips: [
            "Completely off the tourist radar — a genuine local experience",
            "The Waseda-Takadanobaba area has excellent budget restaurants",
            "Combine with Ana Hachimangu nearby for a Waseda shrine walk",
            "The student bars of Takadanobaba are lively in the evening"
        ],
        bestSeason: "Year-round; January-February for exam-season prayers",
        access: "8 min walk from JR Takadanobaba Station or Waseda Station (Tozai Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000463")!,
        name: "Kameari Katori Jinja",
        address: "3-42-24 Kameari, Katsushika, Tokyo",
        description: "The local shrine of Kameari in Katsushika ward, an area immortalized by the manga and anime series 'Kochikame' (Kochira Katsushikaku Kameari Koen-mae Hashutsujo). Bronze statues of the beloved Officer Ryo-san dot the neighborhood, and the shrine itself is a genuine community gathering place with deep roots in this quintessentially shitamachi district of eastern Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7640, longitude: 139.8486),
        stampSlotId: 463,
        category: .jinja,
        tagline: "Shitamachi shrine in the neighborhood of manga legend Kochikame",
        highlights: [
            "Guardian shrine of Kameari — setting of the beloved Kochikame manga",
            "Bronze Ryo-san (Kochikame) statues in the surrounding neighborhood",
            "Quintessential shitamachi community shrine atmosphere",
            "Deep roots in eastern Tokyo's working-class culture"
        ],
        mustSee: "After visiting the shrine, explore the Kameari neighborhood to find the bronze Ryo-san statues scattered around the station area. The combination of genuine shrine tradition and pop-culture pilgrimage captures the playful spirit of this warmhearted shitamachi district.",
        tips: [
            "Kochikame fans should photograph all the Ryo-san bronze statues",
            "Kameari's shopping streets have old-fashioned sweet shops and senbei stores",
            "Ario Kameari shopping center is next to the station for modern needs",
            "The Katsushika area preserves authentic shitamachi Tokyo charm"
        ],
        bestSeason: "Year-round; summer for local festival atmosphere",
        access: "5 min walk from JR Joban Line Kameari Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000464")!,
        name: "Tenso Jinja Nerima",
        address: "1-7-2 Nerima, Nerima, Tokyo",
        description: "The principal shrine of Nerima ward, Tenso Jinja sits amid a grove of ancient trees that miraculously survived the wartime bombing that devastated much of Tokyo. The shrine's survival through the firestorms gave it an aura of divine protection that remains powerful in the community's memory. Its annual festival is the largest in Nerima ward.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7376, longitude: 139.6534),
        stampSlotId: 464,
        category: .jinja,
        tagline: "Nerima's guardian — the sacred grove that survived the firestorms",
        highlights: [
            "Principal shrine of Nerima ward",
            "Sacred grove survived WWII bombing — aura of divine protection",
            "Largest annual festival in Nerima ward",
            "Ancient trees miraculously preserved amid wartime destruction"
        ],
        mustSee: "Stand beneath the ancient trees and consider that this grove survived while nearly everything around it burned. The trees' endurance through the firestorms gave this shrine a profound significance for the local community — a living symbol of resilience and divine protection.",
        tips: [
            "The autumn festival is Nerima's biggest — lively and community-focused",
            "Nerima ward is the birthplace of Japanese anime — studios dot the area",
            "Toshimaen area (now Harry Potter Studio Tour) is nearby",
            "A genuine community shrine — very few tourists visit"
        ],
        bestSeason: "Autumn for festival and foliage, year-round",
        access: "5 min walk from Seibu Ikebukuro/Oedo Line Nerima Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- More Saitama ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000465")!,
        name: "Chichibu Hase Kannon",
        address: "3773-1 Agano, Yokoze, Chichibu District, Saitama",
        description: "Temple 15 of the Chichibu 34 Kannon pilgrimage, Hase Kannon sits dramatically on a mountainside with panoramic views over the Chichibu Valley. The temple's approach passes through a forest of towering cedar trees, and the hilltop position offers sweeping vistas of the surrounding mountains. It shares its name with the famous Hase-dera in Kamakura and Nara, connecting Chichibu to Japan's broader Kannon worship network.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9639, longitude: 139.0550),
        stampSlotId: 465,
        category: .tera,
        tagline: "Mountain Kannon temple with sweeping views over the Chichibu Valley",
        highlights: [
            "Station 15 of the Chichibu 34 Kannon pilgrimage",
            "Dramatic mountainside position with valley panorama",
            "Cedar forest approach building spiritual anticipation",
            "Connected to Japan's broader Hase Kannon worship tradition"
        ],
        mustSee: "Climb to the temple and turn around — the sweeping view over the Chichibu Valley, with its patchwork of rice fields, forest, and distant mountains, is one of the pilgrimage circuit's most rewarding panoramas. The physical effort of the climb makes the vista feel earned and the spiritual experience deeper.",
        tips: [
            "The climb is moderate — about 20 minutes from the base",
            "Combine with other Chichibu 34 Kannon pilgrimage temples",
            "The cedar forest approach is atmospheric in morning mist",
            "Chichibu's natural scenery is best appreciated from elevated temples like this"
        ],
        bestSeason: "Autumn for mountain foliage, spring for valley cherry blossoms",
        access: "Bus from Seibu-Chichibu Station or Chichibu Station, then 20 min walk uphill",
        hours: "8:00-17:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000466")!,
        name: "Kawagoe Kumano Jinja",
        address: "17-1 Renjakucho, Kawagoe, Saitama",
        description: "In the heart of Kawagoe's atmospheric Edo-period warehouse district (kurazukuri), this Kumano branch shrine is a charming stop during a stroll through 'Little Edo.' The shrine is especially popular for its monthly craft markets and its position amid Kawagoe's beautifully preserved merchant architecture — clay-walled storehouses that conjure the atmosphere of Edo-period commerce.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9242, longitude: 139.4847),
        stampSlotId: 466,
        category: .jinja,
        tagline: "Kumano blessings amid Little Edo's clay-walled warehouses",
        highlights: [
            "Located in the heart of Kawagoe's Edo-period warehouse district",
            "Monthly craft markets drawing artisan vendors",
            "Surrounded by beautifully preserved kurazukuri architecture",
            "Branch shrine of the Kumano Sanzan pilgrimage network"
        ],
        mustSee: "Visit on a market day (typically the first weekend of each month) when artisan vendors fill the shrine grounds with handmade crafts, pottery, and local goods. The combination of sacred space, creative community, and surrounding Edo architecture is quintessentially Kawagoe.",
        tips: [
            "Check the market schedule online — typically first weekends",
            "Kawagoe's famous Toki no Kane (Bell Tower) is steps away",
            "Sweet potato treats are Kawagoe's signature snack — try them everywhere",
            "The kurazukuri street is most atmospheric on weekday mornings"
        ],
        bestSeason: "Year-round; market weekends for the liveliest atmosphere",
        access: "15 min walk from Tobu Tojo/JR Kawagoe Station or bus to Kurazukuri area",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- More Kanagawa ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000467")!,
        name: "Yokohama Itsukushima Jinja",
        address: "64 Miyamaecho, Nishi, Yokohama, Kanagawa",
        description: "One of three Benzaiten (goddess of water, music, and fortune) shrines on Enoshima's island neighbor — this shrine is perched on a small island in a pond within Yokohama's Nogeyama Park. Its vermillion bridge and compact island setting recall the famous Itsukushima Shrine of Miyajima. The shrine is popular with musicians and artists seeking the blessing of Benzaiten's creative powers.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4438, longitude: 139.6244),
        stampSlotId: 467,
        category: .jinja,
        tagline: "Benzaiten on an island pond — Yokohama's miniature Miyajima",
        highlights: [
            "Itsukushima Shrine on a pond island in Nogeyama Park",
            "Vermillion bridge approach recalling Miyajima",
            "Benzaiten blessings for music, art, and fortune",
            "Popular with creative professionals seeking inspiration"
        ],
        mustSee: "Cross the vermillion bridge to the small island shrine — the pond reflections of the red structure, the surrounding greenery, and the city skyline beyond create a layered scene. Musicians sometimes play near the shrine to receive Benzaiten's creative blessing.",
        tips: [
            "Nogeyama Park also has a free zoo — great for families",
            "Walking distance from Yokohama's lively Noge entertainment district",
            "Beautiful at sunset when the vermillion bridge catches golden light",
            "Combine with Yokohama Chinatown and the waterfront area"
        ],
        bestSeason: "Spring for cherry blossoms around the pond, year-round",
        access: "10 min walk from JR/Yokohama Municipal Subway Sakuragicho Station",
        hours: "Open 24 hours",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000468")!,
        name: "Shirahata Jinja Fujisawa",
        address: "2-4-7 Fujisawa, Fujisawa, Kanagawa",
        description: "A shrine deeply connected to the legend of Minamoto no Yoshitsune, the tragic hero of the Genpei War. According to tradition, Yoshitsune's head was washed ashore at nearby Katase and brought to this shrine for enshrinement. The white banner (shirahata) in the shrine's name refers to the Genji clan's emblem. The shrine provides a poignant connection to one of Japan's most beloved and tragic warrior stories.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3393, longitude: 139.4904),
        stampSlotId: 468,
        category: .jinja,
        tagline: "Resting place of Yoshitsune's spirit — a tragic warrior's final shrine",
        highlights: [
            "Connected to the legend of Minamoto no Yoshitsune's severed head",
            "White banner (shirahata) name references the Genji clan emblem",
            "Poignant connection to the Genpei War's most tragic hero",
            "Central Fujisawa location near the old Tokaido"
        ],
        mustSee: "Contemplate the tragic tale of Yoshitsune — the brilliant general who won the Genpei War for his brother Yoritomo, only to be hunted down and forced to commit seppuku. His head was sent to Kamakura for identification, and legend says it washed up near here, carried by the tides of the Katase River.",
        tips: [
            "Combine with Yugyo-ji temple for a Fujisawa spiritual walk",
            "Enoshima is just a short train ride away",
            "The story of Yoshitsune is central to Japanese cultural identity",
            "Fujisawa's old Tokaido post-town traces are worth exploring"
        ],
        bestSeason: "Year-round",
        access: "5 min walk from JR/Odakyu Fujisawa Station south exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- More Chiba ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000469")!,
        name: "Tateyama Tsurugaya Hachimangu",
        address: "230 Yawatagachō, Tateyama, Chiba",
        description: "The principal shrine of Tateyama City at the southern tip of the Boso Peninsula, this Hachimangu is dedicated to the warrior deity Hachiman and has guarded the entrance to Tokyo Bay for centuries. The shrine's autumn festival, Yawatamatsuri, features spectacular mikoshi processions with a seaside backdrop — portable shrines against the blue ocean and sky.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9963, longitude: 139.8573),
        stampSlotId: 469,
        category: .hachimangu,
        tagline: "Warrior shrine guarding the gateway to Tokyo Bay",
        highlights: [
            "Principal shrine of Tateyama at the tip of the Boso Peninsula",
            "Warrior deity Hachiman guarding Tokyo Bay's entrance",
            "Yawatamatsuri autumn festival with seaside mikoshi processions",
            "Gateway shrine for fishing communities and bay sailors"
        ],
        mustSee: "During the autumn festival, watch mikoshi processions pass through the streets of Tateyama with Tokyo Bay visible behind them. The sight of ornate portable shrines against the blue ocean and sky — rather than the usual urban backdrop — gives this festival a uniquely dramatic character.",
        tips: [
            "The autumn festival is in September — check exact dates",
            "Tateyama has excellent fresh seafood — especially sushi and sashimi",
            "Combine with Susaki Jinja at the peninsula's tip",
            "The Boso Peninsula ferry connects to Kanagawa for a unique travel route"
        ],
        bestSeason: "September for the autumn festival, winter for clearest bay views",
        access: "10 min walk from JR Tateyama Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000470")!,
        name: "Soga Jinja",
        address: "1-6-16 Chuo, Chiba, Chiba",
        description: "One of Chiba City's oldest shrines, Soga Jinja has roots stretching back over 1,000 years and serves as a guardian of the city center. The shrine is named after the Soga brothers, legendary figures of loyalty and revenge in Japanese history. Its central location makes it a convenient stop amid Chiba City sightseeing, and the shrine grounds offer a welcome green respite from the urban surroundings.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6085, longitude: 140.1155),
        stampSlotId: 470,
        category: .jinja,
        tagline: "City-center shrine honoring the legendary Soga brothers",
        highlights: [
            "One of Chiba City's oldest shrines — over 1,000 years",
            "Named after the legendary Soga brothers of loyalty fame",
            "Central location in the heart of Chiba City",
            "Green oasis providing respite from urban surroundings"
        ],
        mustSee: "Learn the tale of the Soga brothers — two young men who spent years plotting to avenge their father's murder, ultimately succeeding in one of Japan's most famous acts of filial devotion. Their story has inspired kabuki, noh, and literature for centuries.",
        tips: [
            "Central Chiba location — easy to combine with city sightseeing",
            "Chiba Jinja is also nearby for a shrine-pairing walk",
            "The Chiba monorail offers interesting elevated views of the city",
            "Port area and Makuhari are accessible for a varied Chiba day"
        ],
        bestSeason: "Year-round",
        access: "10 min walk from JR Chiba Station east exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- More Tokyo ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000471")!,
        name: "Komagome Fuji Jinja",
        address: "5-7-20 Honkomagome, Bunkyo, Tokyo",
        description: "Home to one of Tokyo's best-preserved Fuji-zuka — miniature replicas of Mount Fuji built from volcanic rock for those who could not make the real pilgrimage. The Komagome Fuji-zuka, built in 1862, stands about 5 meters tall and is designated a national tangible folk cultural property. Its annual Fuji climbing festival in late June/early July allows visitors to 'climb Fuji' in the heart of Bunkyo ward.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7314, longitude: 139.7455),
        stampSlotId: 471,
        category: .jinja,
        tagline: "Climb a miniature Mount Fuji in the heart of Bunkyo",
        highlights: [
            "One of Tokyo's best-preserved Fuji-zuka (miniature Fuji replicas)",
            "Built in 1862 from volcanic rock — designated cultural property",
            "Annual Fuji climbing festival in late June/early July",
            "5-meter-tall replica with stations mirroring the real mountain"
        ],
        mustSee: "During the annual Fuji opening festival (late June-early July), climb the miniature Mount Fuji — complete with numbered stations mirroring the real mountain. The tradition dates to the Edo period when Fuji-ko (Fuji worship groups) built these replicas so urban residents could experience the sacred climb without the arduous journey.",
        tips: [
            "The Fuji-zuka is usually roped off except during the festival — check dates",
            "Rikugien Garden is a short walk away — combine for a cultural half-day",
            "The surrounding Honkomagome area has a quiet residential charm",
            "A fascinating example of Edo-period urban religious creativity"
        ],
        bestSeason: "Late June–early July for the Fuji climbing festival (essential)",
        access: "5 min walk from JR/Namboku Line Komagome Station",
        hours: "Open 24 hours (Fuji-zuka open only during festival period)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000472")!,
        name: "Konnoh Hachimangu",
        address: "3-5-12 Shibuya, Shibuya, Tokyo",
        description: "This Hachimangu shrine in central Shibuya was founded by the warrior Minamoto no Yoshiie and took its name from the golden-armored warrior Konnoh Saemon Yoshihide. The shrine's spacious grounds — with their towering zelkova trees and koi pond — feel remarkably tranquil just steps from the Shibuya Hikarie building. A spring water well on the grounds is said to have healing properties.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6598, longitude: 139.7067),
        stampSlotId: 472,
        category: .hachimangu,
        tagline: "Golden warrior shrine with healing waters steps from Shibuya scramble",
        highlights: [
            "Founded by legendary warrior Minamoto no Yoshiie",
            "Named after the golden-armored warrior Konnoh Yoshihide",
            "Healing spring water well within the grounds",
            "Tranquil zelkova grove steps from Shibuya Hikarie"
        ],
        mustSee: "Find the healing spring water well and take a drink. Then appreciate the surreal contrast — towering zelkova trees and the sound of water in a 900-year-old shrine, while the lights and sounds of Shibuya's commercial district pulse just beyond the stone walls.",
        tips: [
            "Less than 5 minutes from Shibuya Station — easy to fit into any itinerary",
            "The koi pond is small but photogenic with reflections of the trees",
            "Golden warrior ema (prayer tablets) make unique souvenirs",
            "The autumn zelkova colors are lovely but brief"
        ],
        bestSeason: "Year-round; autumn for zelkova foliage",
        access: "3 min walk from JR Shibuya Station east exit or Shibuya Hikarie",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000473")!,
        name: "Teppōzu Inari Jinja",
        address: "1-6-7 Minato, Chuo, Tokyo",
        description: "A waterfront Inari shrine in the Tsukishima-Minato area of Chuo ward, Teppōzu Inari has been the guardian of this reclaimed-land neighborhood since the Edo period. Its name derives from 'teppōzu' (gun sandbar) — this area was originally a sandbar used for firearms practice. The shrine's beautifully maintained grounds and elaborate torii create a surprisingly grand impression in this compact bayside neighborhood.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6619, longitude: 139.7780),
        stampSlotId: 473,
        category: .inari,
        tagline: "Inari shrine on a former gun-practice sandbar by Tokyo Bay",
        highlights: [
            "Guardian of the waterfront Teppōzu neighborhood since the Edo period",
            "Name derives from 'gun sandbar' — historic firearms practice ground",
            "Beautifully maintained grounds with elaborate torii gates",
            "Grand presence in a compact bayside neighborhood"
        ],
        mustSee: "Appreciate the layers of Tokyo Bay history — this ground was once a sandbar in open water, then a firearms range, then reclaimed land, and now a thriving neighborhood. The Inari shrine has watched over each transformation, adapting its protective role to serve each era's community.",
        tips: [
            "Tsukishima's famous monjayaki restaurants are a short walk away",
            "The Sumida River terrace walk passes nearby — lovely for strolling",
            "The shrine's fox (kitsune) statues are well-crafted and photogenic",
            "Combine with Tsukiji Honganji for a Chuo-ward spiritual walk"
        ],
        bestSeason: "Year-round; summer for bayside breeze",
        access: "5 min walk from Tokyo Metro Tsukishima Station (Yurakucho/Oedo Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000474")!,
        name: "Ome Jinja",
        address: "1081 Ome, Ome, Tokyo",
        description: "The principal shrine of Ome City in western Tokyo, perched on a hillside above the picturesque Tama River valley. Ome — meaning 'blue plum' — takes its name from a legendary plum tree at this shrine whose fruit never ripened, remaining eternally green. The shrine commands views over the Ome gorge, and the surrounding area preserves an atmosphere of mountain-town Japan unusual within Tokyo Prefecture.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7877, longitude: 139.2600),
        stampSlotId: 474,
        category: .jinja,
        tagline: "The shrine of the eternal green plum above the Tama River gorge",
        highlights: [
            "Legendary plum tree whose fruit never ripened — gave Ome its name",
            "Hillside position above the scenic Tama River gorge",
            "Mountain-town atmosphere unusual within Tokyo Prefecture",
            "Principal shrine of Ome City with ancient origins"
        ],
        mustSee: "Seek out the legendary ume (plum) tree — or its descendant — whose fruit stayed perpetually green (ao-ume, 'blue plum'), giving the city its poetic name. The story connects to Prince Heizei, adding layers of imperial legend to this mountain shrine.",
        tips: [
            "Ome retains charming retro movie signboards along the old streets",
            "The Tama River is excellent for hiking and kayaking",
            "Combine with Musashi Mitake Jinja for a western Tokyo spiritual journey",
            "Ome's plum blossom festival (February-March) celebrates the name legend"
        ],
        bestSeason: "February-March for plum blossoms, autumn for Tama River gorge foliage",
        access: "10 min walk from JR Ome Line Ome Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000475")!,
        name: "Hikawa Jinja Kita",
        address: "5-2-2 Akabane-Nishi, Kita, Tokyo",
        description: "One of the lesser-known Hikawa shrines in Tokyo's northern Kita ward, this shrine is the spiritual guardian of the Akabane district — a neighborhood famous for its izakaya-lined streets and working-class warmth. The shrine's forested grounds provide a calm counterpoint to the lively drinking district just outside its gates, creating a wonderful sacred-profane contrast.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7794, longitude: 139.7205),
        stampSlotId: 475,
        category: .jinja,
        tagline: "Forest shrine guarding Akabane's beloved izakaya district",
        highlights: [
            "Guardian shrine of Akabane — Tokyo's favorite drinking district",
            "Forested grounds contrasting with the lively streets outside",
            "Hikawa shrine lineage connected to Musashino spiritual network",
            "Genuine community shrine with warm neighborhood character"
        ],
        mustSee: "Experience the contrast: step from the shrine's quiet, forested grounds directly into Akabane's buzzing izakaya streets. The transition from sacred silence to cheerful tavern energy happens in about 30 seconds, perfectly encapsulating the Japanese ability to hold reverence and revelry side by side.",
        tips: [
            "Visit the shrine first, then reward yourself in Akabane's izakaya alleys",
            "Akabane is famous for having Tokyo's best value-for-money drinking streets",
            "The Arakawa Nature Park is nearby for a riverside walk",
            "JR Akabane Station is a major junction — easy to reach from anywhere"
        ],
        bestSeason: "Year-round; evening for the izakaya contrast experience",
        access: "5 min walk from JR Akabane Station west exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- More Ibaraki ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000476")!,
        name: "Tokiwa Jinja Mito",
        address: "1-3-1 Tokiwacho, Mito, Ibaraki",
        description: "Enshrining Tokugawa Mitsukuni — the legendary 'Mito Komon' who traveled Japan dispensing justice in popular folklore — Tokiwa Jinja sits in the grounds of the former Mito Castle. Mitsukuni is one of the most beloved figures in Japanese popular culture, thanks to the long-running TV drama depicting his travels with his faithful retainers. The shrine draws fans of the legend alongside history enthusiasts.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3700, longitude: 140.4710),
        stampSlotId: 476,
        category: .jinja,
        tagline: "Shrine of Mito Komon — Japan's most beloved traveling judge",
        highlights: [
            "Enshrines Tokugawa Mitsukuni — the legendary Mito Komon",
            "Located in the grounds of former Mito Castle",
            "Connection to one of Japan's longest-running TV dramas",
            "Historical pilgrimage for fans of Mito Komon's justice tales"
        ],
        mustSee: "Pay respects to Tokugawa Mitsukuni, whose legend as 'Mito Komon' — traveling incognito to right wrongs and punish corruption — has made him arguably the most popular historical figure in Japanese television. The famous line 'Kono mon-dokoro ga me ni hairanu ka!' (Can you not see this crest!) echoes through every Japanese home.",
        tips: [
            "The statue of Mitsukuni nearby is a popular photo spot",
            "Combine with Mito Toshogu and Kairakuen for a full Mito day",
            "Mito natto is a must-try — the city is Japan's natto capital",
            "The castle grounds offer pleasant walking paths"
        ],
        bestSeason: "February-March for Kairakuen plum blossoms, year-round",
        access: "15 min walk from JR Mito Station north exit",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- More Tochigi ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000477")!,
        name: "Taiheizan Jinja",
        address: "16-48 Otemachi, Tochigi, Tochigi",
        description: "The principal shrine of Tochigi City, a beautifully preserved Edo-period merchant town known as 'Little Edo.' The shrine sits amid the town's historic district, where kurazukuri warehouses line a scenic canal. The combination of shrine visit, canal walk, and preserved merchant architecture makes Tochigi City an underappreciated gem of North Kanto cultural tourism.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3831, longitude: 139.7275),
        stampSlotId: 477,
        category: .jinja,
        tagline: "Shrine guardian of Little Edo's canal-side warehouses",
        highlights: [
            "Principal shrine of Tochigi City — 'Little Edo' of North Kanto",
            "Surrounded by Edo-period kurazukuri warehouses",
            "Scenic canal-side historic district walking route",
            "Underappreciated gem of North Kanto cultural tourism"
        ],
        mustSee: "After visiting the shrine, walk along the Uzuma River canal lined with white-walled warehouses. Boat tours glide beneath willow-draped bridges, creating scenes that rival the more famous canal towns. Tochigi City deserves far more attention than it receives.",
        tips: [
            "Take a canal boat ride — available spring through autumn",
            "The kurazukuri warehouses now house cafés, galleries, and shops",
            "Much less crowded than Kawagoe despite similar charm",
            "Accessible from Tobu Nikko Line Shin-Tochigi Station"
        ],
        bestSeason: "Spring for cherry blossoms along the canal, autumn for festival",
        access: "15 min walk from Tobu/JR Tochigi Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- More Gunma ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000478")!,
        name: "Tomioka Suwa Jinja",
        address: "6-1 Tomioka, Tomioka, Gunma",
        description: "The guardian shrine of Tomioka, the city that launched Japan's industrial revolution with its pioneering silk mill — now a UNESCO World Heritage Site. The shrine has blessed the silk workers and the city's fortunes since well before the mill's establishment in 1872. The December Tomioka Silk Festival fills the shrine and surrounding streets with celebrations of the city's industrial heritage.",
        coordinate: CLLocationCoordinate2D(latitude: 36.2582, longitude: 138.8906),
        stampSlotId: 478,
        category: .jinja,
        tagline: "Guardian shrine of the city that launched Japan's industrial revolution",
        highlights: [
            "Guardian of Tomioka — home to Japan's first modern silk mill (UNESCO)",
            "Blessed silk workers since before the 1872 mill establishment",
            "December Silk Festival celebrating the city's industrial heritage",
            "Connection to Japan's Meiji-era modernization story"
        ],
        mustSee: "Visit the shrine then walk to the UNESCO-listed Tomioka Silk Mill. Together they tell the story of a city that bridged traditional faith and revolutionary industry — the shrine blessed the workers who powered Japan's transformation from feudal society to industrial power.",
        tips: [
            "The Tomioka Silk Mill UNESCO site is the main attraction — don't miss it",
            "Silk-related souvenirs are the specialty of the area",
            "The December festival is lively with illuminations",
            "Accessible from Joshin Dentetsu Railway Joshu-Tomioka Station"
        ],
        bestSeason: "December for the Silk Festival, year-round for UNESCO site",
        access: "10 min walk from Joshin Dentetsu Joshu-Tomioka Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),

    // --- Yamanashi/Shizuoka ---

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000479")!,
        name: "Shosenkyo Kakuenbo",
        address: "Mitake-cho Goshikida, Kofu, Yamanashi",
        description: "Deep within the Shosenkyo Gorge — one of Japan's most spectacular river gorges — Kakuenbo is a tiny temple perched beside thundering waterfalls and towering granite cliffs. The gorge's name means 'Place of Crystal Rising,' and the setting lives up to it: massive rock formations, emerald pools, and autumn foliage that ranks among the finest in Japan. The temple provides a spiritual anchor in this overwhelming natural cathedral.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7500, longitude: 138.5600),
        stampSlotId: 479,
        category: .tera,
        tagline: "Temple in a crystal gorge — waterfalls, granite cliffs, and blazing autumn color",
        highlights: [
            "Set within Shosenkyo Gorge — one of Japan's most spectacular gorges",
            "Thundering waterfalls and towering granite cliff formations",
            "Autumn foliage ranked among the finest in all of Japan",
            "Spiritual anchor in an overwhelming natural cathedral"
        ],
        mustSee: "Walk the gorge trail to the Senga Falls viewpoint. The falls plummet 30 meters between massive granite pillars, and the mist catches rainbow light on sunny days. In autumn, the surrounding cliffs blaze with red and gold maples against grey granite — a scene of almost painful beauty.",
        tips: [
            "Autumn foliage peak is late October to mid-November",
            "The gorge trail is well-maintained but involves stairs and uneven ground",
            "A ropeway at the gorge's upper end offers panoramic views",
            "Bus from Kofu Station runs seasonally — check schedule"
        ],
        bestSeason: "Late October–mid-November for autumn foliage (essential)",
        access: "Bus from JR Kofu Station to Shosenkyo, about 30 min (seasonal schedule)",
        hours: "Daylight hours (gorge trail open year-round, conditions permitting)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000007-0000-0000-0000-000000000480")!,
        name: "Izusan Jinja",
        address: "170-1 Izusan, Atami, Shizuoka",
        description: "Perched high on a hillside above the hot-spring resort city of Atami, Izusan Jinja was where Minamoto no Yoritomo and his beloved wife Hojo Masako secretly courted — making it one of Japan's premier en-musubi (matchmaking) power spots. The approach involves climbing 837 stone steps from the coast (or descending from above), and the red-and-white striped 'Akashiro no Ryujin' dragon deity is unique to this shrine.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1147, longitude: 139.0764),
        stampSlotId: 480,
        category: .jinja,
        tagline: "Where Yoritomo and Masako fell in love — 837 steps of matchmaking power",
        highlights: [
            "Secret courting spot of Yoritomo and Hojo Masako — premier en-musubi shrine",
            "837 stone steps from the coast creating a dramatic ascent",
            "Unique red-and-white striped dragon deity (Akashiro no Ryujin)",
            "Panoramic views over Sagami Bay and Atami's coastline"
        ],
        mustSee: "Climb the 837 stone steps for the full spiritual experience — or take the shortcut from above. At the top, visit the spot where Yoritomo and Masako met in secret, defying their families. Their love story, which changed the course of Japanese history, gives the en-musubi blessings here extraordinary romantic weight.",
        tips: [
            "Most visitors enter from the top (bus or car) and walk down the steps",
            "The en-musubi amulets are beautiful and popular with couples",
            "Atami's onsen and seafood make this a perfect romantic day trip",
            "The MOA Museum of Art nearby houses National Treasure artworks"
        ],
        bestSeason: "Year-round; January for Atami's early-blooming cherry blossoms",
        access: "Bus from JR Atami Station to Izusan Jinja, about 7 min, or walk 837 steps from the coast",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
]
