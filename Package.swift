// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "MediaMelon-AVPlayer-SDK-test",

    platforms: [
        .iOS(.v15),
        .tvOS(.v15)
    ],

    products: [
        // QoE version
        .library(
            name: "MediaMelon-AVPlayer-SDK-test",
            targets: ["MediaMelon_AVPlayer_SDK_QoE"]
        ),

        // IMA version
        .library(
            name: "MediaMelon-AVPlayer-SDK-IMA-test",
            targets: ["MediaMelon_AVPlayer_SDK_IMA"]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/MediamelonSDK/mm-ios-qoe-sdk",
            exact: "2.16.0"
        ),

        .package(
            url: "https://github.com/MediamelonSDK/mm-ios-qoe-sdk-ima",
            exact: "2.16.0"
        )
    ],

    targets: [

        // MARK: - Common implementation

        .target(
            name: "MediaMelon_AVPlayer_SDK_Core",
            path: "Source"
        ),

        // MARK: - QoE SDK

        .target(
            name: "MediaMelon_AVPlayer_SDK_QoE",
            dependencies: [
                "MediaMelon_AVPlayer_SDK_Core",
                .product(
                    name: "MediaMelonQoE",
                    package: "mm-ios-qoe-sdk"
                )
            ],
            path: "Sources/MediaMelon_AVPlayer_SDK_QoE"
        ),

        // MARK: - IMA SDK

        .target(
            name: "MediaMelon_AVPlayer_SDK_IMA",
            dependencies: [
                "MediaMelon_AVPlayer_SDK_Core",
                .product(
                    name: "MediaMelonIMA",
                    package: "mm-ios-qoe-sdk-ima"
                )
            ],
            path: "Sources/MediaMelon_AVPlayer_SDK_IMA"
        )
    ]
)