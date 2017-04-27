# ios-swift-logger
Swift logger created with requirements [here](http://tools.innominds.com/ideapp/pages/view/cf2363f9d9144aed48927f41958b6dab13e77ba0174bef43b0d7d76958251b72)

### Installation
Simply download the `Logger.swift` file from the repository. 

### Usage

* There are 4 log levels to choose from `verbose`, `info`, `debug`, `error`
* Default value for log level is `debug`
* Change the log level:
    ```swift
    Logger.sharedInstance.logLevel = .verbose

    ```
* To log,
```swift
Logger.shared.debug("Some debugging information",someParam)
Logger.shared.verbose("Some verbose information",someOtherParam)
```

