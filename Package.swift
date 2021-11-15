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
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraActivationSpawn-1.2.0.xcframework.zip",
            checksum: "800e61714cdb1fe9dec3fd78ad4d7fa39442a76479cc3e42b6cb950fba64d3b5"),
        .binaryTarget(
            name: "WultraPowerAuthNetworking",
            url: "https://wultra.jfrog.io/artifactory/activation-spawn-apple-release/WultraPowerAuthNetworking-1.2.0.xcframework.zip",
            checksum: "7652d6e749cd7390413a6a9ba216e22f63fefbf323eea7956229e559665e3c25")
    ]
)