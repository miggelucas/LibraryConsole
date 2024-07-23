//
//  App.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

class App {
    
    var currentDestination: Destination = .mainHub
    
    func start() {
        greetings()
        navigateTo(currentDestination)
    }
    
    func greetings() {
        print("#############################")
        print("\n")
        print("Wellcome to Console Library!")
        print("I'm here to help you!")
        print("what kind of assistance do you need today?")
        print("\n")
        print("#############################")
        print("\n")
    }
    
    func shutdownMessage() {
        print("#############################")
        print("\n")
        print("Goodbye!")
        print("See you next time")
        print("\n")
        print("#############################")
        print("\n")
    }
    
    func navigateTo(_ destination: Destination) {
        switch destination {
        case .shutDown:
            shutdownMessage()
        default:
            if let station = stationFactory(destination: destination) {
                station.start()
            }
        }
    }
    
    enum Destination {
        case shutDown
        case mainHub
        case info
        case donate
        case rent
    }
    
    
    func stationFactory(destination: Destination) -> Station? {
        switch destination {
        case .shutDown:
            return nil
        case .mainHub:
            return MainHub { [weak self] destination in
                self?.navigateTo(destination)
            }
        case .info:
            return Info { [weak self] destination in
                self?.navigateTo(destination)
            }
        case .donate:
            return Donate { [weak self] destination in
                self?.navigateTo(destination)
            }
        case .rent:
            return Rent { [weak self] destination in
                self?.navigateTo(destination)
            }
        }
        
    }
}