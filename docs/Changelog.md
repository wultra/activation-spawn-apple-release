# Changelog

## 3.2.1 (February, 2026)

- Using the latest Xcode (26.2) to build artifacts

## 3.2.0 (October, 2024)

- PowerAuth "server stack" `1.9+` is now required
- `powerauth-mobile-sdk` v `1.9.x` is now required
- `networking-apple` v `1.5.x` is now required

## 3.1.0 (July, 2024)

- Added log delegate - `WASLogger.delegate`
- `networking-apple` v `1.4.x` is now required

## 3.0.1 (June, 2024)

- Added ability to process raw data after the transport

## 3.0.0 (May, 2024)

- It is now possible to use the library without `PowerAuth` dependency ([Usage _(without PowerAuth)_](./Usage-Without-PowerAuth.md))

## 2.1.0 (Nov 27, 2023)

- Bumped version of the fingerprint library
 to `1.3.0`

## 2.0.1 (Nov 13, 2023)

- Using the latest Xcode for the build

## 2.0.0 (Nov 13, 2023)

- Configuration is now part of the transferred data

## 1.3.1 (Sep 20, 2023)

- Documentation improvements on the integration with SPM
- Update Cocoapods integration
- Fix integration when using swift package 5.7+
- Added annotation data and improved error handling
- Upgraded to Xcode15, Swift 5.9 and iOS 12

## 1.3.0 (Nov 14, 2022)

- Introduced `WASTransportData`

## 1.2.6 (Sep 22, 2022)

- Supporting Xcode 14
- Minimal support of iOS raised to 11

## 1.2.5 (Aug 26, 2022)

- Updated dependencies
- Added option to create the service by injecting networking object directly

## 1.2.4 (Feb 5, 2022)

- Updated networking dependency
- Fixed debugging symbols

## 1.2.3 (Feb 5, 2022)

- Removed nested frameworks from the artifact

## 1.2.2 (Feb 2, 2022)

- PowerAuthNetworking dependency is no longer packed with the framework

## 1.2.1 (Feb 1, 2022)

- Using the latest Xcode for artifact build

## 1.2.0 (Nov 15, 2021)

- Swift Package Manager support

## 1.1.1 (Oct 27, 2021)

- Localized errors - errors that are thrown by the library are now conforming to LocalizedError
- Bumped version of the fingerprint library

## 1.1.0 (Oct 19, 2021)

Initial release.
