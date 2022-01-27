//
//  File.swift
//  
//
//  Created by Krisda on 26/1/2565 BE.
//

import Vapor
import SwiftSgml

public protocol TemplateRepresentable {
    @TagBuilder
    func render(_ req: Request) -> Tag
}

