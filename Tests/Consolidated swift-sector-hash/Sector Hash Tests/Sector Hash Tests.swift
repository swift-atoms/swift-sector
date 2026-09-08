import Hash
import Sector
import Testing

@Suite
struct `Sector Hash Tests` {

    @Test
    func `Quadrant is natively hashable through the seam`() {
        let values: Set<Sector.Quadrant> = [.I, .II, .I]

        #expect(values.count == 2)
    }

    @Test
    func `Quadrant supplies Hash's domain-typed value`() {
        let first: Hash.Value = hash(Sector.Quadrant.I)
        let second: Hash.Value = hash(Sector.Quadrant.I)

        #expect(first == second)
    }

    @Test
    func `Octant is natively hashable through the seam`() {
        let values: Set<Sector.Octant> = [.ppp, .nnn, .ppp]

        #expect(values.count == 2)
    }

    @Test
    func `Octant supplies Hash's domain-typed value`() {
        let first: Hash.Value = hash(Sector.Octant.ppp)
        let second: Hash.Value = hash(Sector.Octant.ppp)

        #expect(first == second)
    }
}

private func hash<T: Hash.`Protocol`>(_ value: borrowing T) -> Hash.Value {
    value.hashValue
}
