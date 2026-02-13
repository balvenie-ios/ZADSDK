// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.0.4"
let checksum = "15f8503557c7aa4e515911ff951db031c1c862f111a398a7b32af8a74547007f"

let package = Package(
    name: "ZADSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "ZADSDK", targets: ["ZADSDKXCFramework"]),
    ],
    targets: [
        .binaryTarget(
            name: "ZADSDKXCFramework",
            url: "https://github.com/balvenie-ios/ZADSDK/releases/download/\(version)/ZADSDK.xcframework.zip",
            checksum: checksum
        ),
    ]
)
