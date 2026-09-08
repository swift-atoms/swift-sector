import Comparison
import Sector
import Testing

@Suite
struct `Sector Comparison Tests` {

    private func precedes<Value: Comparison.`Protocol`>(_ lhs: Value, _ rhs: Value) -> Bool {
        lhs < rhs
    }

    @Test
    func `quadrant satisfies comparison protocol`() {
        #expect(precedes(Sector.Quadrant.I, .II))
        #expect(!precedes(Sector.Quadrant.IV, .III))
    }

    @Test
    func `octant satisfies comparison protocol`() {
        #expect(precedes(Sector.Octant.ppp, .ppn))
        #expect(!precedes(Sector.Octant.nnn, .nnp))
    }
}
