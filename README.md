# miniapp-swiftui-sdk

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Description](#description)
4. [Usage](#usage)
5. [Support](#support)
6. [Roadmap](#roadmap)

## Introduction

This library is an extension to [miniapp-core-sdk](https://github.com/stanydsouza/miniapp-core-sdk.git) library along with `SwiftUI` Navigation logic to peform navigation between diffrent MiniApp's. This library consists the `miniapp_core` & `miniapp_swiftui` framework.

## Installation

### Swift Package Manager

To integrate `miniapp_swiftui` SDK into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/stanydsouza/miniapp-swiftui-sdk.git", .upToNextMajor(from: "0.0.1"))
]
```

### Requirements

Swift Version: 5.10

| Supported Platform | Min. Version |
| ------------------ | ------------ |
| macOS              |    13.0      |
| iOS                |    16.0      |
| tvOS               |    16.0      |
| watchOS            |    9.0       |

&nbsp;

## Description

The `miniapp_swiftui` framework implements the navigation logic for the Navigation module of [miniapp-core-sdk](https://github.com/stanydsouza/miniapp-core-sdk.git).

### MiniAppContainer

It's SwiftUI View which manages the naviagtion bewtween the MiniApps's.

```swift
public struct MiniAppContainer : View {
    public init(
        rootView: any View, // Initial View to be shown 
        miniApps: [any MiniApp] // List of MiniApp's
    )
}
```

```swift
public protocol MiniApp {
    var name: String { get } // Name of the MiniApp
    var view: any View { get } // View object for the MiniApp
}
```

&nbsp;

## Usage

```swift
// Views & MiniApps
import SwiftUI

struct SplashView: View {
    ...
}

struct LoginView: View {
    ...
}

struct HomeView: View {
    ...
}

struct LoginMiniApp: MiniApp {
    var name: String = "Login"
    var viewController: any View = LoginView()
}

struct HomeMiniApp: MiniApp {
    var name: String = "Home"
    var viewController: any View = HomeView()
}
```

In our main app body we assign the `MiniAppContainer`

```swift
@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            MiniAppContainer(
                rootView: SplashView(),
                miniApps: [
                    LoginMiniApp(),
                    HomeMiniApp(),
                ]
            )
        }
    }
}
```

In `SplashView`, we can configure the routing data & show the first view

```swift
import miniapp_core

struct SplashView: View {
    var body: some View {
        ..... // Some content
            .onAppear {
                // Get the routing json logic
                
                MiniAppCore.Navigation.configRouters(routers: json, currentMiniApp: "Login")
            }
    }
}
```

&nbsp;

## Support

Email: <stanydsouza93@gmail.com>

&nbsp;

## Roadmap

- Swift 6 support

&nbsp;

## License

MIT License
