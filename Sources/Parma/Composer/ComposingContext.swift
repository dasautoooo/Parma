//
//  ComposingContext.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
class ComposingContext {
    /// Element stack.
    var stack = [Element]()
    
    /// Characters found in xml parser delegate.
    var foundCharacters: String = ""
    
    /// A set of `Text` for composing inline or block element which has the ability to compose `Text`.
    var texts = [Text]()
    
    /// A set of `AnyView` for composing block element.
    var views = [AnyView]()
    
    /// The element attributes.
    var attributes = [String : String]()

    /// Attributes required to display list elements
    var listAttributesStack: [ListAttributes] = []
    
    /// Return the element which wrapped the current element if possible.
    var superElement: Element? {
        let count = stack.count - 2
        if count >= 0 && !stack.isEmpty {
            return stack[count]
        } else {
            return nil
        }
    }
    
    /// The current processing element.
    var currentElement: Element? {
        return stack.last
    }
    
    /// If the xml parser found new characters.
    var didFindCharacters: Bool {
        return foundCharacters != ""
    }
    
    /// Combine all `Text` in the context into one `Text` component.
    var concatenatedText: Text {
        return texts.reduce(Text(""), +)
    }
    
    /// Push a new element to the element stack.
    func enter(in element: Element) {
        stack.append(element)
    }
    
    /// Pop the last element in the element stack.
    func leaveElement() {
        stack = stack.dropLast()
    }
}
