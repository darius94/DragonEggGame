//
//  DestroyCommand.swift
//  StarterGame
//
//  Created by Darius Little on 4/12/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation
class DestroyCommand: Command {
    override init() {
        super.init()
    self.name = "destroy"
    }
    
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.destroy(direction : secondWord!)
          
        } else {
           player.warningMessage("\ndestroy where ?")
        }
        return false
     
    }

}
