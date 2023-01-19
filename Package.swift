// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

/// We define global swift settings to control SIMD usage.
/// The gist is, that we will import and use SIMD implementations where available.
/// Otherwise we fall back to our own implementation.
var swiftSettings: [SwiftSetting] = []
#if canImport(simd)
swiftSettings.append(.define("Calculator_USE_SIMD"))
#endif

#if canImport(Darwin)
swiftSettings.append(.define("Calculator_DARWIN"))
#elseif canImport(Glibc)
swiftSettings.append(.define("Calculator_GLIBC"))
#elseif canImport(Foundation)
swiftSettings.append(.define("Calculator_FOUNDATION"))
#endif

#if os(Windows)
let libraryType : Product.Library.LibraryType = .dynamic
#else
let libraryType : Product.Library.LibraryType = .static
#endif

let package = Package(
    name: "Calculator",
    products: [
        .library(
            name: "Calculator",
            type: libraryType,
            targets: ["Calculator"])
    ],
    targets: [
        .target(
            name: "Calculator",
            dependencies: [],
            swiftSettings: swiftSettings),
        .testTarget(
            name: "CalculatorTests",
            dependencies: ["Calculator"],
            swiftSettings: swiftSettings)
    ]
)
