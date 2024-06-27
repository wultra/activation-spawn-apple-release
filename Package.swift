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
        .package(url: "https://github.com/wultra/networking-apple.git", .upToNextMinor(from: "1.3.0")),
        .package(url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .upToNextMinor(from: "1.8.0")),
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
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-3.0.1.xcframework.zip",
            checksum: "d59ae0765a75719b1f2616206d087f428427d6c0b5f0b2e4c37143b2b3196193"
        ),
        .binaryTarget(
            name: "WultraActivationSpawnBasicBinary",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawnBasic-3.0.1.xcframework.zip",
            checksum: "e6196c14440fbc25e247725d4c0e8c5cfc5828421e35c5ee3a03ab5da7fc0b28"
        )
    ]
)
