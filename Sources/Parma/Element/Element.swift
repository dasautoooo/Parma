//
//  Element.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import Foundation

enum Element: Hashable {
    case text, heading(level: HeadingLevel?), paragraph, list(type: ListType?), item, image(destination: String?), strong, emphasis, link, code, unknown, codeBlock, blockQuote
    
    var isInline: Bool {
        switch self {
        case .text, .strong, .emphasis, .link, .code:
            return true
        default:
            return false
        }
    }
    
    static func element(_ elementText: String) -> Element {
        switch elementText {
        case "text":
            return Self.text
        case "strong":
            return Self.strong
        case "emph":
            return Self.emphasis
        case "link":
            return Self.link
        case "code":
            return Self.code
        case "heading":
            return Self.heading(level: nil)
        case "paragraph":
            return Self.paragraph
        case "list":
            return Self.list(type: nil)
        case "item":
            return Self.item
        case "image":
            return Self.image(destination: nil)
//        case "code_block":
//            return Self.codeBlock
//        case "block_quote":
//            return Self.blockQuote
        default:
            return Self.unknown
        }
    }
    
    func name() -> String {
        switch self {
        case .heading(_):
            return "heading"
        case .paragraph:
            return "paragraph"
        case .list(_):
            return "list"
        case .item:
            return "item"
        case .image(_):
            return "image"
        case .text:
            return "text"
        case .strong:
            return "strong"
        case .emphasis:
            return "emph"
        case .code:
            return "code"
        case .link:
            return "link"
//        case .codeBlock:
//            return "code_block"
//        case .blockQuote:
//            return "block_quote"
        default:
            return "unknown"
        }
    }
    
    static func == (lhs: Element, rhs: Element) -> Bool {
        return lhs.name() == rhs.name()
    }
}
