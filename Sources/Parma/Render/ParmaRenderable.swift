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
    /// - Parameter view: The view contains view(s) which belong(s) to this item.
    func listItem(view: AnyView) -> AnyView
    
    /// Define the style of image view.
    /// - Parameter urlString: The url string for this image view.
    func imageView(with urlString: String) -> AnyView
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
    
    public func link(textView: Text, destination: String?) -> Text {
        return textView
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
    
    public func listItem(view: AnyView) -> AnyView {
        let bullet = "•"
        return AnyView(
            HStack(alignment: .top, spacing: 4) {
                Text(bullet)
                view
            }
        )
    }
    
    public func imageView(with urlString: String) -> AnyView {
        return AnyView(
            Text(urlString)
        )
    }
}
