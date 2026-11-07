import Sector
import Testing

enum `Sector Comparison Tests` {}

extension `Sector Comparison Tests` {
    @Suite
    struct `Sector octants compare according to their rank` {
        @Test
        func `sectors retain rank ordering`() {
            #expect(Sector.Quadrant.I < .II)
            #expect(Sector.Octant.allCases.sorted() == Sector.Octant.allCases)
        }
    }
}
