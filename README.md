# swift-sector

Use this package when you need to name one of the four regions of the plane or eight regions of space cut out by the coordinate axes, as a closed enumeration you can switch over, order and store. Start from `Sector.Quadrant` (2D) or `Sector.Octant` (3D). When the dimension is a parameter rather than fixed at 2 or 3, use `Orthant<N>` from swift-orthant instead; the `Orthant` trait converts between the two, and the `Cyclic` trait views a quadrant as an element of `Cyclic.Group.Static<4>`.

## Laws

- `opposite` is an involution: applying it twice returns the original sector. A quadrant's opposite is the diagonal one (`I`↔`III`, `II`↔`IV`); an octant's opposite flips every sign.
- Quadrants follow the mathematical convention, numbered counter-clockwise from the all-positive one: `I` is (+, +), `II` is (−, +), `III` is (−, −), `IV` is (+, −).
- An octant's case name spells the signs of axes 0, 1 and 2 in order, `p` for positive and `n` for negative.
- Ordering, equality and hashing follow declaration order: `I` < `II` < `III` < `IV`, and `ppp` < `ppn` < … < `nnn`, so `allCases` is already sorted.
- With `Orthant`, `orthant` and `init(orthant:)` are inverse bijections, and `opposite` commutes with them.
- With `Cyclic`, `cyclic` maps `I`…`IV` to 0…3 and `init(cyclic:)` inverts it, so adding one in the group rotates a quadrant counter-clockwise, wrapping `IV` to `I`.
