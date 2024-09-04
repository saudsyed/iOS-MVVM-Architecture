//
//  ViewModel.swift
//  Architecture
//
//  Created by Saud Syed on 24/04/2024.
//

import UIKit
import Combine

class ViewModel {
    @Published var isLogin: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        
    }
    
    //MARK: - LoginServiceApi()
    func loginServiceApi(email: String, password: String) {
        let params = [
            "email": email,
            "password": password
        ]
        
        APIManager.shared.request(endpoint: .login, method: .post, parameters: params) { [weak self] (result: Result<APIResponse<LoginModel>, NetworkError>) in
            switch result {
            case .success(let response):
                print("Response: \(response)")
                self?.isLogin = true
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
    }
    
    //MARK: - getUserListServiceApi()
    func getUserListServiceApi() {
        let params = [
            "page": 1,
            "per_page": 25
        ]
        
        APIManager.shared.request(endpoint: .getUserList, method: .get, parameters: params) { [weak self] (result: Result<APIResponse<ListModel>, NetworkError>) in
            switch result {
            case .success(let response):
                print("Response: \(response)")
                self?.isLogin = true
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
    }
    
    //MARK: - logoutServiceApi()
    func logoutServiceApi() {
        APIManager.shared.request(endpoint: .logout, method: .post, parameters: nil) { [weak self] (result: Result<APIResponse<LoginModel>, NetworkError>) in
            switch result {
            case .success(let response):
                print("Response: \(response)")
                self?.isLogin = false
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
    }
}
