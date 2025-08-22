// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "RuleKit",
    platforms: [
        .macOS(.v12), .iOS(.v15), .tvOS(.v15), .visionOS(.v1)
    ],
    products: [
        .library(name: "RuleKit", targets: ["RuleKit"]),
    ],
    targets: [
        .target(name: "RuleKit",
                dependencies: [],
                swiftSettings: [
                    .define("DEBUG", .when(configuration: .debug)),
                    .define("RELEASE", .when(configuration: .release)),
                    .define("SWIFT_PACKAGE")
                ]),
        .testTarget(name: "RuleKitTests", dependencies: ["RuleKit"]),
    ]
)
