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
        .library(name: "Sector Standard Library Integration", targets: ["Sector Standard Library Integration"]),
        .library(name: "Sector Foundation Library Integration", targets: ["Sector Foundation Library Integration"]),
        .library(name: "Sector Test Support", targets: ["Sector Test Support"]),
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
        .target(
            name: "Sector",
            dependencies: [
                .product(name: "Hash", package: "swift-hash"),
                .product(name: "Comparison", package: "swift-comparison"),
            ],
            path: "Sources/Sector"
        ),
        .target(
            name: "Sector Standard Library Integration",
            dependencies: [
                .target(name: "Sector"),
            ],
            path: "Sources/Sector Standard Library Integration"
        ),
        .target(
            name: "Sector Foundation Library Integration",
            dependencies: [
                .target(name: "Sector"),
                .target(name: "Sector Standard Library Integration"),
            ],
            path: "Sources/Sector Foundation Library Integration"
        ),
        .target(
            name: "Sector Test Support",
            dependencies: [
                .target(name: "Sector"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Sector Tests",
            dependencies: [
                .target(name: "Sector"),
                .target(name: "Sector Test Support"),
                .target(name: "Sector Standard Library Integration"),
                .target(name: "Sector Foundation Library Integration"),
            ],
            path: "Tests/Sector Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
