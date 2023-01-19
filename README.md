# Calculator

[![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)
[![macOS](https://github.com/fireblade-engine/Calculator/actions/workflows/ci-macos.yml/badge.svg)](https://github.com/fireblade-engine/Calculator/actions/workflows/ci-macos.yml)
[![Linux](https://github.com/fireblade-engine/Calculator/actions/workflows/ci-linux.yml/badge.svg)](https://github.com/fireblade-engine/Calculator/actions/workflows/ci-linux.yml)
[![Windows](https://github.com/fireblade-engine/Calculator/actions/workflows/ci-windows.yml/badge.svg)](https://github.com/fireblade-engine/Calculator/actions/workflows/ci-windows.yml)
[![swift-version-compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ffireblade-engine%2FCalculator%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/fireblade-engine/Calculator) 
[![platform-compatilibilty](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ffireblade-engine%2FCalculator%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/fireblade-engine/Calculator) 
<!--[![platform-webassembly](https://img.shields.io/badge/Platform-WebAssembly-blue.svg)](https://github.com/swiftwasm/swift#swiftwasm)-->


A dependency free, lightweight, fast Calculator library for 2D and 3D vectors, quaternions and matrices in Swift with (optional) SIMD support.  

## 🚀 Getting Started

These instructions will get you a copy of the project up and running on your local machine and provide a code example.

### 📋 Prerequisites

* [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager)
* [Swiftlint](https://github.com/realm/SwiftLint) for linting - (optional)
* [SwiftEnv](https://swiftenv.fuller.li/) for Swift version management - (optional)

### 💻 Installing

Calculator is available for all platforms that support [Swift 5.1](https://swift.org/) and higher and the [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager).

Extend the following lines in your `Package.swift` file or use it to create a new project.

```swift
// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "YourPackageName",
    dependencies: [
        .package(url: "https://github.com/fanz1st/Calculator.git", from: "0.9.1")
    ],
    targets: [
        .target(
            name: "YourTargetName",
            dependencies: ["Calculator"])
    ]
)

```

## 💁 How to contribute

If you want to contribute please see the [CONTRIBUTION GUIDE](CONTRIBUTING.md) first. 

To start your project contribution run these in your command line:

1. `git clone git@github.com:fanz1st/Calculator.git Calculator`
2. `cd Calculator`
3. `make setupEnvironment`

Before commiting code please ensure to run:

- `make precommit`



## 🔏 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details


