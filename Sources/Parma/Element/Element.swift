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

/// Markdown elements.
enum Element: Hashable {
    case text, heading, paragraph, list, item, image, strong, emphasis, link, code, unknown, codeBlock, blockQuote
    
    /// If the specific element works as inline.
    var isInline: Bool {
        switch self {
        case .text, .strong, .emphasis, .code:
            return true
        default:
            return false
        }
    }
    
    /// Get `Element` by string. For example, input "strong" will return `Element.strong`.
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
            return Self.heading
        case "paragraph":
            return Self.paragraph
        case "list":
            return Self.list
        case "item":
            return Self.item
        case "image":
            return Self.image
//        case "code_block":
//            return Self.codeBlock
//        case "block_quote":
//            return Self.blockQuote
        default:
            return Self.unknown
        }
    }
    
    /// The readable name for the element.
    func name() -> String {
        switch self {
        case .heading:
            return "heading"
        case .paragraph:
            return "paragraph"
        case .list:
            return "list"
        case .item:
            return "item"
        case .image:
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
}
