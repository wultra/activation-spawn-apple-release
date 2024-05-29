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
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-3.0.0.xcframework.zip",
            checksum: "34bc6cc39c073ab0b03cad53762cda6c6e13ab6741e010fe5d87b89a6f495ece"
        ),
        .binaryTarget(
            name: "WultraActivationSpawnBasicBinary",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawnBasic-3.0.0.xcframework.zip",
            checksum: "6236f32f5462c97b2a66a59b5ba2c471b3658ce722d6b87b6ec30e20e15a6ea2"
        )
    ]
)
