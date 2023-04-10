# Coding Styles Guide

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

# Git Workflow Guide

## Routine to do

1. Make sure branch 'main' is up to date
```
$ git checkout main
$ git pull
```
2. Create a new branch i.e. `feature` / `bugfix`
```
$ git branch feature/CameraView
$ git checkout feature/CameraView
```
3. Make a commit i.e. `git commit -m "add CameraView"`
4. Resolve conflict between branch `main` and branch `feature/CameraView`
```
# Make sure branch 'main' is up to date
$ git checkout main
$ git pull

# Go back to branch feature/CameraView
$ git checkout feature/CameraView
$ git rebase main
```
5. Upload the changes to GitHub.com repository
```
$ git push
```
6. Create a PR to merge branch `feature/CameraView` to branch `main` in [the GitHub.com's repository](https://github.com/Step-Point/CoreDataExample)
7. Ask others to review the code
8. Let others to `Rebase and merge` the code into branch `feature/CameraView` to branch `main`.
