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

@available(iOS 14.0, *)
protocol InlineElementComposer: Composer {
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text
}

@available(iOS 14.0, *)
protocol BlockElementComposer: Composer {
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text?
    
    func view(in context: ComposingContext, render: ParmaRenderable) -> AnyView
}

extension BlockElementComposer {
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text? {
        return nil
    }
}
