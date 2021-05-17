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
    public internal(set) var type: ListType
    public internal(set) var delimiter: ListDelimiter

    static var defaultAttributes: ListAttributes {
        ListAttributes(type: .bullet, delimiter: .period)
    }
}
