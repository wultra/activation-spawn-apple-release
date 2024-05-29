# Configuration of WASTransporter

To encrypt and decrypt the data, the library generates a unique fingerprint calculated from device-specific data, such as battery level, operating system version, and similar data.

Activation Spawn is using this generator to safely transfer the activation data between applications.

In addition, static data `additionaData` of your choosing is added to the calculation.

<!-- begin box info -->
**It's crucial that the _Source App_ and _Target App_ are using the same static additional data when initializing `WASTransporter` and `WASProcessor`.**
<!-- end -->

## Configuration option

You can choose from the following options:

- **WASTransporterConfig.stable:** Transporter will use a stable time-based but still predictable fingerprint. This configuration is good if you expect that the transfer will take more than just seconds. 

- **WASTransporterConfig.semiStable:** Transporter will use a semi-stable time-based but still predictable fingerprint. This configuration is good if you expect that the transfer will take seconds (for example 10).
   
- **WASTransporterConfig.unstable:** Transporter will use an unstable time-based fingerprint. Fingerprint for the transport can change anytime so use this in scenarios where expected transfer takes no longer than a few seconds.

Each configuration takes 2 parameters:

- `sameTeam: Bool`: If `true` then the generator will be specific for an application vendor (same Apple team).
- `validityInSeconds: Int64`: If set, then the fingerprint will be valid for a given amount of seconds.

## Read next

- [Tutorial: Introducing Activation Spawn](https://developers.wultra.com/tutorials/posts/Introducing-Activation-Spawn/)
- [Do I Need PowerAuth?](./Do-I-Need-PowerAuth.md)
