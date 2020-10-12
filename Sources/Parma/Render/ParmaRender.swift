//
//  ParmaRender.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

/// The concrete class of the default render style. Create a new render if custom styles are needed.
public struct ParmaRender: ParmaRenderable { }

public struct BlockQuoteView: View {
    let view: AnyView
    @State var height: CGFloat = 0
    
    public var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width: 8, height: height, alignment: .center)
                .padding(.trailing, 8)
            GeometryReader { geometry in
                view
                    .onAppear {
                        height = geometry.size.height
                        print(height)
                    }
            }
        }
        
//        GeometryReader { geometry in
//            Rectangle()
//                .foregroundColor(.orange)
//                .frame(width: 100, height: 100, alignment: .center)
//                .onAppear {
//                    print(geometry.size.height)
//                }
//        }
        
    }
}
