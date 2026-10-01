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
    traits: [
        .trait(name: "Cyclic", description: "Cyclic integration"),
        .trait(name: "Orthant", description: "Orthant integration"),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-ordinal.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-cyclic.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-orthant.git", branch: "main"),


    ],
    targets: [
        .testTarget(name: "Sector Cyclic Tests", dependencies: [
                .target(name: "Sector"),
                .product(name: "Cyclic", package: "swift-cyclic", condition: .when(traits: ["Cyclic"]))
            ], path: "Tests/Sector Cyclic Tests"),
        .target(
            name: "Sector",
            dependencies: [
                .product(name: "Ordinal", package: "swift-ordinal", condition: .when(traits: ["Cyclic"])),
                .product(name: "Cyclic", package: "swift-cyclic", condition: .when(traits: ["Cyclic"])),
                .product(name: "Orthant", package: "swift-orthant", condition: .when(traits: ["Orthant"])),

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
            name: "Sector Orthant Tests",
            dependencies: [
                .target(name: "Sector"),
                .product(name: "Orthant", package: "swift-orthant", condition: .when(traits: ["Orthant"])),
            ],
            path: "Tests/Sector Orthant Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
