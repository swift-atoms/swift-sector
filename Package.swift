// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-sector",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Sector Primitive", targets: ["Sector Primitive"]),
        .library(name: "Sector Equation", targets: ["Sector Equation"]),
        .library(name: "Sector Hash", targets: ["Sector Hash"]),
        .library(name: "Sector Comparison", targets: ["Sector Comparison"]),
        .library(name: "Sector", targets: ["Sector"]),
        .library(
            name: "Sector Test Support",
            targets: ["Sector Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-equation.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-comparison.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(name: "Sector Primitive", dependencies: []),
        .target(
            name: "Sector Equation",
            dependencies: [
                "Sector Primitive",
                .product(name: "Equation", package: "swift-equation"),
            ]
        ),
        .target(
            name: "Sector Hash",
            dependencies: [
                "Sector Primitive",
                .product(name: "Hash", package: "swift-hash"),
            ]
        ),
        .target(
            name: "Sector Comparison",
            dependencies: [
                "Sector Primitive",
                .product(name: "Comparison", package: "swift-comparison"),
            ]
        ),
        .target(
            name: "Sector",
            dependencies: [
                "Sector Primitive", "Sector Equation", "Sector Hash",
                "Sector Comparison",
            ]
        ),
        .target(
            name: "Sector Test Support",
            dependencies: ["Sector"],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Sector Tests",
            dependencies: ["Sector", "Sector Test Support"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
    let package: [SwiftSetting] = []
    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
