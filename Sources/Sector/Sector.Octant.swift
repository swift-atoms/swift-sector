extension Sector {

    public enum Octant: Sendable, CaseIterable {

        case ppp

        case ppn

        case pnp

        case pnn

        case npp

        case npn

        case nnp

        case nnn
    }
}

extension Sector.Octant {

    @inlinable
    public var opposite: Sector.Octant {
        switch self {
        case .ppp: .nnn
        case .ppn: .nnp
        case .pnp: .npn
        case .pnn: .npp
        case .npp: .pnn
        case .npn: .pnp
        case .nnp: .ppn
        case .nnn: .ppp
        }
    }
}

extension Sector.Octant {
    @usableFromInline
    var _rank: Int {
        switch self {
        case .ppp: 0
        case .ppn: 1
        case .pnp: 2
        case .pnn: 3
        case .npp: 4
        case .npn: 5
        case .nnp: 6
        case .nnn: 7
        }
    }

    @inlinable public static func == (lhs: Sector.Octant, rhs: Sector.Octant) -> Bool {
        lhs._rank == rhs._rank
    }

    @inlinable public static func < (lhs: Sector.Octant, rhs: Sector.Octant) -> Bool {
        lhs._rank < rhs._rank
    }

    @inlinable public static func <= (lhs: Sector.Octant, rhs: Sector.Octant) -> Bool {
        lhs._rank <= rhs._rank
    }

    @inlinable public static func > (lhs: Sector.Octant, rhs: Sector.Octant) -> Bool {
        lhs._rank > rhs._rank
    }

    @inlinable public static func >= (lhs: Sector.Octant, rhs: Sector.Octant) -> Bool {
        lhs._rank >= rhs._rank
    }

    @inlinable public func hash(into hasher: inout Hasher) { hasher.combine(_rank) }
}

#if !hasFeature(Embedded)
    extension Sector.Octant: Swift::Codable {}
#endif

#if Orthant
    public import Orthant

    extension Sector.Octant {

        @inlinable
        public var orthant: Orthant<3> {
            let signs: (Direction, Direction, Direction) =
                switch self {
                case .ppp: (.positive, .positive, .positive)
                case .ppn: (.positive, .positive, .negative)
                case .pnp: (.positive, .negative, .positive)
                case .pnn: (.positive, .negative, .negative)
                case .npp: (.negative, .positive, .positive)
                case .npn: (.negative, .positive, .negative)
                case .nnp: (.negative, .negative, .positive)
                case .nnn: (.negative, .negative, .negative)
                }
            return Orthant { index in index == 0 ? signs.0 : (index == 1 ? signs.1 : signs.2) }
        }

        @inlinable
        public init(orthant: Orthant<3>) {
            let x = orthant.directions[0] == .positive
            let y = orthant.directions[1] == .positive
            let z = orthant.directions[2] == .positive
            switch (x, y, z) {
            case (true, true, true): self = .ppp
            case (true, true, false): self = .ppn
            case (true, false, true): self = .pnp
            case (true, false, false): self = .pnn
            case (false, true, true): self = .npp
            case (false, true, false): self = .npn
            case (false, false, true): self = .nnp
            default: self = .nnn
            }
        }
    }
#endif
