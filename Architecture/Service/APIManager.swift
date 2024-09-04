//
//  APIManager.swift
//  Architecture
//
//  Created by Saud Syed on 24/04/2024.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    private let session: Session
    
    private init() {
        session = Session.default
    }
        
    //MARK: - request()
    func request<T: Decodable>(endpoint: Endpoints, method: HTTPMethod, parameters: Parameters? = nil, completion: @escaping (Result<APIResponse<T>, NetworkError>) -> Void) {
        let url = "\(Constants.baseURL)\(endpoint.stringValue)"
        print("*** REQUESTED URL: \(url) ***")
        
        session.request(url, method: method, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                    do {
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        let apiResponse = APIResponse(value: decodedResponse, response: response.response!)
                        completion(.success(apiResponse))
//                        print("*** API RESPONSE: \(apiResponse) ***")
                    } catch {
                        completion(.failure(.decodeFailed(error)))
                    }
                case .failure(let error):
                    completion(.failure(.requestFailed(error)))
                }
        }
    }
}
