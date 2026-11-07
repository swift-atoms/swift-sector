import Sector
import Testing

enum `Sector Hash Tests` {}

extension `Sector Hash Tests` {
    @Suite
    struct `Sector octants remain distinct in sets` {
        @Test
        func `all octants are distinct set elements`() {
            #expect(Set(Sector.Octant.allCases).count == 8)
        }
    }
}
