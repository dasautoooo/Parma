//
//  ImageElementComposer.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

class ImageElementComposer: BlockElementComposer {
    private var startIndex: Int = 0
    private var destination = ""
    
    func willStart(in context: ComposingContext) {
        startIndex = context.views.count
        destination = context.attributes["destination"] ?? ""
    }
    
    func willStop(in context: ComposingContext) {
        destination = ""
        startIndex = 0
    }
    
    func view(in context: ComposingContext, render: ParmaRenderable) -> AnyView {
        if startIndex == context.views.count {
            // No alt text
            return render.imageView(with: destination, altTextView: nil)
        } else {
            // Has alt text
            let altTextView = context.views.last
            context.views = context.views.dropLast()
            return render.imageView(with: destination, altTextView: altTextView)
        }
    }
}
