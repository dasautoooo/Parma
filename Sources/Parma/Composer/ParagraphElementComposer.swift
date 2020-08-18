//
//  ParagraphElementComposer.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

class ParagraphElementComposer: BlockElementComposer {
    private var index = [Int]()
    
    func willStart(in context: ComposingContext) {
        index.append(context.views.count)
    }
    
    func willStop(in context: ComposingContext) {
        index = index.dropLast()
    }
    
    func view(in context: ComposingContext, render: ParmaRenderable) -> AnyView {
        let maxIndex = context.views.count
        let minIndex = index.last!
        
        // Get every view inside this element scope
        let views = Array(context.views[minIndex..<maxIndex])
        
        // Remove those views from context
        context.views = context.views.dropLast(maxIndex-minIndex)

        if views.count == 1, let view = views.first {
            return render.paragraphBlock(view: view)
        } else if views.count > 1 {
            let count = views.count
            return render.paragraphBlock(view: AnyView(
                VStack(alignment: .leading) {
                    ForEach(0..<count, id: \.self) { index in
                        views[index]
                    }
                }
            ))
        } else {
            return render.paragraphBlock(view: AnyView(EmptyView()))
        }
    }
}
