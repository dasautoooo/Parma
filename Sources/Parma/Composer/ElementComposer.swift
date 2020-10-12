//
//  ElementComposer.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
protocol InlineElementComposer: Composer {
    /// Provide relevant information to the render to generate `Text` component.
    /// - Parameters:
    ///   - context: The composing context inside the element.
    ///   - render: A set of delegate methods for generating `View`s.
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text
}

@available(iOS 13.0, macOS 10.15, *)
protocol BlockElementComposer: Composer {
    ///  Provide relevant information to the render to generate `Text` component, if the element has the ability.
    /// - Parameters:
    ///   - context: The composing context inside the element.
    ///   - render: A set of delegate methods for generating `View`s.
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text?
    
    /// Provide relevant information to the render to generate `View` component.
    /// - Parameters:
    ///   - context: The composing context inside the element.
    ///   - render: A set of delegate methods for generating `View`s.
    func view(in context: ComposingContext, render: ParmaRenderable) -> AnyView
}

extension BlockElementComposer {
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text? {
        return nil
    }
}
