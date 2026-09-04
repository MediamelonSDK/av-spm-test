// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "MediaMelon-AVPlayer-SDK-IMA-test",

    platforms: [
        .iOS(.v15),
        .tvOS(.v15)
    ],

    products: [
        .library(
            name: "MediaMelon-AVPlayer-SDK-IMA-test",
            targets: [
                "MediaMelon_AVPlayer_SDK_IMA"
            ]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/MediamelonSDK/mm-ios-qoe-sdk-ima",
            exact: "2.16.0"
        )
    ],

    targets: [
        .target(
            name: "MediaMelon_AVPlayer_SDK_IMA",

            dependencies: [
                .product(
                    name: "MediaMelonIMA",
                    package: "mm-ios-qoe-sdk-ima"
                )
            ],

            path: "Source"
        )
    ]
)