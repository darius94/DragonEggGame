//
//  BackCommand.swift
//  StarterGame
//
//  Created by Darius Little on 3/15/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class BackCommand: Command {
        override init() {
        super.init()
        self.name = "back"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.warningMessage("No second word  is needed\(secondWord!)")
      
        } else {
            player.goBack()
        }
        return false
    }
}
