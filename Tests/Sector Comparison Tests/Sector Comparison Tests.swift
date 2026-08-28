import Sector_Comparison
import Testing

@Suite
struct `Sector Comparison Tests` {
    @Test
    func `sectors retain rank ordering`() {
        #expect(Sector.Quadrant.I < .II)
        #expect(Sector.Octant.allCases.sorted() == Sector.Octant.allCases)
    }
}
