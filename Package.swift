// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "WultraActivationSpawn",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "WultraActivationSpawn", targets: ["WultraActivationSpawn"])
    ],
    dependencies: [
        .package(name: "WultraPowerAuthNetworking", url: "https://github.com/wultra/networking-apple.git", .upToNextMinor(from: "1.1.4")),
        .package(name: "PowerAuth2", url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .upToNextMinor(from: "1.7.3")),
        .package(name: "WultraDeviceFingerprint", url: "https://github.com/wultra/device-fingerprint-apple-release.git", .upToNextMinor(from: "1.3.2"))
    ],
    targets: [
        .binaryTarget(
            name: "WultraActivationSpawn",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-2.0.0.xcframework.zip",
            checksum: "defc2c5711f76c62b0e3caba2a6ef46a57310e23b112763337aa8a07dc9f47ea"
        )
    ]
)
