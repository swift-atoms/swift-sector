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
    extension Sector.Octant: Codable {}
#endif
