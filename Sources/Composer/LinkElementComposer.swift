//
//  LinkElementComposer.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

class LinkElementComposer: InlineElementComposer {
    var destination: String?
    
    func willStart(in context: ComposingContext) {
        destination = context.attributes["destination"]
    }
    
    func willStop(in context: ComposingContext) {
        destination = nil
    }
    
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text {
        return render.link(textView: context.concatenatedText, destination: destination)
    }
}
