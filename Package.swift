// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.0.3"
let checksum = "0c66162059c35e3a29e923af174443a183dda15f8c093d42ff1aa8f7301c93ba"

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
