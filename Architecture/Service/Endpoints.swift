//
//  Endpoints.swift
//  Architecture
//
//  Created by Saud Syed on 24/04/2024.
//

import Foundation

enum Endpoints {
    case initialEndpoint
    case postEp(id: Int)
    case login
    case getUserList
    case logout
    
    var stringValue: String {
        switch self {
        case .initialEndpoint:
            return "initialEndpoint"
        case .postEp(let id):
            return "postEp\(id)"
        case.login:
            return "login"
        case .getUserList:
            return "users"
        case .logout:
            return "logout"
        }
    }
}
