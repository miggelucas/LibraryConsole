//
//  Info.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

struct Info: Station {
    
    func start() {
        print("You are on Info Station")
    }
    
    var navigationHandler: (App.Destination) -> Void
}
