//
//  File.swift
//  
//
//  Created by Krisda on 27/1/2565 BE.
//

import Vapor
import SwiftHtml
import SwiftSgml

struct WebHomeTemplate: TemplateRepresentable {
    var context: WebHomeContext
    
    init(_ context: WebHomeContext) {
        self.context = context
    }
    
    @TagBuilder
    func render(_ req: Request) -> Tag {
        WebIndexTemplate(.init(title: context.title)) {
            Div {
                Section {
                    H1(context.title)
                    P(context.message)
                }
                .class("lead")
            }
            .id("home")
            .class("container")
        }
        .render(req)
    }
    
}
