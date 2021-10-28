# Installation

## Dependencies

1. [PowerAuth SDK for Mobile Apps](https://github.com/wultra/powerauth-mobile-sdk) `v1.6.0+`
2. Wultra device fingerprint for Apple (closed source) `v1.2.0+`

## Supported operating systems

The library is supported on the following operating systems:

- **iOS** 10.0+

## Cocoapods 

The library is distributed via Cocoapods private repository. If you're not using cocoapods in your project, visit [usage guide](https://guides.cocoapods.org/using/using-cocoapods.html).

1. Install cocoapods-art plugin to be able to access our private repository  

   ```sh
   gem install cocoapods-art
   ```

2. Create (or append to if already exists) `~/.netrc` file in your home directory with the following credentials you were provided alongside this document:

   ```
   machine wultra.jfrog.io
         login [name@yourcompany.com]
         password [password]
   ``` 

3. Synchronize remote repositories locally:

   ```sh
   pod repo-art add device_fingerprint_apple https://wultra.jfrog.io/artifactory/api/pods/device-fingerprint-apple
   pod repo-art add activation_spawn_apple https://wultra.jfrog.io/artifactory/api/pods/activation-spawn-apple
   ```

   To synchronize repositories and receive new versions in the future, use the following commands:

   ```sh
   pod repo-art update device_fingerprint_apple
   pod repo-art update activation_spawn_apple
   ```

4. To enable cocoapods-art plugin in your project `Podfile`, add the following code somewhere at the beginning of the file:

   ```rb
   plugin 'cocoapods-art', :sources => [
       'activation_spawn_apple','device_fingerprint_apple'
   ]
   ```

5. Add pod to your `Podfile`:

   ```rb
   target 'MyProject' do
       use_frameworks!
       pod 'WultraActivationSpawn'
       pod 'WultraDeviceFingerprint'
       pod 'PowerAuth2' # if not added yet
   end
   ```

6. Run `pod install` in your project dictionary to make the `WultraActivationSpawn` framework available in your project.

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
   https://github.com/wultra/activation-spawn-apple-spm
   https://github.com/wultra/device-fingerprint-apple-spm
   https://github.com/wultra/powerauth-mobile-sdk-spm # if not added yet
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
           .package(name: "WultraActivationSpawn", url: "https://github.com/wultra/activation-spawn-apple-spm", .from("1.1.2")),
           .package(name: "WultraDeviceFingerprint", url: "https://github.com/wultra/device-fingerprint-apple-spm", .from("1.2.1")),
           .package(name: "PowerAuth2", url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .from("1.6.2")),
           .package(name: "PowerAuthCore", url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .from("1.6.2"))
       ],
       targets: [
           .target(
               name: "YourLibrary",
               dependencies: ["WultraActivationSpawn", "WultraDeviceFingerprint", "PowerAuth2", "PowerAuthCore"])
       ]
   )
   ```
