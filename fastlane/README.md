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

 * **`clean`**: Set to `true`, if you want to clean all provisioning profiles. Defaults to `false`

### ios rename

```sh
[bundle exec] fastlane ios rename
```

Renames the project including all occurences of `Template` to a new name of your choice.

#### Example:

```
bundle exec fastlane rename new_name:Tahdith
```

#### Options:

 * **`new_name`**: New project name of your choice.

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

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
