//
//  Auth.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 30/07/24.
//

import Foundation

struct Auth: Station {
    
    let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService(), navigationHandler: @escaping (Destination) -> Void) {
        self.authService = authService
        self.navigationHandler = navigationHandler
    }
    
    var navigationHandler: (Destination) -> Void
    
    func start() {
        Logs.authGreetings()
        presentAuthHub()
    }
    
    func requestAuthMethodHandler(input: String) {
        switch input {
        case "1":
            UserInteraction.loginCredentials { username, password in
                attemptToLoginWith(username: username, password: password)
            }
        case "2":
            UserInteraction.registerAccount { username, email, password  in
                attemptToRegisterWith(username: username, email: email, password: password)
            }
        case "3":
            navigationHandler(.mainHub)
        default:
            Logs.error()
            presentAuthHub()
        }
    }
    
    private func attemptToLoginWith(username: String, password: String) {
        let result = authService.login(username: username, password: password)
        switch result {
        case .success(let success):
            print(success)
        case .failure(let failure):
            print(failure)
            Logs.error()
            presentAuthHub()
        }
    }
    
    private func attemptToRegisterWith(username: String, email: String, password: String) {
        let result = authService.registerAccount(username: username, email: email, password: password)
        switch result {
        case .success(let success):
            print(success)
        case .failure(let failure):
            print(failure)
            Logs.error()
            presentAuthHub()
        }
    }
    
    private func presentAuthHub() {
        UserInteraction.requestAuthMethod { userInput in
            requestAuthMethodHandler(input: userInput)
        }
    }
}


extension Auth {
    private struct UserInteraction {
        static func requestAuthMethod(handler: (String) -> Void) {
            print("please, select a option from bellow:")
            print(" 1 -> Login")
            print(" 2 -> Register a new account")
            print(" 3 -> Return to Home")
            
            guard let answerRaw = readLine(strippingNewline: true) else {
                requestAuthMethod(handler: handler)
                return
            }
            
            handler(answerRaw)
        }
        
        static func loginCredentials(handler: ((String, String) -> Void)) {
            print("So you are our client already?")
            print("Provide your username: ")
            
            let username = readLine()
            
            print("Provide your password: ")
            let password = readLine()
            
            guard let username = username, let password = password else {
                Logs.error()
                loginCredentials(handler: handler)
                return
            }
            handler(username, password)
        }
        
        static func registerAccount(handler: ((String, String, String) -> Void)) {
            print("Wellcome to our library!!")
            print("We need some data to register your account...")
            
            print("Please, provide a username: ")
            let username = readLine()
            
            print("Please, inform your best e-mail: ")
            let email = readLine()
            
            print("create you custom password: ")
            let password = readLine()
            
            guard let username = username, let email = email, let password = password else {
                Logs.error()
                registerAccount(handler: handler)
                return
            }
            
            handler(username, email, password)
        }
    }
    
    private struct Logs {
        static func authGreetings() {
            print("We like to keep record of our clients for documentation")
            print("Let's figure out who you are before we proceed")
            printEmptyLines()
        }
        
        static func error() {
            print("Ops....")
            print("Something went wrong.")
            print("Let's try again")
            printEmptyLines()
        }
        
        static func printEmptyLines(numberOfLines: Int = 1) {
            guard numberOfLines > 0 else { return }
            for _ in 0...numberOfLines {
                print("")
            }
        }
    }
}
