# LumberMill
> Stupidly Simple Logging for iOS.

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  

LumberMill is a simple logging library for iOS 10 and Swift 3.0. It allows users to Log files with 5 different levels and to set the minimum log level that will be recorded


## Features

- [x] Multiple Log Levels
- [x] Minimum Log Level (Optional)

## Requirements

- iOS 9.0+
- Swift 3.0
- Xcode 8.0

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `LumberMill` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'LumberMill'
```

#### Manually
1. Download and drop ```LumberMill.swift``` in your project.  
2. Congratulations!  

## Usage example

```swift
import LumberMill
let logger = LumberMill()

log.Debug("Debugging statement")
```

## Contribute

We would love for you to contribute to **YourLibraryName**, check the ``LICENSE`` file for more info.

## Meta

David Baldwynn – [@davidbaldwynn](https://twitter.com/davidbaldwynn) – polydaic@gmail.com
Gabriel Uribe - [Personal Site](http://gabrieluribe.me/) - gabrieluribe@me.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE

## License

LumberMill is available under the MIT license. See the LICENSE file for more info.
