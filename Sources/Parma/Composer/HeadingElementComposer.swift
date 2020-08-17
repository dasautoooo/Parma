//
//  HeadingElementComposer.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

class HeadingElementComposer: BlockElementComposer {
    private var headingLevel: HeadingLevel?
    private var count = 1
    
    func willStart(in context: ComposingContext) {
        headingLevel = HeadingLevel.level(context.attributes["level"] ?? "6")
//        print("\(count) Heading level set to: " + "\(String(describing: headingLevel))")
        count += 1
    }
    
    func willStop(in context: ComposingContext) {
        headingLevel = nil
    }
    
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text? {
        render.heading(level: headingLevel, textView: context.concatenatedText)
    }
    
    func view(in context: ComposingContext, render: ParmaRenderable) -> AnyView {
        guard let view = context.views.last else { return AnyView(EmptyView()) }
        return render.headingBlock(level: headingLevel, view: view)
    }
}
