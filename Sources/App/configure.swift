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
    
    app.routes.get("hello") { req -> Response in
        req.templates.renderHtml(MyTemplate(title: "Hello, World!"))
    }
    
//    app.routes.get("hello") { req -> Response in
//        let doc = Document(.html) {
//            Html {
//                Head {
//                    Title("Hello, World!")
//                }
//                Body {
//                    H1("Hello, World!")
//                }
//            }
//        }
//
//        let body = DocumentRenderer(minify: false, indent: 4).render(doc)
//
//        return Response(status: .ok, headers: ["content-type": "text/html"], body: .init(string: body))
//    }
    
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)

    // register routes
    try routes(app)
}
