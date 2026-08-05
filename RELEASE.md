# TradPlusAdSDK-SPM 15.12.0 发布步骤

## 主包

1. 确认 `releases/TradPlusAds-15.12.0.xcframework.zip` 已生成。
2. 提交并推送 `TradPlusAdSDK-SPM` 仓库。
3. 打 tag 并创建 Release：

```bash
cd /Users/xuejun/Documents/GitHub/TradPlusAdSDK-SPM
git add Package.swift README.md Sources TradPlusAdSDK LICENSE
git commit -m "Support Swift Package Manager 15.12.0"
git tag 15.12.0
git push origin main
git push origin 15.12.0
gh release create 15.12.0 \
  --repo tradplus/TradPlusAdSDK-SPM \
  --title "15.12.0" \
  --notes "TradPlusAdSDK 15.12.0 Swift Package Manager release." \
  releases/TradPlusAds-15.12.0.xcframework.zip
```

4. 验证：

```bash
rm -rf .build
swift package resolve
```

## Adapter（每个仓库重复）

以 AdMob 为例：

```bash
cd /Users/xuejun/Documents/GitHub/TradPlusAdSDK-SPM-AdMob
git init
git add Package.swift README.md LICENSE Sources
git commit -m "Support Swift Package Manager 15.12.0"
git remote add origin https://github.com/tradplus/TradPlusAdSDK-SPM-AdMob.git
git branch -M main
git tag 15.12.0
git push -u origin main
git push origin 15.12.0
gh release create 15.12.0 \
  --repo tradplus/TradPlusAdSDK-SPM-AdMob \
  --title "15.12.0" \
  --notes "TradPlus AdMob Adapter 15.12.0 SPM release." \
  releases/TPAdMobAdapter-15.12.0.xcframework.zip
```

## 重新生成 Adapter 仓库

在源码仓 `tradplus_dev_ios` 执行：

```bash
cd /Users/xuejun/tradplus_dev_ios
./composeSpm.sh 15.12.0
# 或仅 Adapter：
./scripts/spm/generate-spm-adapters.sh 15.12.0
```

## 注意事项

- `releases/*.zip` 仅用于上传 GitHub Release，不建议提交到 git。
- 主包 SPM 依赖 `TPExchange 13.8.70`；CocoaPods 主包当前仍为 `13.8.60`，如需一致请同步 podspec。
- HyBid Adapter 依赖 [vervegroup/hybid-ios-spm-sdk](https://github.com/vervegroup/hybid-ios-spm-sdk) `3.8.0`（Verve / HyBid 为同一平台）。
