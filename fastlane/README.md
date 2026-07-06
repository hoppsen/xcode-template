fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios setup

```sh
[bundle exec] fastlane ios setup
```

Run this to setup your development environment

#### Example:

```
bundle exec fastlane setup
```

#### Options:

 * **`ssh`**: Set to `true`, if you are currently not using SSH. Defaults to `false`

 * **`renew`**: Set to `true`, if you want to regenerate (!) all certificates and provisioning profiles with sync_code_signing (alias match). Defaults to `false`

 * **`clean`**: Set to `true`, if you want to clean all provisioning profiles. Defaults to `false`

### ios codeSigning

```sh
[bundle exec] fastlane ios codeSigning
```

Run this to install the code signing certificates

#### Example:

```
bundle exec fastlane codeSigning type:appstore
```

#### Options:

 * **`type`**: Specify the type you want to syncronize the certificates for. Defaults to 'appstore'

 * **`renew`**: Set to `true`, if you want to regenerate (!) all certificates and provisioning profiles with sync_code_signing (alias match). Defaults to `false`

 * **`code_signing_identity`**: Specify the code signing identity you want to use. Defaults to `Apple Distribution`

### ios registerDevice

```sh
[bundle exec] fastlane ios registerDevice
```

Register a new device to Hoppsen's App Store Connect account. You might want to renew the provisioning profiles by using the :setup or :codeSigning lane.

#### Example:

```
bundle exec fastlane registerDevice name:"Firstname Lastname - iPhone 15 Pro"" udid:<udid>
```

#### Options:

 * **`name`**: The name of the device: "<Firstname> <Lastname> - <Model>"

 * **`udid`**: The UDID of the device you want to add

### ios simulator

```sh
[bundle exec] fastlane ios simulator
```

Updates the status bar of all booted simulators.

#### Example:

```
bundle exec fastlane simulator
```

#### Options:

 * **`devices`**: Array of simulators to update.

### ios rename

```sh
[bundle exec] fastlane ios rename
```

Renames the project including all occurrences of `Template` to a new name of your choice.

#### Example:

```
bundle exec fastlane rename new_name:Tahdith
```

#### Options:

 * **`new_name`**: New project name of your choice.

### ios lint

```sh
[bundle exec] fastlane ios lint
```

Runs SwiftLint

#### Example:

```
bundle exec fastlane lint
```

### ios format

```sh
[bundle exec] fastlane ios format
```

Runs SwiftFormat

#### Example:

```
bundle exec fastlane format
```

#### Options:

 * **`lint_only`**: Returns an error if formatting is needed, instead of actually changing it. Defaults to 'false'

### ios assets

```sh
[bundle exec] fastlane ios assets
```

Generates the Asset enum out of Assets.xcassets. For IMAGES only!

#### Example:

```
bundle exec fastlane assets
```

### ios updateVersion

```sh
[bundle exec] fastlane ios updateVersion
```

Updates version number

#### Example:

```
bundle exec fastlane updateVersion
```

#### Options:

 * **`patch_number`**: Patch number to be appended to the version number in the following format: <year>.<week>.<patch> Defaults to `0`. Increments the patch number if the current week is the same as the latest production version.

### ios build

```sh
[bundle exec] fastlane ios build
```

Runs build action

#### Example:

```
bundle exec fastlane build build_number:42 --env stg
```

#### Options:

 * **`build_number`**: The build number to use. Defaults to the build number stored on `https://increment.build`.

### ios test

```sh
[bundle exec] fastlane ios test
```

Runs tests

#### Example:

```
bundle exec fastlane test --env stg
```

### ios deploy

```sh
[bundle exec] fastlane ios deploy
```

Uploads the given file to TestFlight.

#### Example:

```
bundle exec fastlane deploy --env stg
```

#### Options:

 * **`changelog`**: The changelog to be used for this build.

#### Warning:

Adding a changelog makes the build wait for TestFlight processing to update the changelog, which results in 7.5min waiting time.

### ios upload_metadata

```sh
[bundle exec] fastlane ios upload_metadata
```

Uploads metadata to App Store Connect and optionally creates a new version.

#### Example:

```
bundle exec fastlane upload_metadata version_number:2024.52.0 build_number:666 --env prd
```

#### Options:

 * **`version_number`**: The version number to use.

 * **`build_number`**: The build number to use.

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
