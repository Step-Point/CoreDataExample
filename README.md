## **Naming convention**
1. Uppercase first letter for **public** variable and lowercase first letter for **private** variable.
2. Use `_` at the end of the variable name to **indicate** it as a class variable.

```
public struct ContentView {
    private var names_: [String]
    public var Items_: [Int8]
}
```

## Initialize **class** variable in constructor

```
public struct ContentView {
    private var names_: [String]
    public var Items_: [Int8]
    
    public init() {
        self.names_ = ["A","B","C"]
        self.Items_ = [0,1,2]
    }
    
    public func PrintItems() -> Void
    {
        for item in Items_ {
            print(item)
        }
    }
}
```

## Initialize **static** variable and method in a **Helper file**
1. use `enum` keyword to store static variable and method.
2. use `static` keyword to define the variable and method as static.
3. use `let` keyword to define the variable as non-changeable.
4. use uppercase letters for the variable name to **indicate** it as a static variable.

ContentViewHelper.swift
```
public enum ContentViewHelper {
    public static let ITEMS: [Int8] = [0,1,2,3]
    
    public static func PrintItems() -> Void {
        for item in ITEMS {
            print(item)
        }
    }
}
```
