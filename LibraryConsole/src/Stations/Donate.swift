//
//  Donate.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

struct Donate: Station {
    func start() {
        print("You are on donate station")
    }
    
    var navigationHandler: (Destination) -> Void
    
}
