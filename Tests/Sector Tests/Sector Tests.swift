import Sector
import Testing

@Suite
struct `Sector Tests` {
    @Test
    func `opposites are involutive`() {
        for quadrant in Sector.Quadrant.allCases {
            #expect(quadrant.opposite.opposite == quadrant)
        }
        for octant in Sector.Octant.allCases {
            #expect(octant.opposite.opposite == octant)
        }
    }
}
