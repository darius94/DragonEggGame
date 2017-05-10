//
//  AttackCommand.swift
//  StarterGame
//
//  Created by Darius Little on 3/30/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class AttackCommand: Command {
    override init() {
        super.init()
        self.name = "attack"
    }
    
  
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.attack(abilityName: secondWord!)
        } else {
             player.warningMessage("\nAttack with what ?")
        }
        return false
    }
}
