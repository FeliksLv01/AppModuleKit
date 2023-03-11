# AppModule

Split AppDelegate Into Different Modules，Help You To Implement Componentization

- provide application lifecycle methods to modules

## How To Use

1. Make your `AppDelegate` extends `AppModuleApplicationDelegate`
2. Module definition, implementation application lifecycle func
3. Add your app module before calling `super.application(application, didFinishLaunchingWithOptions: launchOptions)`

```swift
class TestModule: NSObject, AppModuleProtocol {
    required init(with data: [String : Any]?) {
        super.init()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("load TestModel")
        return true
    }
}

@UIApplicationMain
class AppDelegate: AppModuleApplicationDelegate {
    var window: UIWindow?

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppModuleCenter.shared.addModule(TestModule.self)
        AppModuleCenter.shared.addModule(TestErrorModule.self)

        super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}
```
 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AppModule is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppModule'
```
