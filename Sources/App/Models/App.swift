//
//  App.swift
//  App
//
//  Created by Oliver TAVEL on 03/05/2018.
//

import Vapor
import FluentPostgreSQL

final class App: Codable {
    
    var id: Int?
    var appID: String
    var name: String
    var fileURL: String?
    var fileName: String?
    var version: String?
    var build: String?
    
    init(appID: String, name: String) {
        self.appID = appID
        self.name = name
    }
}

extension App: Content {}
extension App: PostgreSQLModel {}
extension App: Migration {}
extension App: Parameter {}
