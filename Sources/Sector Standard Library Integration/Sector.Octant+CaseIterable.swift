public import Sector

extension Sector.Octant: CaseIterable {
    public static var allCases: [Sector.Octant] { [.ppp, .ppn, .pnp, .pnn, .npp, .npn, .nnp, .nnn] }
}
