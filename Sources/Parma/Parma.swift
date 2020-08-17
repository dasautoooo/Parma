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
    // MARK: - Property
    private var core: ParmaCore?
    private var errorView: AnyView?
    private var content: AnyView?
    
    // MARK: - Public property
    public var body: some View {
        if content != nil {
            return content
        } else {
            return errorView
        }
    }
    
    // MARK: - Initialization
    
    /// Create a Parma view with markdown string.
    /// - Parameters:
    ///   - markdown: The markdown string for generating Parma view.
    ///   - render: Specify a custom render to give the view different appearance. Default is nil, will use `ParmaRender`.
    ///   - errorContent: The content view to display if the given markdown string is invalid.
    public init(markdown: String, render: ParmaRenderable? = nil, errorContent: (Error) -> AnyView) {
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
}
