//
//  AppController.swift
//  App
//
//  Created by Oliver TAVEL on 03/05/2018.
//

import Vapor

struct AppsController: RouteCollection {
    func boot(router: Router) throws {
        let appsRoute = router.grouped("api", "apps")
        appsRoute.get(use: getAllHandler)
        appsRoute.get(App.parameter, use: getHandler)
        appsRoute.post(App.self, use: createHandler)
        appsRoute.put(App.parameter, use: updateHandler)
        appsRoute.delete(App.parameter, use: deleteHandler)
    }
    
    // MARK: GET
    func getAllHandler(_ req: Request) throws -> Future<[App]> {
        return App.query(on: req).all()
    }
    
    func getHandler(_ req: Request) throws -> Future<App> {
        return try req.parameters.next(App.self)
    }
    
    // MARK: CREATE
    func createHandler(_ req: Request, app: App) throws -> Future<App> {
        return app.save(on: req)
    }
    
    // MARK: UPDATE
    func updateHandler(_ req: Request) throws -> Future<App> {
        return try flatMap(to: App.self,
                           req.parameters.next(App.self),
                           req.content.decode(App.self)) { app, updatedApp in
                            app.name = updatedApp.name
                            app.appID = updatedApp.appID
                            return app.save(on: req)
        }
    }
    
    // MARK: DELETE
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(App.self).delete(on: req).transform(to: .ok)
    }
    
}
