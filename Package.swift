// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "miniapp-swiftui-sdk",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .macOS(.v13),
        .macCatalyst(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "miniapp-swiftui-sdk",
            targets: ["miniapp-swiftui-sdk", "miniapp_swiftui"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/stanydsouza/miniapp-core-sdk.git", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "miniapp-swiftui-sdk",
            dependencies: [
                .product(name: "miniapp-core-sdk", package: "miniapp-core-sdk")
            ]
        ),
        .binaryTarget(
            name: "miniapp_swiftui",
            path: "./Sources/miniapp_swiftui.xcframework"
        )
    ]
)
