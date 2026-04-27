// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "3.0.0"
let checksum = "9cc7e2e41a85bb56d5d95695f3a68eaf7da989d0ee1bd41256b184a11a379368"

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
