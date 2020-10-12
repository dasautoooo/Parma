// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Parma",
    platforms: [
        .macOS("11.0"),
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "Parma",
            targets: ["Parma"]),
    ],
    dependencies: [
        .package(url: "https://github.com/iwasrobbed/Down", from: "0.8.1")
    ],
    targets: [
        .target(
            name: "Parma",
            dependencies: ["Down"]),
        .testTarget(
            name: "ParmaTests",
            dependencies: ["Parma"]),
    ]
)
