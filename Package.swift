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
        .package(name: "WultraPowerAuthNetworking", url: "https://github.com/wultra/networking-apple.git", .upToNextMinor(from: "1.1.4")),
        .package(name: "PowerAuth2", url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .upToNextMinor(from: "1.7.2")),
        .package(name: "WultraDeviceFingerprint", url: "https://github.com/wultra/device-fingerprint-apple-release.git", .upToNextMinor(from: "1.3.2"))
    ],
    targets: [
        .binaryTarget(
            name: "WultraActivationSpawn",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-1.2.5.xcframework.zip",
            checksum: "4a8fd09753d23c391c83757684d9581bbb411331f5a050a9accb22ca89920d49"
        )
    ]
)