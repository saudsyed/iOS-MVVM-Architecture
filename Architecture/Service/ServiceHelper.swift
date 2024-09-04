//
//  ServiceHelper.swift
//  Architecture
//
//  Created by Saud Syed on 24/04/2024.
//

import Foundation

enum NetworkError: Error {
    case requestFailed(Error)
    case invalidResponse
    case decodeFailed(Error)
}

struct APIResponse<T> {
    let value: T
    let response: HTTPURLResponse
}
