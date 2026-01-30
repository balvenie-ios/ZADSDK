// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.0.2"
let checksum = "5ddd69b15b52c4009ae3babf838ba06c0bd239c4790aac99da1353479dcfd13c"

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
