# Installation

## Dependencies

1. [PowerAuth SDK for Mobile Apps](https://github.com/wultra/powerauth-mobile-sdk) `v1.6.0+`
2. [PowerAuth Networking for Apple platforms](https://github.com/wultra/networking-apple) `v1.1.0+`
3. Wultra device fingerprint for Apple (closed source) `v1.3.0+`

## Supported operating systems

The library is supported on the following operating systems:

- **iOS** 10.0+

## Cocoapods 

The library is distributed via Cocoapods private repository. If you're not using cocoapods in your project, visit [usage guide](https://guides.cocoapods.org/using/using-cocoapods.html).

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
       pod 'WultraActivationSpawn', :git => 'https://github.com/wultra/activation-spawn-apple-release.git', :tag => '1.2.0'
       pod 'WultraDeviceFingerprint', :git => 'https://github.com/wultra/device-fingerprint-apple-release.git', :tag => '1.3.0'
   end
   ```
   You can check the latest versions of libraries above at release pages:
   - [WultraActivationSpawn releases page](https://github.com/wultra/device-fingerprint-apple-release/tags)
   - [WultraDeviceFingerprint releases page](https://github.com/wultra/activation-spawn-apple-release/tags)

3. Run `pod install` in your project dictionary to make the `WultraActivationSpawn` framework available in your project.

## Swift Package Manager

The library is distributed also as a package for Swift Package Manager:
   
1. Create (or append to if already exists) `~/.netrc` file in your home directory with the following credentials you were provided alongside this document:
   ```
   machine wultra.jfrog.io
         login [name@yourcompany.com]
         password [password]
   ```

2. Add the following repositories as a dependency into your project:
   ```
   https://github.com/wultra/activation-spawn-apple-release
   https://github.com/wultra/device-fingerprint-apple-release
   https://github.com/wultra/networking-apple
   https://github.com/wultra/powerauth-mobile-sdk-spm (add both PowerAuth2 and PowerAuthCore)
   ```
   You can use Xcode's dedicated user interface to do this or add the dependency manually, for example:
   ```swift
   // swift-tools-version:5.4

   import PackageDescription

   let package = Package(
       name: "YourLibrary",
       products: [
           .library(
               name: "YourLibrary",
               targets: ["YourLibrary"]),
       ],
       dependencies: [
           .package(name: "WultraActivationSpawn", url: "https://github.com/wultra/activation-spawn-apple-release.git", .upToNextMinor(from: "1.2.0")),
           .package(name: "WultraDeviceFingerprint", url: "https://github.com/wultra/device-fingerprint-apple-release.git", .upToNextMinor(from: "1.3.0")),
           .package(name: "WultraPowerAuthNetworking", url: "https://github.com/wultra/networking-apple.git", .upToNextMinor(from: "1.1.1")),
           .package(name: "PowerAuth2", url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .upToNextMinor(from: "1.6.2")),
       ],
       targets: [
           .target(
               name: "YourLibrary",
               dependencies: [
                   "WultraDeviceFingerprint",
                   "WultraPowerAuthNetworking",
                   "PowerAuth2",
                   .product(name: "PowerAuthCore", package: "PowerAuth2")
               ])
       ]
   )
   ```

## Read next

- [Usage](Usage.md)
