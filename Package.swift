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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM/releases/download/15.16.0/TradPlusAds-15.16.0.xcframework.zip",
            checksum: "af3764c91adf6656763aa46cab0939e5d1506ef82cb1e30072a8d9433ce51e31"
        ),
        .binaryTarget(
            name: "TPCrossAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM/releases/download/15.16.0/TPCrossAdapter-15.16.0.xcframework.zip",
            checksum: "3e8e88aee343f9d16feb2660b2c15348aa825fa96fe9dc90c81b52ce58a31313"
        ),
    ]
)
