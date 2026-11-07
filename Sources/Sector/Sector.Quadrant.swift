extension Sector {

    public enum Quadrant: Sendable, CaseIterable {

        case I

        case II

        case III

        case IV
    }
}

extension Sector.Quadrant {

    @inlinable
    public var opposite: Sector.Quadrant {
        switch self {
        case .I: .III
        case .III: .I
        case .II: .IV
        case .IV: .II
        }
    }
}

extension Sector.Quadrant {
    @usableFromInline
    var _rank: Int {
        switch self {
        case .I: 0
        case .II: 1
        case .III: 2
        case .IV: 3
        }
    }

    @inlinable public static func == (lhs: Sector.Quadrant, rhs: Sector.Quadrant) -> Bool {
        lhs._rank == rhs._rank
    }

    @inlinable public static func < (lhs: Sector.Quadrant, rhs: Sector.Quadrant) -> Bool {
        lhs._rank < rhs._rank
    }

    @inlinable public static func <= (lhs: Sector.Quadrant, rhs: Sector.Quadrant) -> Bool {
        lhs._rank <= rhs._rank
    }

    @inlinable public static func > (lhs: Sector.Quadrant, rhs: Sector.Quadrant) -> Bool {
        lhs._rank > rhs._rank
    }

    @inlinable public static func >= (lhs: Sector.Quadrant, rhs: Sector.Quadrant) -> Bool {
        lhs._rank >= rhs._rank
    }

    @inlinable public func hash(into hasher: inout Hasher) { hasher.combine(_rank) }
}

#if !hasFeature(Embedded)
    extension Sector.Quadrant: Swift::Codable {}
#endif

#if Cyclic
    public import Cyclic
    public import Ordinal

    extension Sector.Quadrant {

        @inlinable
        public var cyclic: Cyclic.Group.Static<4>.Element {
            let rank: UInt =
                switch self {
                case .I: 0
                case .II: 1
                case .III: 2
                case .IV: 3
                }

            return Cyclic.Group.Static<4>.Element(wrapping: Ordinal(rank))
        }

        @inlinable
        public init(cyclic: Cyclic.Group.Static<4>.Element) {
            switch cyclic.position.rawValue {
            case 0: self = .I
            case 1: self = .II
            case 2: self = .III
            default: self = .IV
            }
        }
    }
#endif

#if Orthant
    public import Orthant

    extension Sector.Quadrant {

        @inlinable
        public var orthant: Orthant<2> {
            switch self {
            case .I: Orthant { _ in .positive }
            case .II: Orthant { $0 == 0 ? .negative : .positive }
            case .III: Orthant { _ in .negative }
            case .IV: Orthant { $0 == 0 ? .positive : .negative }
            }
        }

        @inlinable
        public init(orthant: Orthant<2>) {
            switch (orthant.directions[0], orthant.directions[1]) {
            case (.positive, .positive): self = .I
            case (.negative, .positive): self = .II
            case (.negative, .negative): self = .III
            default: self = .IV
            }
        }
    }
#endif
