#if Cyclic
import Sector
import Testing

extension Sector.Quadrant {
    @Suite struct `Cyclic Test` {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
        @Suite struct Integration {}
    }
}

extension Sector.Quadrant.`Cyclic Test`.Unit {
    @Test
    func `projection round-trips`() {
        for quadrant in Sector.Quadrant.allCases {
            #expect(Sector.Quadrant(cyclic: quadrant.cyclic) == quadrant)
        }
    }

    @Test
    func `plus one rotates counter-clockwise`() {
        #expect(Sector.Quadrant(cyclic: Sector.Quadrant.I.cyclic + .one) == .II)
        #expect(Sector.Quadrant(cyclic: Sector.Quadrant.IV.cyclic + .one) == .I)
    }
}
#endif
