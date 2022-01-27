//
//  File.swift
//  
//
//  Created by Krisda on 27/1/2565 BE.
//

import Vapor

struct WebRouter: RouteCollection {
    let frontendController = WebFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: frontendController.homeView)
    }
}
