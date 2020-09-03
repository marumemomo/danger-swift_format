# danger-swift_format

A description of danger-swift_format.

## Installation

    $ gem install danger-swift_format

## Usage

    Methods and attributes from this plugin are available in
    your `Dangerfile` under the `swift_format` namespace.

### example

```Dangerfile:ruby
swift_format.binary_path = ".build/x86_64-apple-macosx/release/swift-format"
swift_format.configuration = "swift-format.json"
swift_format.lint("example/example.swift")
```

#### Attributes

`configuration` - swift-format configuration file path

`binary_path` - swift-format binary path

#### Methods

`lint` - run swift-format lint

`format` - run swift-format format

## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.
