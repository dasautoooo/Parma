//
//  Parma.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

public struct Parma: View {
    private var core: ParmaCore?
    private var errorView: AnyView?
    private var content: AnyView?
    
    public init(markdown: String, render: ParmaRenderable?, errorContent: (Error) -> AnyView) {
        core = nil
        errorView = nil
        content = nil
        
        do {
            core = try ParmaCore(markdown: markdown)
            if let render = render {
                core?.render = render
            }
            core?.start()
            content = core?.composedView
        } catch {
            errorView = errorContent(error)
        }
    }
    
    public var body: some View {
        if content != nil {
            return content
        } else {
            return errorView
        }
    }
}
