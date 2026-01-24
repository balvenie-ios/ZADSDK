// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.0.0"
let checksum = "9b3beec3e99b97af57ddee01bb121cdc7bcb94520e3f0c963da758358867b7bd"

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
