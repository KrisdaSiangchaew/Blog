//
//  File.swift
//  
//
//  Created by Krisda on 27/1/2565 BE.
//

import Vapor
import SwiftHtml
import SwiftSgml

struct WebLinkTemplate: TemplateRepresentable {
    var context: WebLinkContext
    
    init(context: WebLinkContext) {
        self.context = context
    }
    
    @TagBuilder
    func render(_ req: Request) -> Tag {
        A(context.label)
            .href(context.url)
    }
}
