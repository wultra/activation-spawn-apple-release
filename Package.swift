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
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-1.2.1.xcframework.zip",
            checksum: "df0af7d7c1b9f626250b45c30eb7ac8aaaba1987b5b1e9514ddcca9cc4fbf006"),
        .binaryTarget(
            name: "WultraPowerAuthNetworking",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraPowerAuthNetworking-1.2.1.xcframework.zip",
            checksum: "99497b1f3e360d227773d7feafb15da15eef98d54faa7eb4908fe7ad5e805e26")
    ]
)