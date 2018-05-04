//
//  AppController.swift
//  App
//
//  Created by Oliver TAVEL on 03/05/2018.
//

import Vapor

class AppController {
    
    /// Returns a list of all Applications
    func index(_ req: Request) throws -> Future<[App]> {
        return App.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<App> {
        return try req.content.decode(App.self).save(on: req)
    }
    
    func delete(_ req: Request) throws -> Future<App> {
        return
    }
}
