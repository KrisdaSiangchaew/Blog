//
//  File.swift
//  
//
//  Created by Krisda on 29/1/2565 BE.
//

import Foundation

extension Blog {
    enum Post {
        
    }
}

extension Blog.Post {
    struct List: Codable {
        let id: UUID
        let title: String
        let slug: String
        let image: String
        let excerpt: String
        let date: Date
    }
    
    struct Detail: Codable {
        let id: UUID
        let title: String
        let slug: String
        let image: String
        let excerpt: String
        let date: Date
        let category: Blog.Category.List
        let content: String
    }
}
