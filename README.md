# swift-gem-poc

This project is a POC to work through the process of building a Ruby gem that utilizes code written in Swift.

## Requirements
You'll need a Swift toolchain and a C compiler. Clang is included with the Swift toolchain if you don't have a preference for another one.

## Implementation Details

- The core implementation is a Counter class implemented in pure Swift.
- The implementation is bridged to C using wrapper functions annotated with `@_cdecl`. These wrapper functions are representable and callable in C. They utilize opaque pointers passed through the Swift/C boundary.
- There is a hand written header file that outlines the C contract exposed from the Swift bridge.
- The functions from the header file are wrapped with Ruby C API glue code to make them useable within the context of Ruby.

## Cross Platform Support
As of now, this project works on macOS as well as Linux. Windows support may be explored later.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
