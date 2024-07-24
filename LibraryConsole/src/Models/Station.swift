//
//  Station.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

protocol Station {
    func start()
    
    var navigationHandler: (Destination) -> Void { get set }
}
