//
//  OpenCommand.swift
//  StarterGame
//
//  Created by Darius Little on 4/6/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class OpenCommand: Command {
    override init() {
        super.init()
        self.name = "open"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.open(secondWord!)
        } else {
            player.warningMessage("\nOpen What?")
        }
        return false
    }
}
