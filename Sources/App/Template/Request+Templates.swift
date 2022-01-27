//
//  File.swift
//  
//
//  Created by Krisda on 26/1/2565 BE.
//

import Vapor

public extension Request {
    var templates: TemplateRenderer { .init(self) }
}
