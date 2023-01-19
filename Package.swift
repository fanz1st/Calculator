// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

/// We define global swift settings to control SIMD usage.
/// The gist is, that we will import and use SIMD implementations where available.
/// Otherwise we fall back to our own implementation.
var swiftSettings: [SwiftSetting] = []
#if canImport(simd)
swiftSettings.append(.define("MATH_USE_SIMD"))
#endif

#if canImport(Darwin)
swiftSettings.append(.define("MATH_DARWIN"))
#elseif canImport(Glibc)
swiftSettings.append(.define("MATH_GLIBC"))
#elseif canImport(Foundation)
swiftSettings.append(.define("MATH_FOUNDATION"))
#endif

#if os(Windows)
let libraryType : Product.Library.LibraryType = .dynamic
#else
let libraryType : Product.Library.LibraryType = .static
#endif

let package = Package(
    name: "Math",
    products: [
        .library(
            name: "Math",
            type: libraryType,
            targets: ["Math"])
    ],
    targets: [
        .target(
            name: "Math",
            dependencies: [],
            swiftSettings: swiftSettings),
        .testTarget(
            name: "MathTests",
            dependencies: ["Math"],
            swiftSettings: swiftSettings)
    ]
)
