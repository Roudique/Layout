// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Layout",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "Layout",
            targets: ["Layout"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Layout",
            dependencies: []),
        .testTarget(
            name: "LayoutTests",
            dependencies: ["Layout"]),
    ]
)
