// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "WultraActivationSpawn",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "WultraActivationSpawn", targets: ["WultraActivationSpawnWrapper"]),
        .library(name: "WultraActivationSpawnBasic", targets: ["WultraActivationSpawnBasicWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/wultra/networking-apple.git", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/wultra/powerauth-mobile-sdk.git", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/wultra/device-fingerprint-apple-release.git", .upToNextMinor(from: "1.4.0"))
    ],
    targets: [
        .target(
            name: "WultraActivationSpawnWrapper",
            dependencies: [
                .target(name: "WultraActivationSpawnBinary"),
                .product(name: "PowerAuth2", package: "powerauth-mobile-sdk"),
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
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-4.0.0.xcframework.zip",
            checksum: "871b51a0cddad4fdba448397b3b6c137e9dafd0700695a92b8e0efce10a3764e"
        ),
        .binaryTarget(
            name: "WultraActivationSpawnBasicBinary",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawnBasic-4.0.0.xcframework.zip",
            checksum: "7f8ee8d659eca844b84c90563d519410dda6e54ad9315a812be4ecfd40255b34"
        )
    ]
)
