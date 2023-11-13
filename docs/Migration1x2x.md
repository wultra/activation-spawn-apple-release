# Migration from version 1.x to 2.x

New features and changes were introduced in version 2.0 that are incompatible with version 1.x:

- **Fingerprint generator configuration is now transferred in the deeplink. With this change, only `additionalData` are now required to sync between Source and Target application.**
- `WASTransporter` no longer takes a `DeviceFingerprintGenerator` parameter in `init` and is using its own configuration that will prepare the generator for you.
- `WASTransporter` functions `validate` and `process` are now part of the newly introduced `WASProcessor` to separate logic on the side of the Source and Target app.
- `additionalData` is now required and part of the `WASTransporter` and `WASProcessor` initializers.

## Example change in the Source App

### New code
```swift
let additionalData = "testWultraData".data(using: .utf8)!
let transporter = try! WASTransporter(
	config: .semiStable(sameTeam: true, validityInSeconds: 10), 
	additionalData: additionalData
)
// rest of the transport is the same
```

### Old code
```swift
let additionalData = "testWultraData".data(using: .utf8)!
let transporter = WASTransporter(
	generator: try! DeviceFingerprintGenerator.semiStable(
		forVendor: true, 
		withAdditionalData: additionalData, 
		validFor: 10
	)
)
// rest of the transport is the same
```

## Example change in the Target App

### New code
```swift
let retrievedDeeplink: URL
let additionalData = "testWultraData".data(using: .utf8)!
let processor = WASProcessor(additionalData: additionalData)
let activationData = try processor.process(deeplink: url)
```

### Old code
```swift
let retrievedDeeplink: URL
let additionalData = "testWultraData".data(using: .utf8)!
let transporter = WASTransporter(
	generator: try! DeviceFingerprintGenerator.semiStable(
		forVendor: true, 
		withAdditionalData: additionalData, 
		validFor: 10
	)
)
let activationData = try transporter.process(deeplink: url)
```