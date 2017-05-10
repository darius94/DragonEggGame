//
//  DropCommand.swift
//  StarterGame
//
//  Created by Darius Little on 3/28/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class DropCommand: Command{
    override init(){
        super.init()
        self.name = "drop"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.drop(abilityName: secondWord!)
        } else {
            player.warningMessage("\nDrop What?")
        }
        return false
    }
}

