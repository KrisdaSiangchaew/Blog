import Vapor
import SwiftHtml
import SwiftSgml
import Fluent
import FluentSQLiteDriver

public func configure(_ app: Application) throws {
    // serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // extends path to always contain a trailing hash
    app.middleware.use(ExtendPathMiddleWare())
    
    // setup Fluent with SQLite database under the Resources directory
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)
    
    // setup module
    let modules: [ModuleInterface] = [
        WebModule(),
        BlogModule()
    ]
    for module in modules {
        try module.boot(app)
    }

    // use automatic database migrations
    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
}
