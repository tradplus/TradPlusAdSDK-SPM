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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM/releases/download/15.14.0/TradPlusAds-15.14.0.xcframework.zip",
            checksum: "fb6afe81d676f7f836dedccf8805b40cb3985198a4a2e330f2921f62605ce505"
        ),
        .binaryTarget(
            name: "TPCrossAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM/releases/download/15.14.0/TPCrossAdapter-15.14.0.xcframework.zip",
            checksum: "5ebc1a4e32db26bb7d252e4960e4ed41d6e7679ddd6e32ec22471801a41431f8"
        ),
    ]
)
