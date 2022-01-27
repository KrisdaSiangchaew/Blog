import Vapor
import SwiftHtml
import Fluent
import FluentSQLiteDriver
import SwiftSgml

struct MyTemplate: TemplateRepresentable {
    let title: String
    
    func render(_ req: Request) -> Tag {
        Html {
            Head {
                Title(title)
            }
            Body {
                H1(title)
            }
        }
    }
}

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // setup module routes
    let routers: [RouteCollection] = [
        BlogRouter(),
        WebRouter()
    ]
    
    for router in routers {
        try router.boot(routes: app.routes)
    }
    
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)

    // register routes
    try routes(app)
}
