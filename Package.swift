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
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-2.0.1.xcframework.zip",
            checksum: "70c3d31a3ec69ddb42b0e2b53029dd38e408657ab08cf8b1d86273a552ebdc11"
        )
    ]
)
