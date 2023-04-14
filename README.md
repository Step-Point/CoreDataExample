# Coding Styles Guide

## **Naming convention**
1. Uppercase first letter for **class public** variable and lowercase first letter for **class private** variable.
2. Use `_` at the end of the variable name to **indicate** it as a class variable.

```
public struct Model {
    private var names_: [String]
    public var Items_: [Int8]
}
```

## Initialize **class** variable in constructor

```
public struct Model {
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

ModelHelper.swift
```
public enum ModelHelper {
    public static let ITEMS: [Int8] = [0,1,2,3]
    
    public static func PrintItems() -> Void {
        for item in ITEMS {
            print(item)
        }
    }
}
```

## Model, View, ViewModel Design Pattern
1. View is the view:
    1. View have class variable `public var body: some View`
    
    GreetingView.swift
    ```
    public struct GreetingView: View {
        @State private var greeting_: String
        
        public init() {
            self.greeting_ = "Hello world!"
        }

        public var body: some View {
            Text(self.greeting_)
        }
    }
    ```
    2. View have listener to respond to user interactions i.e. `.onTapGesture`
    
    GreetingView.swift
    ```diff
    public struct GreetingView: View {
        @State private var greeting_: String
        
        public init() {
            self.greeting_ = "Hello world!"
        }

        public var body: some View {
            Text(self.greeting_)
    +           .onTapGesture {
    +               self.greeting_ = self.greeting_ == "Hello world!" ? "Hello SwiftUI!" : "Hello world!"
    +           }
        }
    }
    ```
2. Model is to store data. Model have class variable (the data) and method to access and manipulate the variable.

GreetingModel.swift
```
public struct GreetingModel {
    public var Greeting_: String
    
    public init() {
        self.Greeting_ = "Hello world!"
    }
}
```

GreetingView.swift
```diff
public struct GreetingView: View {
-   @State private var greeting_: String
+   @State private var model_: GreetingModel
    
    public init() {
-       self.greeting_ = "Hello world!"
+       self.model_ = GreetingModel()
    }

    public var body: some View {
-       Text(self.greeting_)
+       Text(self.model_)
            .onTapGesture {
-               self.greeting_ = self.greeting_ == "Hello world!" ? "Hello SwiftUI!" : "Hello world!"
+               self.model_.greeting_ = self.model_.greeting_ = "Hello world!" ? "Hello SwiftUI!" : "Hello world!"
            }
    }
}
```
3. ViewModel contains the business logic of the application and serves as a bridge between the View and the Model.
    1. ViewModel provides data and behavior to the View through variables and methods.

    GreetingViewModel.swift
    ```
    public class GreetingViewModel: ObservableObject {
        @Published private var model_: GreetingModel
        
        public init() {
            self.model_ = GreetingModel()
        }
        
        public func GetGreeting() -> String {
            return self.model_.Greeting_
        }
        
        public func UpdateGreeting() {
            self.model_.Greeting_ = self.model_.Greeting_ == "Hello world!" ? "Hello SwiftUI!" : "Hello world!"
        }
    }
    ```
    
    GreetingView.swift
    ```diff
    public struct GreetingView: View {
    -   public var model_: GreetingModel
    +   @StateObject private var viewModel_: GreetingViewModel

        public init() {
    -       self.model_ = GreetingModel()
    +       self._viewModel_ = StateObject(wrappedValue: GreetingViewModel())
        }
        
        public var body: some View {
    -       Text(self.model_.Greeting_)
    +       Text(self.viewModel_.GetGreeting())
                .onTapGesture {
    -               self.model_.Greeting_ = self.model_.Greeting_ == "Hello world!" ? "Hello SwiftUI!" : "Hello world!"
    +               self.viewModel_.UpdateGreeting()
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
