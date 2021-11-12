// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "WultraActivationSpawn",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "WultraActivationSpawn", targets: ["WultraActivationSpawn"]),
        .library(name: "WultraPowerAuthNetworking", targets: ["WultraPowerAuthNetworking"])
    ],
    targets: [
        .binaryTarget(
            name: "WultraActivationSpawn",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-0.0.3.xcframework.zip",
            checksum: "bf58c772a19110b597270c7ac7e6614d865035cf5358e3c5adab224d59c2daae"),
        .binaryTarget(
            name: "WultraPowerAuthNetworking",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraPowerAuthNetworking-0.0.3.xcframework.zip",
            checksum: "21294480f706e5cc5794e38f25df2da7d6ce7fb8491b88771bb7ac5238f36e15")
    ]
)