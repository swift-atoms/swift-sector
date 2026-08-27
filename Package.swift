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
        .library(
            name: "Sector Standard Library Integration",
            targets: ["Sector Standard Library Integration"]
        ),
        .library(
            name: "Sector Apple Foundation Integration",
            targets: ["Sector Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Sector",
            dependencies: []
        ),
        .target(
            name: "Sector Standard Library Integration",
            dependencies: ["Sector"]
        ),
        .target(
            name: "Sector Apple Foundation Integration",
            dependencies: [
                "Sector",
                "Sector Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Sector Tests",
            dependencies: [
                "Sector",
                "Sector Standard Library Integration",
            ]
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
