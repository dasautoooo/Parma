// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Parma",
    platforms: [
        .macOS("10.15"),
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "Parma",
            targets: ["Parma"]),
    ],
    dependencies: [
        .package(url: "https://github.com/iwasrobbed/Down", from: "0.9.3")
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
