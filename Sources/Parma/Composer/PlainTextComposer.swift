//
//  PlainTextComposer.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

struct PlainTextComposer: InlineElementComposer {
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text {
        render.plainText(context.foundCharacters)
    }
}
