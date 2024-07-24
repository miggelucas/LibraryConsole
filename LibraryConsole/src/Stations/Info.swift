//
//  Info.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

struct Info: Station {
    
    func start() {
        Log.libraryInfo()
        requestUserInteraction()
    }
    
    var navigationHandler: (Destination) -> Void
    
    private func requestUserInteraction() {
        Log.typeAnyKeyToContinue()
        let _ = readLine()
        navigationHandler(.mainHub)
    }
}

extension Info {
    private struct Log {
        static func typeAnyKeyToContinue() {
            print("Press Enter to return to the MainHub")
        }
        
        static func libraryInfo() {
            print("""
            #########################################
            
            Welcome to the Console Library!
            
            Version: 1.0
            
            Our library offers the following services:
            
            - Donations: You can donate your books to our library and help us grow our collection.
            - Consultations: Feel free to browse through our extensive catalog of books.
            - Rentals: You can rent books from our library and enjoy reading them at your convenience.
            
            Note: This is a fictional library created for demonstration purposes.
            
            #########################################
            """)
        }
    }
}
