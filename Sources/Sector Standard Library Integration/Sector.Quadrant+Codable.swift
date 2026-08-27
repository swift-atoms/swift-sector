public import Sector

#if !hasFeature(Embedded)
    extension Sector.Quadrant: Codable {
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rank = try container.decode(Int.self)
            switch rank {
            case 0: self = .I
            case 1: self = .II
            case 2: self = .III
            case 3: self = .IV
            default:
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Sector.Quadrant rank \(rank)"
                )
            }
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            let rank: Int
            switch self {
            case .I: rank = 0
            case .II: rank = 1
            case .III: rank = 2
            case .IV: rank = 3
            }
            try container.encode(rank)
        }
    }
#endif
