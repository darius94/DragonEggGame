//
//  HelpCommand.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/17/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

import Foundation

class HelpCommand: Command {
    var words : CommandWords
    
    init(commands : CommandWords) {
        words = commands
        super.init()
        self.name = "help"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.warningMessage("\nI cannot help you with '\(secondWord!)'")
        } else {
            player.outputMessage("\nYou are a lost Dragon.You may never find your eggs but Dont give up!!.\n\nYour available commands are:\n\(words.description())")
        }
        return false
    }
}
