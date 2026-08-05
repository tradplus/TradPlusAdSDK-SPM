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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM/releases/download/15.12.0/TradPlusAds-15.12.0.xcframework.zip",
            checksum: "65dbe44c513bb6d2d531ab14f76e3fd7d01db229dad8ab79208344e0cb801d5e"
        ),
    ]
)
