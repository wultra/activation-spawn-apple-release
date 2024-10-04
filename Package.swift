// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "WultraActivationSpawn",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "WultraActivationSpawn", targets: ["WultraActivationSpawnWrapper"]),
        .library(name: "WultraActivationSpawnBasic", targets: ["WultraActivationSpawnBasicWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/wultra/networking-apple.git", .upToNextMinor(from: "1.5.0")),
        .package(url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .upToNextMinor(from: "1.9.0")),
        .package(url: "https://github.com/wultra/device-fingerprint-apple-release.git", .upToNextMinor(from: "1.4.0"))
    ],
    targets: [
        .target(
            name: "WultraActivationSpawnWrapper",
            dependencies: [
                .target(name: "WultraActivationSpawnBinary"),
                .product(name: "PowerAuth2", package: "powerauth-mobile-sdk-spm"),
                .product(name: "PowerAuthCore", package: "powerauth-mobile-sdk-spm"),
                .product(name: "WultraDeviceFingerprint", package: "device-fingerprint-apple-release"),
                .product(name: "WultraPowerAuthNetworking", package: "networking-apple")
            ],
            path: "WultraActivationSpawnWrapper"
        ),
        .target(
            name: "WultraActivationSpawnBasicWrapper",
            dependencies: [
                .target(name: "WultraActivationSpawnBasicBinary"),
                .product(name: "WultraDeviceFingerprint", package: "device-fingerprint-apple-release")
            ],
            path: "WultraActivationSpawnBasicWrapper"
        ),
        .binaryTarget(
            name: "WultraActivationSpawnBinary",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-3.2.0.xcframework.zip",
            checksum: "cacdd6c2118251282e99d2a43dc8f0977b5a41e2c5936db1a4f1c482bcc96f7a"
        ),
        .binaryTarget(
            name: "WultraActivationSpawnBasicBinary",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawnBasic-3.2.0.xcframework.zip",
            checksum: "720f2206ced9f76a8985ab90df0dcf75a16939f232c42cc19ba601c6f148a86d"
        )
    ]
)
