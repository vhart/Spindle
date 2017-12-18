# Spindle

[![CI Status](http://img.shields.io/travis/vhart/Spindle.svg?style=flat)](https://travis-ci.org/vhart/Spindle)
[![Version](https://img.shields.io/cocoapods/v/Spindle.svg?style=flat)](http://cocoapods.org/pods/Spindle)
[![License](https://img.shields.io/cocoapods/l/Spindle.svg?style=flat)](http://cocoapods.org/pods/Spindle)
[![Platform](https://img.shields.io/cocoapods/p/Spindle.svg?style=flat)](http://cocoapods.org/pods/Spindle)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Spindle is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Spindle'
```

### Alternative Installation

The Spindle library is relatively light weight, so one option is to copy the `IdentifiableDispatchQueue` file into your project or workspace.

## IdentifiableDispatchQueue Examples

### Initializing

The `IdentifiableDispatchQueue` mimics the initializers of `DispatchQueue` to make replacing as easy as possible.

Serial Queue

```swift
let serialQueue = IdentifiableDispatchQueue(label: "com.app.serial.queue")
```

Concurrent Queue

```swift
let concurrentQueue = IdentifiableDispatchQueue(label: "com.app.concurrent.queue", 
                                                attributes: [.concurrent])
```

with Quality of Service (qos)

```swift
let concurrentQueue = IdentifiableDispatchQueue(label: "com.app.concurrent.queue", 
                                                qos: .background, 
                                                attributes: [.concurrent])
```

Init with underlying queue (failable initializer)

```
let someQueue = DispatchQueue(label: "com.app.some.queue")
let identifiableQueue: IdentifiableDispatchQueue? = IdentifiableDispatchQueue(underlyingQueue: someQueue)
```

### Possible Uses

Deadlock prevention

```swift
let writeQueue = IdentifiableDispatchQueue(label: "com.app.database-write.queue")

// synchronously write to the database
func write(obj: DBObject) {
    if IdentifiableDispatchQueue.currentQueueIs(writeQueue) {
        save(obj)
    } else {
        writeQueue.queue.sync {
            save(obj)
        }
    }
}

private func save(obj: DBObject) {
  // save
}
```

Queue Assertion

```swift
let commandQueue = IdentifiableDispatchQueue(label: "com.app.command-processing.queue")

func updateCache(obj: SomeObject) {
    commandQueue.queue.async {
      emptyOutdated()
      fillCache(obj)
    }
}

private func emptyOutdated() {
    precondition(IDQ.currentQueueIs(commandQueue), "This method should only be called on the commandQueue") 
}

private func fillCache(obj: SomeObject) {
    precondition(IDQ.currentQueueIs(commandQueue), "This method should only be called on the commandQueue") 
}

```

Debugging

In a situation where threading is heavily used, sometimes it's helpful to be able to tell which queues are causing conflicts or performing stateful mutations.


## Caveats

The only caveat is that you cannot use a default global queues as the underlying queue as all concurrent queues ultimately retarget the global queue with the corresponding Quality of Service (qos). This means that if global queues were allowed to be used as underlying queues, they would cause false positives when passed into the `currentQueueIs` function during execution on a concurrent queue with the same qos.

If you require a queue with a specific qos, simply pass the qos into the IdentifiableDispatchQueue's initializer.  

## License

Spindle is available under the MIT license. See the LICENSE file for more info.

