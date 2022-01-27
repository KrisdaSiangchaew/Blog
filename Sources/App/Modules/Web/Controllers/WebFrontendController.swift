//
//  File.swift
//  
//
//  Created by Krisda on 27/1/2565 BE.
//

import Vapor

struct WebFrontendController {
    func homeView(req: Request) throws -> Response {
        req.templates.renderHtml(WebHomeTemplate(.init(title: "My Home", message: "Welcome to Krisda homepage")))
    }
}
