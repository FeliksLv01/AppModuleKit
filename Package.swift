// swift-tools-version: 5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppModuleKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AppModuleKit",
            type: .static,
            targets: ["AppModuleKit"]),
    ],
    targets: [
        .target(
            name: "AppModuleKit"
        )
    ]
)
