# Sector

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Sign-orthant subdivisions of space for Swift — `Sector.Quadrant` (the four quadrants of the plane) and `Sector.Octant` (the eight octants of 3-space), as Foundation-free value types.

---

## Quick Start

`Sector` is a vocabulary for "which signed region of space": the four plane quadrants in standard mathematical numbering, and the eight octants of 3-space named by their sign triple. The cases carry the geometry — no coordinates, no arithmetic — so the same value travels unchanged through every layer that reasons about orientation.

```swift
import Sector

// The plane's four quadrants, in standard counter-clockwise numbering.
Sector.Quadrant.I.opposite          // .III  (diagonally opposite)
Sector.Quadrant.allCases            // [.I, .II, .III, .IV]
Sector.Quadrant.I < .II             // true  (ordered by quadrant number)

// The eight octants of 3-space, named by sign triple (p = +, n = −).
Sector.Octant.ppp.opposite          // .nnn  (all three signs flipped)
Sector.Octant.allCases.count        // 8
Set(Sector.Octant.allCases).count   // 8     (Hashable)
```

A plane quadrant is a *region* of space — deliberately distinct from `Boundary.Corner`, a box vertex, even though both ride the `Orthant<2>` carrier. The lossless carrier projections (`.orthant`, `Quadrant.cyclic` over `Cyclic.Group.Static<4>`) live in the per-carrier bridge packages `swift-sector-orthant` and `swift-sector-cyclic`.

Both enums are `CaseIterable`, ordered (`<` by rank), `Hashable`, and `Codable` (outside Embedded).

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-sector.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Sector", package: "swift-sector"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Five library products. The root depends on nothing; the protocol-conformance targets each pair the root with one primitives protocol package; the umbrella re-exports them all.

| Product | Target | Purpose |
|---------|--------|---------|
| `Sector Primitive` | `Sources/Sector Primitive/` | The `Sector` namespace: `Sector.Quadrant` and `Sector.Octant` with `opposite`, rank ordering, hashing, and `Codable`. |
| `Sector Equation` | `Sources/Sector Equation/` | Conforms `Sector.Quadrant` / `Sector.Octant` to `Equation.Protocol`. |
| `Sector Hash` | `Sources/Sector Hash/` | Conforms `Sector.Quadrant` / `Sector.Octant` to `Hash.Protocol`. |
| `Sector Comparison` | `Sources/Sector Comparison/` | Conforms `Sector.Quadrant` / `Sector.Octant` to `Comparison.Protocol`. |
| `Sector` | `Sources/Sector/` | Umbrella re-exporting the root plus all three conformance targets. |
| `Sector Test Support` | `Tests/Support/` | Re-exports the umbrella for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
