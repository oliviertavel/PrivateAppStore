//
//  App.swift
//  App
//
//  Created by Oliver TAVEL on 03/05/2018.
//

import Vapor
import FluentSQLite

final class App: SQLiteModel {
    
    var id: Int?
    var applicationId: String
    var name: String
    var fileURL: String?
    var fileName: String?
    var version: String?
    var build: String?
    
    init(id: Int? = nil,
         applicationId: String,
         name: String,
         fileURL: String? = nil,
         fileName: String? = nil,
         version: String? = nil,
         build: String? = nil) {
        self.id = id
        self.applicationId = applicationId
        self.name = name
        self.fileURL = fileURL
        self.fileName = fileName
        self.version = version
        self.build = build
    }
}

extension App: Content {}

extension App: Migration {}

extension App: Parameter {}
