//
//  File.swift
//  
//
//  Created by Krisda on 27/1/2565 BE.
//

import Foundation

struct BlogPost: Codable {
    let title: String
    let slug: String
    let image: String
    let excerpt: String
    let date: Date
    let category: String?
    let content: String
}
