# Parma
Display Markdown using pure SwiftUI components. Taking advantages of `ViewBuilder` to make custom appearances for `Text` and `View`.

## Example
```swift
import Parma

struct ContentView: View {
    var markdown = "I'm **Strong**."
    
    var body: some View {
        Parma(markdown)
    }
}
```
For more examples, please refer to [demo][1] app.

## Markdown Support
### Already Supported
* Heading level 1-6
* Paragraph
* Multi-level bullet list
* Multi-level ordered list
    * Period delimiter
    * Parenthesis delimiter
* Image (Needs extra configurations)
* Inline text
    * Strong
    * Emphasis
    * Code

### Possibly Support in Future Versions
* Divider
* Block quote
* Code block

### Unsupported
* Inline hyperlink

## Installation
### Requirement
* Xcode 11.0 or later
* Swift 5 or later
* iOS 13.0 / macOS 10.15 or later deployment targets

### Swift Package Manager
[Swift Package Manager][2] is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies on all platforms.

Adding `Parma` as a dependency by [using Xcode’s GUI][3], the package url is `https://github.com/dasautoooo/Parma` .

### CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `Parma` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Parma'
```


## Appearance Customization
To customize `Text` styles and `View`s, create a new render which conform to protocol `ParmaRenderable`, and only reimplement those that fit your purposes. Finally, assign the customized render as a new render when create `Parma` view.

```swift
import Parma

struct ContentView: View {
    var markdown = "I'm **Strong**."
    
    var body: some View {
        Parma(markdown, render: MyRender())
    }
}

struct MyRender: ParmaRenderable {
    ...
}
```

There's a [DemoApp][4] that modified some of these delegate methods below for everyone to take as a reference.

```swift
/// Define the heading text style.
/// - Parameters:
///   - level: The level of heading.
///   - textView: The textView generated from captured heading string.
func heading(level: HeadingLevel?, textView: Text) -> Text

/// Define the paragraph text style.
/// - Parameter text: The text string captured from paragraph.
func paragraph(text: String) -> Text

/// Define the text style for plain text. Do NOT recommend to alter this if there's no special purpose.
/// - Parameter text: The text string captured from markdown.
func plainText(_ text: String) -> Text

/// Define the strong text style.
/// - Parameter textView: The textView generated from captured strong string.
func strong(textView: Text) -> Text

/// Define the emphasis text style.
/// - Parameter textView: The textView generated from captured emphasis string.
func emphasis(textView: Text) -> Text

/// Define the link text style.
/// - Parameters:
///   - textView: The textView generated from captured link string.
///   - destination: The destination of the link.
func link(textView: Text, destination: String?) -> Text

/// Define the code text style.
/// - Parameter text: The text string captured from code.
func code(_ text: String) -> Text

/// Define the style of heading view.
/// - Parameters:
///   - level: The level of heading.
///   - view: The view contains heading text.
func headingBlock(level: HeadingLevel?, view: AnyView) -> AnyView

/// Define the style of paragraph view.
/// - Parameter view: The view contains view(s) which belong(s) to this paragraph.
func paragraphBlock(view: AnyView) -> AnyView

/// Define the style of list item.
/// - Parameter attributes: Attributes of the list containing the item. Those must be considered for proper item rendering.
/// - Parameter index: Normalized index of the list item. For exemple, the index of the third item of a one level list would be `[2]` and the second item of a sublist appearing fourth in it's parent list would be `[3, 1]`.
/// - Parameter view: The view contains view(s) which belong(s) to this item.
func listItem(attributes: ListAttributes, index: [Int], view: AnyView) -> AnyView

/// Define the style of image view.
/// - Parameter urlString: The url string for this image view.
/// - Parameter altTextView: The view contains alt text.
func imageView(with urlString: String, altTextView: AnyView?) -> AnyView
```

## Name Origin
[Parma][5] is a city in the northern Italy, which is famous for its architecture, music and art. The reason of choosing this city name as the project name is [Giambattista Bodoni][6], a famous typographer, who spent most his lifetime living and working in this city.

Bodoni was an Italian typographer, type-designer in Parma. During his lifespan, he designed many typefaces that known as [Bodoni][7] nowadays. Each Mac has Bodoni font installed, and free to use.

## Credit
The package is built upon [Down][8], which is a markdown parser in Swift.

[1]:	https://github.com/dasautoooo/ParmaDemo
[2]:	https://swift.org/package-manager/
[3]:	https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
[4]:	https://github.com/dasautoooo/ParmaDemo
[5]:	https://en.wikipedia.org/wiki/Parma
[6]:	https://en.wikipedia.org/wiki/Giambattista_Bodoni
[7]:	https://en.wikipedia.org/wiki/Bodoni
[8]:	https://github.com/iwasrobbed/Down
