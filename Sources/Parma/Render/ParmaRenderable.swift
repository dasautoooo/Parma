//
//  ParmaRenderable.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

/// The appearance of each element. Create a custom render then conform to this protocol.
public protocol ParmaRenderable {
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
    
    /// Define the style of link view.
    /// - Parameter urlString: The url string for the link destination.
    /// - Parameter altTextView: The view contains link text.
    func linkView(with urlString: String, altTextView: AnyView?) -> AnyView
    
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
}

// MARK: - Default render style
extension ParmaRenderable {
    public func plainText(_ text: String) -> Text {
        Text(text)
    }
    
    public func strong(textView: Text) -> Text {
        textView.bold()
    }
    
    public func emphasis(textView: Text) -> Text {
        textView.italic()
    }
    
    public func linkView(with urlString: String, altTextView: AnyView?) -> AnyView {
        if urlString.isEmpty {
            return altTextView ?? AnyView(EmptyView())
        } else {
            return AnyView(Text(urlString))
        }
    }
    
    public func code(_ text: String) -> Text {
        Text(text).font(.system(.body, design: .monospaced))
    }
    
    public func heading(level: HeadingLevel?, textView: Text) -> Text {
        switch level {
        case .one:
            return textView.font(.largeTitle)
        case .two:
            return textView.font(.title)
        default:
            return textView.font(.title)
        }
    }
    
    public func paragraph(text: String) -> Text {
        Text(text).font(.body)
    }

    public func headingBlock(level: HeadingLevel?, view: AnyView) -> AnyView {
        AnyView(view.padding(.bottom, 12))
    }
    
    public func paragraphBlock(view: AnyView) -> AnyView {
        AnyView(view.fixedSize(horizontal: false, vertical: true).padding(.bottom, 8))
    }
    
    public func listItem(attributes: ListAttributes, index: [Int], view: AnyView) -> AnyView {
        let delimiter: String
        switch attributes.delimiter {
        case .period:
            delimiter = "."
        case .parenthesis:
            delimiter = ")"
        }

        let separator: String
        switch attributes.type {
        case .bullet:
            separator = index.count % 2 == 1 ? "•" : "◦"
        case .ordered:
            separator = index
                .map({ String($0) })
                .joined(separator: ".")
                .appending(delimiter)
        }

        return AnyView(
            HStack(alignment: .top, spacing: 4) {
                Text(separator)
                view
            }
        )
    }
    
    public func imageView(with urlString: String, altTextView: AnyView?) -> AnyView {
        if urlString.isEmpty {
            return altTextView ?? AnyView(EmptyView())
        } else {
            return AnyView(Text(urlString))
        }
    }
}
