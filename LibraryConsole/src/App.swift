//
//  App.swift
//  LibraryConsole
//
//  Created by Lucas Migge on 23/07/24.
//

import Foundation

class App {
    
    func start() {
        greetings()
        presentMainHubStation()
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
                print("Should present Library Info")
                
            case 2:
                print("Should present Donate a Book")
                
            case 3:
                print("Should present Rent a book")
              
            default:
                print("It seems that you chose a invalid option")
                presentMainHubStation()
            }
            
        } else {
            if "quit" == userAnswer.lowercased() {
                print("shutting down....")
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
