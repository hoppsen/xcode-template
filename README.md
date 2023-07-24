# Xcode Template

My favorite Xcode project structure, plus SwiftLint and SwiftFormat pre-configured.

## Getting started

1. Install Xcode

    * [App Store](https://itunes.apple.com/de/app/xcode/id497799835?l=en&mt=12&ls=1) (easiest)
    * [Developer Portal](https://developer.apple.com/download/more/)
    * [Xcodes](https://github.com/RobotsAndPencils/XcodesApp) (recommended)

2. Verify your Ruby version

    ```sh
    ruby --version
    ```

    Ideally it show you something like this (Required: `>= 2.7.0`):

    ```sh
    ruby 3.1.1p18 (2022-02-18 revision 53f5fc4236) [arm64-darwin22]
    ```

    > Check the [Troubleshooting Guide](https://github.com/hoppsen/xcode-template/wiki/Troubleshooting-Guide#how-to-fix-your-ruby-version) to fix your Ruby version.

3. Install bundler

    ```sh
    gem install bundler --user-install
    ```

4. Clone this repository via SSH

    ```sh
    git clone git@github.com:hoppsen/xcode-template.git
    ```

    > Check the [Troubleshooting Guide](https://github.com/hoppsen/xcode-template/wiki/Troubleshooting-Guide#how-to-setup-ssh-for-github) to setup SSH (for GitHub).

5. Navigate to the project's directory.

6. Install all gems via bundle.

    ```sh
    bundle install
    ```

7. Run our guided setup script.

    ```sh
    bundle exec fastlane setup
    ```

8. (Optional) Rename the whole project to a name of your choice.

    ```sh
    bundle exec fastlane rename new_name:Hoppsen
    ```

9. Open `Template.xcodeproj` (or new name if renamed before)

10. Start coding :rocket:

---

Project created with template from [https://github.com/hoppsen/xcode-template](https://github.com/hoppsen/xcode-template).