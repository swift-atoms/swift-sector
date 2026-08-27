public import Sector

extension Sector.Quadrant: CaseIterable {
    public static var allCases: [Sector.Quadrant] { [.I, .II, .III, .IV] }
}
