import Foundation

// MARK: - Cardmodel
struct Cardmodel: Codable {
    let data: [Datum]
    let page, pageSize, count, totalCount: Int
}

// MARK: - Datum
struct Datum: Codable, Identifiable {
    let id: String
    let name : String?
    let supertype: String?
    let subtypes: [String]?
    let hp: String?
    let types: [String]?
    let evolvesFrom: String?
    let attacks: [Attack]?
   // let weaknesses :[String]?
    //   let  resistances: [String]?
    let retreatCost: [String]?
    let convertedRetreatCost: Int?
    let dataSet: Set?
    let number, artist, rarity, flavorText: String?
    let nationalPokedexNumbers: [Int]?
  //  let legalities: String?
    let images: DataImages?
    let tcgplayer: Tcgplayer?
  //  let cardmarket: String?
}

// MARK: - Attack
struct Attack: Codable {
    let name: String
    let cost: [String]
    let convertedEnergyCost: Int
    let damage, text: String
}

// MARK: - Cardmarket
struct Cardmarket: Codable {
    let url: String
    let updatedAt: String
    let prices: [String: Double]
}

// MARK: - Set
struct Set: Codable {
    let id: String?
        
       let  name, series: String
    let printedTotal, total: Int
    let legalities: Legalities
    let ptcgoCode, releaseDate, updatedAt: String
    let images: SetImages
}

// MARK: - SetImages
struct SetImages: Codable {
    let symbol, logo: String
}

// MARK: - Legalities
struct Legalities: Codable {
    let unlimited: String
}

// MARK: - DataImages
struct DataImages: Codable {
    let small, large: String
}

// MARK: - Resistance
struct Resistance: Codable {
    let type, value: String
}

// MARK: - Tcgplayer
struct Tcgplayer: Codable {
    let url: String?
    let updatedAt: String?
    let prices: Prices?
}

// MARK: - Prices
struct Prices: Codable {
    let holofoil: Holofoil?
 //let reverseHolofoil: Holofoil
}

// MARK: - Holofoil
struct Holofoil: Codable {
    let low, mid, high, market: Double
   // let directLow: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}

