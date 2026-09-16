// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusAdSDK",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusAdSDK",
            targets: ["TradPlusAdSDK"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/pod_TPExchange_sdk.git",
            .exact("13.8.70")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusAdSDK",
            dependencies: [
                .target(name: "TradPlusAds"),
                .target(name: "TPCrossAdapter"),
                .product(name: "TPExchange", package: "pod_TPExchange_sdk"),
            ],
            path: ".",
            sources: ["Sources/TradPlusAdSDK/TradPlusAdSDK.swift"],
            resources: [
                .copy("TradPlusAdSDK/TradPlusAds.bundle"),
            ],
            linkerSettings: [
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit"),
                .linkedLibrary("c++"),
                .linkedLibrary("z"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("xml2"),
                .linkedLibrary("resolv"),
            ]
        ),
        .binaryTarget(
            name: "TradPlusAds",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM/releases/download/15.15.0/TradPlusAds-15.15.0.xcframework.zip",
            checksum: "4d9dffd73076fc2dd2927084ac380e5031588f208628971571fbbdba85574d45"
        ),
        .binaryTarget(
            name: "TPCrossAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM/releases/download/15.15.0/TPCrossAdapter-15.15.0.xcframework.zip",
            checksum: "5fafa3186a9a715e09c746df88b8a11d4f4d7032634be7b737c3cda8e3fe8015"
        ),
    ]
)
