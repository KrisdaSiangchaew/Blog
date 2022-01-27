import Vapor
import SwiftHtml

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }
    
    app.routes.get { req -> Response in
        req.templates.renderHtml(WebIndexTemplate(.init(title: "Home", message: "Welcome to my page!")))
    }
}
