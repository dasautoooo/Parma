//
//  Composer.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import Foundation

@available(iOS 13.0, macOS 10.15, *)
protocol Composer {
    /// This method will be called right after entering the element. Context is updated to this element. Store everything needed in this delegate method.
    /// - Parameter context: The context needed to compose a view.
    func willStart(in context: ComposingContext)
    
    /// This method will be called right before leaving the element. Context is unpredictable here, it might be empty or ready for composing the next element, so do not access or modify it if there's no special purpose. Recommend to clear things for composer itself in this method.
    /// - Parameter context: The context for composing views.
    func willStop(in context: ComposingContext)
}

extension Composer {
    func willStart(in context: ComposingContext) { }
    
    func willStop(in context: ComposingContext) { }
}
