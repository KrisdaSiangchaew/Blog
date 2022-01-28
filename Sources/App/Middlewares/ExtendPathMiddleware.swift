//
//  File.swift
//  
//
//  Created by Krisda on 28/1/2565 BE.
//

import Vapor

struct ExtendPathMiddleWare: AsyncMiddleware {
    func respond(to req: Request, chainingTo next: AsyncResponder) async throws -> Response {
        if !req.url.path.hasSuffix("/") && !req.url.path.contains(".") {
            return req.redirect(to: req.url.path + "/", type: .permanent)
        }
        return try await next.respond(to: req)
    }
}
