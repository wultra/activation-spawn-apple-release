// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "WultraActivationSpawn",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "WultraActivationSpawn", targets: ["WultraActivationSpawn"])
    ],
    dependencies: [
        .package(name: "WultraPowerAuthNetworking", url: "https://github.com/wultra/networking-apple.git", .upToNextMinor(from: "1.1.0")),
        .package(name: "WultraDeviceFingerprint", url: "https://github.com/wultra/device-fingerprint-apple-release.git", .upToNextMinor(from: "1.3.1"))
    ],
    targets: [
        .binaryTarget(
            name: "WultraActivationSpawn",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-1.2.3.xcframework.zip",
            checksum: "88d7c428ab1cf4df0712812207debd1b56f1912f65e3f4577d4ffc682e9b41f3"
        )
    ]
)