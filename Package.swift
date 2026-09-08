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

        .library(name: "Sector Foundation Integration", targets: ["Sector Foundation Integration"]),
        .library(name: "Sector Test Support", targets: ["Sector Test Support"]),
    ],
    dependencies: [

        .package(url: "https://github.com/swift-atoms/swift-equation.git", branch: "main"),

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
            name: "Sector Foundation Integration",
            dependencies: [
                .target(name: "Sector"),
            ],
            path: "Sources/Sector Foundation Integration"
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
                .target(name: "Sector Foundation Integration"),
            ],
            path: "Tests/Sector Tests"
        ),
        .testTarget(
            name: "Consolidated Sector Comparison Tests",
            dependencies: [

                .target(name: "Sector"),
                .product(name: "Comparison", package: "swift-comparison"),
            ],
            path: "Tests/Consolidated swift-sector-comparison"
        ),
        .testTarget(
            name: "Consolidated Sector Equation Tests",
            dependencies: [

                .target(name: "Sector"),
                .product(name: "Equation", package: "swift-equation"),
            ],
            path: "Tests/Consolidated swift-sector-equation"
        ),
        .testTarget(
            name: "Consolidated Sector Hash Tests",
            dependencies: [

                .target(name: "Sector"),
                .product(name: "Hash", package: "swift-hash"),
            ],
            path: "Tests/Consolidated swift-sector-hash"
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
