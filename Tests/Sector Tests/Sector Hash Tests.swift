import Sector
import Testing

@Suite
struct `Sector octants remain distinct in sets` {
    @Test
    func `all octants are distinct set elements`() {
        #expect(Set(Sector.Octant.allCases).count == 8)
    }
}
