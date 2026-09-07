import Sector
import Testing

@Suite
struct `Sector Hash Tests` {
    @Test
    func `all octants are distinct set elements`() {
        #expect(Set(Sector.Octant.allCases).count == 8)
    }
}
