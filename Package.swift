// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "RuleKit",
    platforms: [
        .macOS(.v10_14), .iOS(.v12), .tvOS(.v12)
    ],
    products: [
        .library(name: "RuleKit", targets: ["RuleKit"]),
    ],
    dependencies: [],
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
