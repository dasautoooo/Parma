//
//  HeadingLevel.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import Foundation

/// The markdown heading levels.
public enum HeadingLevel: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    
    /// Get `HeadingLevel` by string. For example, input "1" will return `HeadingLevel.one`.
    static func level(_ text: String) -> HeadingLevel {
        switch text {
        case "1":
            return Self.one
        case "2":
            return Self.two
        case "3":
            return Self.three
        case "4":
            return Self.four
        case "5":
            return Self.five
        case "6":
            return Self.six
        default:
            fatalError("Invalid heading level.")
        }
    }
}
