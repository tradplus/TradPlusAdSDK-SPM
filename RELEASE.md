# TradPlusAdSDK-SPM 15.17.0

## Release Contents

- `TradPlusAds-15.17.0.xcframework.zip`
- `TPCrossAdapter-15.17.0.xcframework.zip`
- TPExchange dependency: `13.8.80`

The XCFramework contents match the published CocoaPods 15.17.0 package.
TPCrossAdapter is included in this main package; its separate legacy repository
is not a release target.

## Publication

1. Validate each ZIP against the checksum in `Package.swift`.
2. Commit and push the package sources and resources.
3. Create tag and GitHub Release `15.17.0` at the committed revision and upload
   both ZIP files from `releases/`.
4. Publish the matching `15.17.0` adapter packages.
5. Resolve and build `TradPlusAdSDK-SPM-Demo` against the published packages.

ZIP files are GitHub Release assets and must not be committed to Git.

## Integration

Use the exact version `15.17.0` for the main package and adapter packages.
The main SDK supports iOS 12; individual third-party packages may require a
higher deployment target.
