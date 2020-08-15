//
//  UnknownElementComposer.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

struct UnknownElementComposer: BlockElementComposer {
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text? {
        guard !context.foundCharacters.isEmpty else { return nil }
        return render.plainText(context.foundCharacters)
    }
    
    func view(in context: ComposingContext, render: ParmaRenderable) -> AnyView {
        guard let view = context.views.last else { return AnyView(EmptyView()) }
        context.views = context.views.dropLast()
        return render.paragraphBlock(view: view)
    }
}
