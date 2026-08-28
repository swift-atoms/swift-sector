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
    extension Sector.Quadrant: Codable {}
#endif
