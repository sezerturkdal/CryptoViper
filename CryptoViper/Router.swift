//
//  Router.swift
//  CryptoViper
//
//  Created by Sezer on 10.01.2023.
//

import Foundation

protocol AnyRouter{
    static func startExecution() -> AnyObject
}

class CryptoRouter : AnyRouter {
    static func startExecution() -> AnyObject {
        let router = CryptoRouter()
        return router
    }
    
    
}
