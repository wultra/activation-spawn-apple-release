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
        .package(url: "https://github.com/wultra/networking-apple.git", .upToNextMinor(from: "1.4.0")),
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
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-3.1.0.xcframework.zip",
            checksum: "ea16873779e5f01756f24b35b62b426cdcbe88b3bc8707ed3463bb6cb74ac46d"
        ),
        .binaryTarget(
            name: "WultraActivationSpawnBasicBinary",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawnBasic-3.1.0.xcframework.zip",
            checksum: "b19c6f70720aabaa72de9393d92ef664066489c20292fdd3cf80ebac85f24876"
        )
    ]
)
