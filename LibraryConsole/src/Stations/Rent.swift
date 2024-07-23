//
//  Rent.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

struct Rent: Station {
    func start() {
        print("You are on Rent a book station")
    }
    
    var navigationHandler: (App.Destination) -> Void
    
}
