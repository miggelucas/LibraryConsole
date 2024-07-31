//
//  Main.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation


struct MainHub: Station {
    
    func start() {
        presentMainHubStation()
    }
    
    var navigationHandler: (Destination) -> Void
    
    
    func presentMainHubStation() {
        Logs.serviceList()
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
                
            case 4:
                navigationHandler(.auth)
              
            default:
               userDidChooseInvalidAnswer()
            }
            
        } else {
            if "quit" == userAnswer.lowercased() {
                navigationHandler(.shutDown)
            } else {
                userDidChooseInvalidAnswer()
            }
        }
    }
    
    private func userDidChooseInvalidAnswer() {
        Logs.invalidOption()
        presentMainHubStation()
    }
    
    private func requestUserInteraction(prompt: String, answerHandler: (String) -> Void) {
        print(prompt)
        if let answerRaw = readLine(strippingNewline: true) {
            answerHandler(answerRaw)
        } else {
            Logs.error()
            requestUserInteraction(prompt: prompt, answerHandler: { answer in
                answerHandler(answer)
            })
        }
    }
}

extension MainHub {
    private struct Logs {
        static func serviceList() {
            print("Please choose a option between the provided list:")
            print("")
            print("  1 -> Library Info")
            print("  2 -> Donate a book")
            print("  3 -> Rent a book")
            print("  4 -> Auth")
            print("  quit -> Shutdown Service")
            print("")
        }
        
        static func error() {
            print("Ops...")
            print("Something it's off.")
        }
        
        static func invalidOption() {
            print("It seems that you chose a invalid option")
        }
    }
}
