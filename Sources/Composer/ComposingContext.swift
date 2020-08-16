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

@available(iOS 14.0, *)
class ComposingContext {
    var stack = [Element]()
    var foundCharacters: String = ""
    var texts = [Text]()
    var views = [AnyView]()
    var attributes = [String : String]()
    
    var superElement: Element? {
        let count = stack.count - 2
        if count >= 0 && !stack.isEmpty {
            return stack[count]
        } else {
            return nil
        }
    }
    
    var currentElement: Element? {
        return stack.last
    }
    
    var didFindCharacters: Bool {
        return foundCharacters != ""
    }
    
    var concatenatedText: Text {
        return texts.reduce(Text(""), +)
    }
    
    func enter(in element: Element) {
        stack.append(element)
    }
    
    func leaveElement() {
        stack = stack.dropLast()
    }
    
    func clear() {
        stack = []
        foundCharacters = ""
        texts = []
        attributes = [:]
    }
}
