//
//  App.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

class App {
    
    private var currentDestination: Destination = .mainHub
    
    func start() {
        Logs.greetings()
        navigateTo(currentDestination)
    }
    
    private func navigateTo(_ destination: Destination) {
        switch destination {
        case .shutDown:
            Logs.shutdown()
        default:
            if let station = stationFactory(destination: destination) {
                station.start()
            } else {
                Logs.destinationFail()
            }
        }
    }
    
    private func stationFactory(destination: Destination) -> Station? {
        let navigationHandler: (Destination) -> Void = { [weak self] destination in
            self?.navigateTo(destination)
        }
        
        switch destination {
        case .shutDown:
            return nil
        case .mainHub:
            return MainHub(navigationHandler: navigationHandler)
        case .info:
            return Info(navigationHandler: navigationHandler)
        case .donate:
            return Donate(navigationHandler: navigationHandler)
        case .rent:
            return Rent(navigationHandler: navigationHandler)
        }
    }
}

extension App {
    private struct Logs {
        static func greetings() {
            print("#############################")
            print("\n")
            print("Wellcome to Console Library!")
            print("I'm here to help you!")
            print("what kind of assistance do you need today?")
            print("\n")
            print("#############################")
            print("\n")
        }
        
        static func shutdown() {
            print("#############################")
            print("\n")
            print("Goodbye!")
            print("See you next time")
            print("\n")
            print("#############################")
            print("\n")
        }
        
        static func destinationFail() {
            print("ops...")
            print("It seems some error occurred when trying to navigate to next destination...")
            print("Turning system down.")
        }
    }
}
