//
//  File.swift
//  
//
//  Created by Krisda on 27/1/2565 BE.
//

import Vapor

struct WebFrontendController {
    func homeView(req: Request) throws -> Response {
        let ctx = WebHomeContext(
            icon: "🤖",
            title: "Home",
            message: "Hi there, welcome to my homepage",
            paragraphs: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet urna sapien. Vestibulum sem nibh, feugiat vitae dapibus vitae, iaculis in massa. ",
            "Aenean ante arcu, faucibus quis odio vel, bibendum egestas enim. Aenean dolor ante, commodo sit amet turpis sit amet, aliquet egestas arcu.",
            "Proin faucibus hendrerit leo non fermentum. Cras pharetra, justo id molestie molestie, est ex egestas mi, vitae varius sem magna et augue. Suspendisse vestibulum vel ex nec tristique. Praesent maximus posuere sem, sed varius tellus volutpat a. Ut vehicula ipsum non libero viverra ultrices. "
            ],
            link: .init(label: "Read my blog ->", url: "/blog/"))
                                  
        return req.templates.renderHtml(WebHomeTemplate(ctx))
    }
}
