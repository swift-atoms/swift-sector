public import Sector

#if !hasFeature(Embedded)
    extension Sector.Octant: Codable {
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rank = try container.decode(Int.self)
            switch rank {
            case 0: self = .ppp
            case 1: self = .ppn
            case 2: self = .pnp
            case 3: self = .pnn
            case 4: self = .npp
            case 5: self = .npn
            case 6: self = .nnp
            case 7: self = .nnn
            default:
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Sector.Octant rank \(rank)"
                )
            }
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            let rank: Int
            switch self {
            case .ppp: rank = 0
            case .ppn: rank = 1
            case .pnp: rank = 2
            case .pnn: rank = 3
            case .npp: rank = 4
            case .npn: rank = 5
            case .nnp: rank = 6
            case .nnn: rank = 7
            }
            try container.encode(rank)
        }
    }
#endif
