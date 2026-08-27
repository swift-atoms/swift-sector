import Sector
import Sector_Standard_Library_Integration
import Testing

extension Sector.Quadrant {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
        @Suite struct Integration {}
    }
}

extension Sector.Quadrant.Test.Unit {
    @Test
    func `opposite is the diagonal`() {
        #expect(Sector.Quadrant.I.opposite == .III)
        #expect(Sector.Quadrant.II.opposite == .IV)
        for q in Sector.Quadrant.allCases { #expect(q.opposite.opposite == q) }
    }

    @Test
    func `allCases and ordering`() {
        #expect(Sector.Quadrant.allCases == [.I, .II, .III, .IV])
        #expect(Sector.Quadrant.I < .II)
        let set: Set<Sector.Quadrant> = [.I, .II, .III, .IV, .I]
        #expect(set.count == 4)
    }
}

extension Sector.Octant {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
        @Suite struct Integration {}
    }
}

extension Sector.Octant.Test.Unit {
    @Test
    func `opposite flips all three signs`() {
        #expect(Sector.Octant.ppp.opposite == .nnn)
        #expect(Sector.Octant.ppn.opposite == .nnp)
        #expect(Sector.Octant.pnp.opposite == .npn)
        for o in Sector.Octant.allCases { #expect(o.opposite.opposite == o) }
    }

    @Test
    func `allCases has eight octants in sign-triple order`() {
        #expect(Sector.Octant.allCases == [.ppp, .ppn, .pnp, .pnn, .npp, .npn, .nnp, .nnn])
    }

    @Test
    func `Hashable distinguishes all eight`() {
        let set = Set(Sector.Octant.allCases)
        #expect(set.count == 8)
    }

    @Test
    func `Comparison orders by sign triple`() {
        #expect(Sector.Octant.ppp < .nnn)
    }
}
