//
//  DividerElementComposer.swift
//  Parma
//
//  Created by leonard on 9/26/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

struct DividerElementComposer: BlockElementComposer {
    func view(in context: ComposingContext, render: ParmaRenderable) -> AnyView {
        return render.divider()
    }
}
