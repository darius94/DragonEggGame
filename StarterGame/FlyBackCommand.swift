//
//  FlyBackCommand.swift
//  StarterGame
//
//  Created by Darius Little on 5/7/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class FlyBackCommand: Command {
    override init() {
        super.init()
        self.name = "FlyBack"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasThirdWord() {
            player.FlyBack(steps: secondWord!,abilityName:thirdWord!)
            //player.pickup(abilityName: thirdWord!)
            //player.attack(abilityName:thirdWord!)
            } else {
                player.warningMessage("\nMissing how far back ")
        }
       
       
    return false
    }
    
    
}
