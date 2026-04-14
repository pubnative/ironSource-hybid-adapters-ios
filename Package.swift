// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "IronSourceHyBidAdapters",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "IronSourceHyBidAdapters",
            targets: ["IronSourceHyBidAdapters"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vervegroup/hybid-ios-spm-sdk.git", exact: "3.8.0"),
        .package(url: "https://github.com/ironsource-mobile/Unity-Mediation-iAds-Swift-Package.git", .upToNextMajor(from: "9.3.0")),
        .package(url: "https://github.com/ironsource-mobile/Unity-Ad-Quality-Swift-Package.git", .upToNextMajor(from: "9.2.1"))
    ],
    targets: [
        .target(
            name: "IronSourceHyBidAdapters",
            dependencies: [
                .product(name: "HyBid", package: "hybid-ios-spm-sdk"),
                .product(name: "UnityMediationSDK", package: "Unity-Mediation-iAds-Swift-Package"),
                .product(name: "AdQuality", package: "Unity-Ad-Quality-Swift-Package")
            ],
            path: "ironSourceAdapters",
            sources: [
                "ISVerveCustomAdapter.m",
                "ISVerveCustomBanner.m",
                "ISVerveCustomInterstitial.m",
                "ISVerveCustomRewardedVideo.m",
                "ISVerveUtils.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        )
    ]
)
