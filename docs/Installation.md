# Installation

## Dependencies

1. [PowerAuth SDK for Mobile Apps](https://github.com/wultra/powerauth-mobile-sdk) 
2. [PowerAuth Networking for Apple platforms](https://github.com/wultra/networking-apple) 
3. Wultra Device Fingerprint for Apple (closed source) 

## Supported operating systems

The library is supported by the following operating systems:

- **iOS** 11.0+

## Swift Package Manager

The library is distributed as a package for Swift Package Manager:
   
1. Create (or append to if already exists) `~/.netrc` file in your home directory with the following credentials you were provided alongside this document: 
   ```
   machine wultra.jfrog.io
         login [name@yourcompany.com]
         password [password]
   ```

2. Add the following repositories as a dependency into your project:
   ```
   https://github.com/wultra/networking-apple.git
   https://github.com/wultra/activation-spawn-apple-release.git
   https://github.com/wultra/device-fingerprint-apple-release.git
   ```
   You can use Xcode's dedicated user interface to do this or add the dependency manually, for example:
   
   ```swift
   // swift-tools-version:5.8

   import PackageDescription

   let package = Package(
       name: "YourLibrary",
       products: [
           .library(
               name: "YourLibrary",
               targets: ["YourLibrary"]),
       ],
       dependencies: [
           .package(url: "https://github.com/wultra/activation-spawn-apple-release.git", .upToNextMajor(from: "1.3.0")),
           .package(url: "https://github.com/wultra/device-fingerprint-apple-release.git", .upToNextMajor(from: "1.3.0")),
           .package(url: "https://github.com/wultra/networking-apple.git", .upToNextMajor(from: "1.1.0")),
           .package(url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .upToNextMajor(from: "1.7.0")),
       ],
       targets: [
           .target(
               name: "YourLibrary",
               dependencies: [
                    .product(name: "WultraActivationSpawn", package: "activation-spawn-apple-release"),
                    .product(name: "WultraDeviceFingerprint", package: "device-fingerprint-apple-release"),
                    .product(name: "WultraPowerAuthNetworking", package: "networking-apple"),
                    .product(name: "PowerAuth2", package: "powerauth-mobile-sdk-spm")
                ]
            )
       ]
   )
   ```

## Cocoapods 

The library is also distributed through a public git repository, which contains a podspec and scripts to download the framework from a private artifactory. If you're not using cocoapods in your project, visit [usage guide](https://guides.cocoapods.org/using/using-cocoapods.html).

1. Create (or append to if already exists) `~/.netrc` file in your home directory with the following credentials you were provided alongside this document:

   ```
   machine wultra.jfrog.io
         login [name@yourcompany.com]
         password [password]
   ``` 

2. Add pod to your `Podfile`:

   ```rb
   target 'MyProject' do
       use_frameworks!
       pod 'WultraActivationSpawn', :git => 'https://github.com/wultra/activation-spawn-apple-release.git', :tag => '1.3.0'
       pod 'WultraDeviceFingerprint', :git => 'https://github.com/wultra/device-fingerprint-apple-release.git', :tag => '1.3.2'
   end
   ```
   You can check the latest versions of the libraries above on the release pages:
   - [WultraActivationSpawn releases page](https://github.com/wultra/device-fingerprint-apple-release/releases)
   - [WultraDeviceFingerprint releases page](https://github.com/wultra/activation-spawn-apple-release/releases)

3. Run `pod install` in your project dictionary to make the `WultraActivationSpawn` and `WultraDeviceFingerprint` frameworks available in your project.

## Read next

- [Usage](Usage.md)
