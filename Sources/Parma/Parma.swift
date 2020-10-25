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
    private var alignment: HorizontalAlignment = .leading
    
    // MARK: - Public property
    public var body: some View {
        content != nil ? AnyView(VStack(alignment: alignment) { content }) : errorView
    }
    
    // MARK: - Initialization
    
    /// Create a Parma view with markdown string.
    /// - Parameters:
    ///   - markdown: The markdown string for generating Parma view.
    ///   - alignment: The guide for aligning the subviews in this stack. It has the same horizontal screen coordinate for all children. Default is leading alignment.
    ///   - render: Specify a custom render to give the view different appearance. Default is nil, will use `ParmaRender`.
    ///   - errorContent: The content view to display if some error occurred while parsing markdown.
    public init(_ markdown: String, alignment: HorizontalAlignment = .leading, render: ParmaRenderable? = nil, errorContent: ((Error) -> AnyView)? = nil) {
        core = nil
        errorView = nil
        content = nil
        self.alignment = alignment
        
        do {
            core = try ParmaCore(markdown)
            if let render = render {
                core?.render = render
            }
            core?.start()
            content = core?.composedView
        } catch {
            errorView = errorContent?(error)
        }
    }
}
