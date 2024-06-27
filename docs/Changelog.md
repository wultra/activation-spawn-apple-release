# Changelog

## 3.0.0 (June, 2024)

- It is now possible to use the library without `PowerAuth` dependency ([Usage _(without PowerAuth)_](./Usage-Without-PowerAuth.md)) .
- Class `Processor.ValidationSuccess` in package `com.wultra.android.activationspawn` was moved outside of the `Processor` class and is now standalone in the same package.

## 2.0.0 (May, 2024)

- Removed `ActivationSpawnManager` - use `Transporter`, `Processor`, and `Activator` classes instead.
- Introduced generator configuration instead of using `DeviceFingerprintGenerator` directly. 
- Follow [the migration guide](Migration1x2x.md) to understand all changes.
- All changes are **backwards compatible**.

## 1.5.1 (May, 2024)

- Added listener to the log class

## 1.5.0 (Mar 4, 2024)

- `isInstalled` API no longer throws Exceptions
- removed `QueryNotDeclaredException`
- removed `APP_NOT_INSTALLED` and `DEEPLINK_CANNOT_BE_OPEN` reasons for `TransportDataException.Reason`

## 1.4.0 (Nov 27, 2023)

- Upgraded to powerauth-networking `1.3.0` (PowerAuth `1.8.x`)

## 1.3.0 (Nov 27, 2023)

- Annotation data
- Improved documentation
- Minor fixes and improvements

## 1.2.1 (Apr 5, 2023)

- Updated dependencies

## 1.2.0 (Nov 14, 2022)

- Introduced TransportData

## 1.1.3 (Nov 12, 2021)

- Updated Android dependencies

## 1.1.2 (Nov 12, 2021)

- Using device-fingerprint `1.1.1`

## 1.1.1 (Oct 25, 2021)

- Added activity flags option to openStore API

## 1.1.0 (Oct 19, 2021)

- Fixed URL resource ID

## 1.0.1 (Oct 12, 2021)

- ActivationSpawnData is now Parcelable
- Fixed app availability
- More robust API URL handling (via networking-android library update)
- Upgraded to device-fingerprint `1.1.0`

## 1.0.0 (Oct 12, 2021)

Initial release.
