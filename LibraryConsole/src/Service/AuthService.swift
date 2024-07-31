//
//  AuthService.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 30/07/24.
//

import Foundation

protocol AuthServiceProtocol {
    func login(username: String, password: String) -> Result<String, AuthError>
    func registerAccount(username: String, email: String, password: String) -> Result<String, AuthError>
}

struct AuthError: Error {
    var message: String
}

struct AuthService: AuthServiceProtocol {
    func login(username: String, password: String) -> Result<String, AuthError> {
        return .failure(AuthError(message: "Service not implemented yet"))
    }
    
    func registerAccount(username: String, email: String, password: String) -> Result<String, AuthError>{
        return .failure(AuthError(message: "Service not implemented yet"))
    }
}
