//
//  InventoryCommand.swift
//  StarterGame
//
//  Created by Darius Little on 4/23/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation


class InventoryCommand: Command {
    
    override init() {
        super.init()
        self.name = "abilities"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.warningMessage("\nI cannot check : \(String(describing:secondWord))")
        } else {
            player.inventory()
        }
        return false
    }
}
