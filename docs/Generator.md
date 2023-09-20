# Usage of DeviceFingerprintGenerator

DeviceFingerprintGenerator generates a unique fingerprint calculated from device-specific data, such as carrier, operating system version, and similar data.

Activation Spawn is using this generator to safely transfer the activation data between applications.

<!-- begin box info -->
**It's crutial that the _Source App_ and _Target App_ are using the same configuration of the generator.**
<!-- end -->

## Configure generator

The  `DeviceFingerprintGenerator` class supports various levels of stability for the generated fingerprint:

- **Stable** generator can generate a fingerprint that doesn't change for a long time (like days, or up to the next device boot). The fingerprint is generated from sources with low entropy, so if you plan to generate a cryptographic key, then it will be weak. 

- **Semi stable** generator can generate a fingerprint that can last for minutes. The fingerprint is generated from sources with higher entropy than **stable** generator.
   
- **Unstable** generator can generate an unstable fingerprint that can change anytime. It's because the user can easily affect the fingerprint by a simple action (like putting the device on a charger). It's recommended to use such fingerprint for a very short time, like for seconds. The fingerprint is generated from sources with the highest entropy.

- **Time-based** generator can generate a fingerprint that changes over time. You can combine a time-based generator with all the above generator stability classes.

You can use the following static functions to construct such generators:

```swift
let stableGenerator = try DeviceFingerprintGenerator.stable()
let semiStableGenerator = try DeviceFingerprintGenerator.semiStable()
let unstableGenerator = try DeviceFingerprintGenerator.unstable()
```

Each static function has the following set of parameters:

- `forVendor: Bool`: If `true` then the generator will be specific for an application vendor. The default value is `true`.
- `data: Data?`: If set, then the provided data will be added as a source to the fingerprint generator. The default value is `nil`.
- `timeSpan: Int64?`: If set, then the fingerprint will be valid for a given amount of seconds. The default value is `nil`.
- `autoPrepare: Bool`: If `true`, then the generator will automatically prepare itself for use. See [Multiple generators](#multiple-generators) section for more details. The default value is `true`.

For example, you can use the following code to generate a semi-stable generator that will generate a new fingerprint every 5 seconds, valid for all applications installed on the device:

```swift
let generator = try DeviceFingerprintGenerator.semiStable(forVendor: false, timeSpan: 5)
```

## Read next

- [Tutorial: Introducing Activation Spawn](https://developers.wultra.com/tutorials/posts/Introducing-Activation-Spawn/)
