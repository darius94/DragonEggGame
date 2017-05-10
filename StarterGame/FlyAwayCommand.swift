//
//  FlyAwayCommand.swift
//  StarterGame
//
//  Created by Darius Little on 4/30/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation


class FlyAwayCommand: Command {
    
    override init() {
        super.init()
        self.name = "FlyAway"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.warningMessage("\nI cannot leave \(String(describing: secondWord))")
        }
        else{
            player.flyAway()
        }
        return false
    }
}
