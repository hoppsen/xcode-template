#  Extensions

Every extension goes here.

## Naming

We particularly decided against naming it `Object+Xyz.swift` since we would have ended with way too many files. It is just named after the Object it is extending, such as `Date.swift`, `String.swift`, etc.

### Variable Naming

Please use the `as` prefix if we are converting it to another data type.

```swift
extension Date {
    var asString: String { ... }
}
```
