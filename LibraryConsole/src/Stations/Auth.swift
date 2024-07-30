//
//  Auth.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 30/07/24.
//

import Foundation

struct Auth: Station {
    
    var navigationHandler: (Destination) -> Void
    
    func start() {
        Logs.authGreetings()
        UserInteraction.requestAuthMethod { userInput in
            requestAuthMethodHandler(input: userInput)
        }
    }
    
    func requestAuthMethodHandler(input: String) {
        switch input {
        case "1":
            UserInteraction.loginCredentials { username, password in
                print("try to make login with username: \(username)")
            }
        case "2":
            UserInteraction.registerAccount { username, password in
                print("try to create account with username: \(username)")
            }
        case "3":
            navigationHandler(.mainHub)
        default:
            Logs.error()
            UserInteraction.requestAuthMethod { userInput in
                requestAuthMethodHandler(input: userInput)
            }
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
        
        static func registerAccount(handler: ((String, String) -> Void)) {
            
        }
    }
    
    private struct Logs {
        static func authGreetings() {
            print("We like to keep record of our clients for documentation")
            print("Let's figure out who you are before we proceed")
            print("")
        }
        
        static func error() {
            print("Ops....")
            print("Something went wrong.")
            print("Let's try again")
            print("")
        }
    }
}
