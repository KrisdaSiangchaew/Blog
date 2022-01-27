//
//  File.swift
//  
//
//  Created by Krisda on 27/1/2565 BE.
//

import Vapor

struct BlogRouter: RouteCollection {
    let controller = BlogFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("blog", use: controller.blogView)
        routes.get(.anything, use: controller.postView)
    }
}
