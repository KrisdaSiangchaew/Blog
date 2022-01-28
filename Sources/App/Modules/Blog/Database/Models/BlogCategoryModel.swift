//
//  File.swift
//  
//
//  Created by Krisda on 26/1/2565 BE.
//

import Vapor
import Fluent
import SwiftHtml
import Foundation

final class BlogCategoryModel: Model {
    static let schema: String = "blog_categories"
    
    struct FieldKeys {
        struct v1 {
            static var title: FieldKey { "title" }
        }
    }
    
    @ID() var id: UUID?
    @Field(key: FieldKeys.v1.title) var title: String
    @Children(for: \.$category) var posts: [BlogPostModel]
    
    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
