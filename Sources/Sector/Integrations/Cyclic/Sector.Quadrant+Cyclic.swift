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
