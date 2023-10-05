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

### ios create_app

```sh
[bundle exec] fastlane ios create_app
```

Step 2. Create certificates and Provisioning Profiles

Step 4. Build and codesign

Step 5. Submit binaries to the App Store Connect

Create the app on App Store Connect and Apple Developer portal

### ios signinig

```sh
[bundle exec] fastlane ios signinig
```

Create Certificates and Provisioning Profiles

### ios check_code_quality

```sh
[bundle exec] fastlane ios check_code_quality
```

Check code quality by reviewing its testability

### ios lint

```sh
[bundle exec] fastlane ios lint
```

Checking code style and conventions report to 

### ios test

```sh
[bundle exec] fastlane ios test
```

Running tests, returns code covarage report to ./fastlane/test_output

### ios build_release

```sh
[bundle exec] fastlane ios build_release
```

Deploying a new prduction version to AppStore

### ios build_beta

```sh
[bundle exec] fastlane ios build_beta
```

Deploying a new beta version to TestFlight

### ios build

```sh
[bundle exec] fastlane ios build
```

Build relese or beta version of the app

### ios message_logs

```sh
[bundle exec] fastlane ios message_logs
```

Execute when error an occurs in any of the block, lane

UI message log examples

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
