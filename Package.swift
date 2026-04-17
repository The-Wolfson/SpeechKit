// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var packageDependencies: [Package.Dependency] = []
var targetDependencies = [PackageDescription.Target.Dependency]()
var testDependencies = [PackageDescription.Target.Dependency]()

let package = Package(
    name: "SpeechKit",
    platforms: [.iOS(.v16), .macCatalyst(.v14), .macOS(.v14), .tvOS(.v16), .visionOS(.v1), .watchOS(.v9)],
    products: [
        .library(
            name: "SpeechKit",
            targets: ["SpeechKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/espeak-ng/espeak-ng-spm.git", branch: "master"),
        .package(url: "https://github.com/swiftwasm/JavaScriptKit.git", from: "0.50.0"),
        .package(url: "https://github.com/swiftlang/swift-java.git", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "SpeechKit",
            dependencies: [
                .product(name: "SwiftJava", package: "swift-java", condition: .when(platforms: [.android])),
                .product(name: "JavaScriptKit", package: "JavaScriptKit", condition: .when(platforms: [.wasi])),
                .product(name: "libespeak-ng", package: "espeak-ng-spm", condition: .when(platforms: [.linux])),
                .product(name: "espeak-ng-data", package: "espeak-ng-spm", condition: .when(platforms: [.linux])),
            ]
        ),
        .testTarget(
            name: "SpeechKitTests",
            dependencies: ["SpeechKit", .product(name: "JavaScriptEventLoopTestSupport", package: "JavaScriptKit", condition: .when(platforms: [.wasi]))]
        ),
    ],
    swiftLanguageModes: [.v6]
)
