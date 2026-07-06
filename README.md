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

    Ideally it show you something like this (Required: `>= 3.3.0`):

    ```sh
    ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin23]
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

7. Rename the whole project to a name of your choice.

    ```sh
    bundle exec fastlane rename new_name:Hoppsen
    ```

8. Validate all name changes within Git

9. Run our guided setup script.

    ```sh
    bundle exec fastlane setup
    ```

10. Open `Template.xcodeproj`

11. Start coding :rocket:

---

Project created with template from [https://github.com/hoppsen/xcode-template](https://github.com/hoppsen/xcode-template).
