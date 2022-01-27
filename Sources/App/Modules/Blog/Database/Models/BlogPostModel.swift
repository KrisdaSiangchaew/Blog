//
//  File.swift
//  
//
//  Created by Krisda on 26/1/2565 BE.
//

import Vapor
import Fluent

final class BlogPostModel: Model {
    static let schema: String = "blog_posts"
    
    struct FieldKeys {
        struct v1 {
            static var title: FieldKey { "title" }
            static var slug: FieldKey { "slug" }
            static var imageKey: FieldKey { "image_key" }
            static var excerpt: FieldKey { "excerpt" }
            static var date: FieldKey { "date" }
            static var content: FieldKey { "content" }
            static var categoryID: FieldKey { "category_id" }
        }
    }
    
    @ID() var id: UUID?
    @Field(key: FieldKeys.v1.title) var title: String
    @Field(key: FieldKeys.v1.slug) var slug: String
    @Field(key: FieldKeys.v1.imageKey) var imageKey: String
    @Field(key: FieldKeys.v1.excerpt) var excerpt: String
    @Field(key: FieldKeys.v1.date) var date: Date
    @Field(key: FieldKeys.v1.content) var content: String
    @Parent(key: FieldKeys.v1.categoryID) var category: BlogCategoryModel
    
    init() { }
    
    init(id: UUID? = nil, title: String, slug: String, imageKey: String, excerpt: String, date: Date, content: String, categoryID: UUID) {
        self.id = id
        self.title = title
        self.slug = slug
        self.imageKey = imageKey
        self.excerpt = excerpt
        self.date = date
        self.content = content
        $category.id = categoryID
    }
}
