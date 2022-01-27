//
//  File.swift
//  
//
//  Created by Krisda on 27/1/2565 BE.
//

import Vapor

struct BlogFrontendController {
    var posts: [BlogPost] = {
        stride(from: 1, to: 9, by: 1).map { index in
            BlogPost(title: "Sample post #\(index)",
                     slug: "sample-post-\(index)",
                     image: "/img/posts/\(String(format: "%02d", index + 1) ).jpg",
                     excerpt: "Lorem ipsum",
                     date: Date().addingTimeInterval(-Double.random(in: 0...(86400 * 60))),
                     category: Bool.random() ? "Sample category" : nil,
                     content: "Lorem ipsum dolor sit amet.")
        }.sorted { $0.date > $1.date }
    }()
}
