//
//  PickupCommand.swift
//  StarterGame
//
//  Created by Darius Little on 4/11/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class PickupCommand: Command {
    override init() {
        super.init()
        self.name = "pickup"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.pickup(abilityName: secondWord!)
        } else {
           
            player.warningMessage("\nI cant pickup\(String(describing:secondWord))")
        }
        return false
    }
}
