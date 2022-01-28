import Vapor
import SwiftHtml
import Fluent
import FluentSQLiteDriver
import SwiftSgml

public func configure(_ app: Application) throws {
    // serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // extends path to always contain a trailing hash
    app.middleware.use(ExtendPathMiddleWare())
    
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
