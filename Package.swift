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
    targets: [
        .binaryTarget(
            name: "WultraActivationSpawn",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-0.0.1.xcframework.zip",
            checksum: "9524b5111ce7d4b8ffabffc6d6b8011b7d83dcec339aedeaa9e79127bcf01c63")
    ]
)