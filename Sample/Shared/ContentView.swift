//
//  ContentView.swift
//  Parma
//
//  Created by leonard on 8/20/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI
import Parma

struct ContentView: View {
    @State var markdown: String = ""

    var body: some View {
        ScrollView {
            Parma(markdown)
                .padding(.horizontal, 24)
        }
        .onAppear {
            let url = Bundle.main.url(forResource: "SampleMarkdown", withExtension: "md")!
            markdown = try! String(contentsOf: url)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyRender: ParmaRenderable {
    func heading(level: HeadingLevel?, textView: Text) -> Text {
        switch level {
        case .one:
            return textView.font(.system(.largeTitle, design: .serif)).bold()
        case .two:
            return textView.font(.system(.title, design: .serif)).bold()
        case .three:
            return textView.font(.system(.title2)).bold()
        default:
            return textView.font(.system(.title3)).bold()
        }
    }
    
    func headingBlock(level: HeadingLevel?, view: AnyView) -> AnyView {
        switch level {
        case .one, .two:
            return AnyView(
                VStack(alignment: .leading, spacing: 2) {
                    view
                        .padding(.top, 4)
                    Rectangle()
                        .foregroundColor(.pink)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1, alignment: .center)
                        .padding(.bottom, 8)
                }
            )
        default:
            return AnyView(view.padding(.bottom, 4))
        }
    }
    
    public func paragraphBlock(view: AnyView) -> AnyView {
        struct ExpandableView: View {
            @State var lineLimit: Int? = nil
            let view: AnyView
            
            var body: some View {
                view
                    .lineLimit(lineLimit)
                    .padding(.bottom, 8)
                    .onTapGesture {
                        if lineLimit == nil {
                            lineLimit = 1
                        } else {
                            lineLimit = nil
                        }
                    }
            }
        }
        
        //        AnyView(view.padding(.bottom, 8))
        return AnyView(ExpandableView(view: view))
    }
    
    
    func listItem(attributes: ListAttributes, index: [Int], view: AnyView) -> AnyView {
        let delimiter: String
        switch attributes.delimiter {
        case .period:
            delimiter = "."
        case .parenthesis:
            delimiter = ")"
        }

        let separator: String
        switch attributes.type {
        case .bullet:
            separator = index.count % 2 == 1 ? "•" : "◦"
        case .ordered:
            separator = index
                .map({ String($0) })
                .joined(separator: ".")
                .appending(delimiter)
        }

        return AnyView(
            HStack(alignment: .top, spacing: 4) {
                Text(separator)
                view
            }
        )
    }
}
