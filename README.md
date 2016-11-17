<p align="center"><img src="https://github.com/manuelescrig/RhythmBox/blob/master/Slice%201.png?raw=true"></p>

# RhythmBox
A **Rhythm Box** System for your iOS app 🎵. The easiest way to create **Music Rhythm Patterns** in Swift.

[![CI Status](http://img.shields.io/travis/manuelescrig/RhythmBox.svg?style=flat)](https://travis-ci.org/manuelescrig/RhythmBox)
[![Version](https://img.shields.io/cocoapods/v/RhythmBox.svg?style=flat)](http://cocoapods.org/pods/RhythmBox)
[![License](https://img.shields.io/cocoapods/l/RhythmBox.svg?style=flat)](http://cocoapods.org/pods/RhythmBox)
[![Platform](https://img.shields.io/cocoapods/p/RhythmBox.svg?style=flat)](http://cocoapods.org/pods/RhythmBox)
[![Language](https://img.shields.io/badge/language-swift-oragne.svg?style=flat)](https://developer.apple.com/swift)


## What can I do with RhythmBox?
- [x] Generate a BPM or RPM Tempo
- [x] Select the Time Signature
- [x] Create a Rhythm pattern


## Demo Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Getting Started

### Requirements

- iOS 8.0+ / tvOS 9.0+
- Xcode 8.0+
- Swift 3.0+


### Installation with CocoaPods

[CocoaPods](cocoapods.org) is a 3rd-party dependency manager for Swift and Objective-C projects. For more information, refer to the [CocoaPods Getting Started Guide](https://guides.cocoapods.org/using/getting-started.html). Otherwise, you can install CocoaPods with the following command:

```bash
$ gem install cocoapods
```

#### Podfile
To integrate RhythmBox into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
pod 'RhythmBox'
```

Then, run the following command:

```bash
$ pod install
```

###  Installation Manually
To integrate RhythmBox into your Xcode project manually, just include the filest from [/Pod/Classes/](https://github.com/manuelescrig/RhythmBox/tree/master/RhythmBox/Classes) folder in your App’s Xcode project.


## Quick Guide

### Usage

To Generate a constant BPM signal is as simple as this.

###### 1. Import class

```swift
import RhythmBox
```

###### 2. Create a RhythmBox class

```swift
let rhythmBox = RhythmBox(bpm: 120, timeSignature: (4,4))

```

###### 3. Start the Rhythm

```swift
rhythmBox.perform {CurrentBeat, CurrentSubBeat, CurrentNote in

    print("CurrentBeat", CurrentBeat)
    print("CurrentSubBeat", CurrentSubBeat)
    print("CurrentNote", CurrentNote)

    return .resume
}

```

###### 4. Stop the Rhythm 

```swift
rhythmBox.stop()

```


### Examples

###### Example 1

Create a 120 BPM signal with a block.

```swift

let rhythmBox = RhythmBox(bpm: 120)
rhythmBox.perform {CurrentBeat, CurrentSubBeat, CurrentNote in

    print("CurrentBeat", CurrentBeat)
    return .resume
}


```


###### Example 2

Create a 150 BPM signal with a time signature of 6/8 with default subdivision of <img src="https://github.com/manuelescrig/RhythmBox/blob/master/Resources/1.png">.

```swift

let rhythmBox = RhythmBox(bpm: 150, timeSignature: (6,8))
rhythmBox.perform {CurrentBeat, CurrentSubBeat, CurrentNote in

    print("CurrentBeat", CurrentBeat)
    return .resume
}


```
♪

###### Example 3

Create a 90 BPM signal with a time signature of 3/4 and subdivision of <img src="https://github.com/manuelescrig/RhythmBox/blob/master/Resources/2.png">


```swift

let rhythmBox = RhythmBox(bpm: 90, timeSignature: (3,4), subdivision: "11")
rhythmBox.perform {CurrentBeat, CurrentSubBeat, CurrentNote in

    print("CurrentBeat", CurrentBeat)
    return .resume
}


```

###### Example 4

Create a 90 BPM signal with a time signature of 3/4 and subdivision of <img src="https://github.com/manuelescrig/RhythmBox/blob/master/Resources/3.png">

```swift

let rhythmBox = RhythmBox(bpm: 90, timeSignature: (3,4), subdivision: "111")
rhythmBox.perform {CurrentBeat, CurrentSubBeat, CurrentNote in

    print("CurrentBeat", CurrentBeat)
    return .resume
}


```

###### Example 5

Create a 90 BPM signal with a time signature of 3/4 and subdivision of <img src="https://github.com/manuelescrig/RhythmBox/blob/master/Resources/3b.png">

```swift

let rhythmBox = RhythmBox(bpm: 90, timeSignature: (3,4), subdivision: "011")
rhythmBox.perform {CurrentBeat, CurrentSubBeat, CurrentNote in

    print("CurrentBeat", CurrentBeat)
    return .resume
}


```

###### Example 6

Create a 90 BPM signal with a time signature of 3/4 and subdivision of <img src="https://github.com/manuelescrig/RhythmBox/blob/master/Resources/4.png">

```swift

let rhythmBox = RhythmBox(bpm: 90, timeSignature: (3,4), subdivision: "10111")
rhythmBox.perform {CurrentBeat, CurrentSubBeat, CurrentNote in

    print("CurrentBeat", CurrentBeat)
    return .resume
}


```


## Roadmap
- [x] CocoaPods support
- [ ] Carthage support
- [ ] Swift Package Manager support
- [ ] Tests

## Change Log

See [Changelog.md](https://github.com/manuelescrig/RhythmBox/blob/master/CHANGELOG.md)

## Contribute

Contributions are welcomed and encouraged 💜.

## Author

- Manuel Escrig Ventura, [@manuelescrig](https://www.twitter.com/manuelescrig/)
- Email [manuel@ventura.media](mailto:manuel@ventura.media)
- Portfolio [http://ventura.media](http://ventura.media)


## License

RhythmBox is available under the MIT license. See the [LICENSE](https://github.com/manuelescrig/RhythmBox/blob/master/LICENSE) file for more info.
