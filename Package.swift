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
        .library(name: "Sector", targets: ["Sector"]),
        .library(name: "Sector Hash", targets: ["Sector Hash"]),
        .library(name: "Sector Comparison", targets: ["Sector Comparison"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-comparison.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(name: "Sector", dependencies: []),
        .target(
            name: "Sector Hash",
            dependencies: [
                .target(name: "Sector"),
                .product(name: "Hash Protocol", package: "swift-hash"),
            ]
        ),
        .target(
            name: "Sector Comparison",
            dependencies: [
                .target(name: "Sector"),
                .product(name: "Comparison Protocol", package: "swift-comparison"),
            ]
        ),
        .testTarget(
            name: "Sector Tests",
            dependencies: [.target(name: "Sector")]
        ),
        .testTarget(
            name: "Sector Hash Tests",
            dependencies: [.target(name: "Sector Hash")]
        ),
        .testTarget(
            name: "Sector Comparison Tests",
            dependencies: [.target(name: "Sector Comparison")]
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
