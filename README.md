# TradPlusAdSDK Swift Package

Swift Package Manager support for the TradPlusAdSDK main package.

## Installation

Add the package dependency in Xcode:

```text
https://github.com/tradplus/TradPlusAdSDK-SPM.git
```

Or add it to `Package.swift`:

```swift
.package(url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git", exact: "15.12.0")
```

Recommended dependency rule in Xcode: **Up to Next Major Version** from `15.12.0`.

## Contents

This package contains the `TradPlusAds` main SDK and depends on `TPExchange` (`13.8.70`).

Adapter packages are distributed in separate repositories, for example:

```text
https://github.com/tradplus/TradPlusAdSDK-SPM-AdMob.git
https://github.com/tradplus/TradPlusAdSDK-SPM-TPCross.git
```

## Demo

A runnable SPM sample project is available at:

```text
https://github.com/tradplus/TradPlusAdSDK-SPM-Demo.git
```

Clone the repo, open `TradPlusDemo.xcodeproj`, and build. No CocoaPods required.

For CocoaPods integration, see [tradplus-ios-demo](https://github.com/tradplus/tradplus-ios-demo).

## Notes

- If Objective-C categories are not loaded correctly, add `-ObjC` to the app target's `Other Linker Flags`.
- Release `15.12.0` binary asset: `TradPlusAds-15.12.0.xcframework.zip`
