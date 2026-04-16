// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var packageDependencies: [Package.Dependency] = []
var targetDependencies = [PackageDescription.Target.Dependency]()
var testDependencies = [PackageDescription.Target.Dependency]()

//#if canImport(AVFoundation)
//
//#elseif os(Linux)
packageDependencies = [.package(url: "https://github.com/espeak-ng/espeak-ng-spm.git", branch: "master"),]
targetDependencies = [
    .product(name: "libespeak-ng", package: "espeak-ng-spm"),
    .product(name: "espeak-ng-data", package: "espeak-ng-spm")
]
#if /*elseif*/ os(Android)
packageDependencies = [.package(url: "https://github.com/swiftlang/swift-java.git", from: "0.2.0")]
targetDependencies = [.product(name: "SwiftJava", package: "swift-java")]
#elseif os(WASI)
packageDependencies = [.package(url: "https://github.com/swiftwasm/JavaScriptKit.git", from: "0.50.0")]
targetDependencies = [.product(name: "JavaScriptKit", package: "JavaScriptKit")]
testDependencies = [.product(name: "JavaScriptEventLoopTestSupport", package: "JavaScriptKit")]
#endif

let package = Package(
    name: "SpeechKit",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "SpeechKit",
            targets: ["SpeechKit"]
        ),
    ],
    dependencies: packageDependencies,
    targets: [
        .target(
            name: "SpeechKit",
            dependencies: targetDependencies
        ),
        .testTarget(
            name: "SpeechKitTests",
            dependencies: ["SpeechKit"] + testDependencies
        ),
    ],
    swiftLanguageModes: [.v6]
)
