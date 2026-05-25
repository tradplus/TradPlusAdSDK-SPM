# TradPlusAdSDK Swift Package

Swift Package Manager support for the TradPlusAdSDK main package.

## Installation

Add the package dependency in Xcode:

```text
https://github.com/tradplus/TradPlusAdSDK-SPM.git
```

Or add it to `Package.swift`:

```swift
.package(url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git", exact: "15.7.0")
```

## Contents

This package contains the `TradPlusAds` main SDK and depends on `TPExchange`.
Adapter packages are not supported by Swift Package Manager yet.

If Objective-C categories are not loaded correctly, add `-ObjC` to the app
target's `Other Linker Flags`.
