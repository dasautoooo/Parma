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

## Markdown Support

### Already Supported
* Heading level 1-6
* Paragraph
*  Multi-level bullet list
* Image (Needs extra configurations)
* Inline text
	* Strong
	* Emphasis
	* Code
	
### Possibly Support in Future Versions
* Divider
* Multi-level ordered list
* Block quote
* Code block

### Unsupported
* Inline hyperlink

## Installation
### Requirement
* Xcode 12.0 or later
* Swift 5 or later
* iOS 14 / macOS 11.0 or later deployment targets

### Swift Package Manager
[Swift Package Manager][1] is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies on all platforms.

Adding `Parma` as a dependency by [using Xcode’s GUI][2], the package url is `https://github.com/dasautoooo/Parma` .

## Appearance Customization
To be added.

## Name Origin
[Parma][3] is a city in the northern Italy, which is famous for its architecture, music and art. The reason of choosing this city name as the project name is that there was a famous typographer spent most his lifetime living and working in this city - [Giambattista Bodoni][4].

Bodoni was an Italian typographer, type-designer in Parma. During his lifespan, he designed many typefaces that known as [Bodoni][5] nowadays. Each Mac has Bodoni font installed.

## Contributing
To be added.

## Credit
The package is built upon [Down][6], which is a markdown parser in Swift.

[1]:	https://swift.org/package-manager/
[2]:	https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
[3]:	https://en.wikipedia.org/wiki/Parma
[4]:	https://en.wikipedia.org/wiki/Giambattista_Bodoni
[5]:	https://en.wikipedia.org/wiki/Bodoni
[6]:	https://github.com/iwasrobbed/Down
