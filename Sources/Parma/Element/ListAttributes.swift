//
//  ListAttributes.swift
//  Parma
//
//  Created by Antoine Lamy on 5/13/21.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import Foundation

/// Attributes used to display a list element.
public struct ListAttributes {
    /// Type of the list, can either be ordered or non-ordered (bullet)
    public internal(set) var type: ListType

    /**
     Type of delimiter to use in the case of an ordered list.

     A dot list delimiter should produce a list like:
     ~~~
        1. Item 1
        2. Item 2
        3. Item 3
     ~~~

     While a parenthesis list delimiter should produce a list like:
     ~~~
        1) Item 1
        2) Item 2
        3) Item 3
     ~~~
     */
    public internal(set) var delimiter: ListDelimiter

    static var defaultAttributes: ListAttributes {
        ListAttributes(type: .bullet, delimiter: .period)
    }
}
