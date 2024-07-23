//
//  Main.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

protocol Station {
    func start()
    
    var navigationHandler: (App.Destination) -> Void { get set }
}

struct MainHub: Station {
    
    func start() {
        presentMainHubStation()
    }
    
    var navigationHandler: (App.Destination) -> Void
    
    
    func presentMainHubStation() {
        printServiceList()
        requestUserInteraction(prompt: "Select a option: ") { answer in
            self.handleMainHubStationAnswer(userAnswer: answer)
        }
    }
    
    func handleMainHubStationAnswer(userAnswer: String) {
        if let routingOption = Int(userAnswer) {
            switch routingOption {
            case 1:
                navigationHandler(.info)
                
            case 2:
                navigationHandler(.donate)
                
            case 3:
                navigationHandler(.rent)
              
            default:
                print("It seems that you chose a invalid option")
                presentMainHubStation()
            }
            
        } else {
            if "quit" == userAnswer.lowercased() {
                navigationHandler(.shutDown)
            } else {
                print("It seems that you chose a invalid option")
                presentMainHubStation()
            }
        }
    }
    
    func printServiceList() {
        
        print("Please choose a option between the provided list:")
        print("")
        print("  1 -> Library Info")
        print("  2 -> Donate a book")
        print("  3 -> Rent a book")
        print("  quit -> Shutdown Service")
        print("")

    }
    
    func requestUserInteraction(prompt: String, answerHandler: @escaping (String) -> Void) {
        print(prompt)
        if let answerRaw = readLine(strippingNewline: true) {
            answerHandler(answerRaw)
        } else {
            print("Ops...")
            print("Something it's off.")
            requestUserInteraction(prompt: prompt, answerHandler: { answer in
                answerHandler(answer)
            })
        }
    }
}
