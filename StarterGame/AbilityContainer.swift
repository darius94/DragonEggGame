//
//  AbilityContainer.swift
//  StarterGame
//
//  Created by Darius Little on 4/25/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation
//can contain all the funcationality out of item protocol
//is example of heirarchy its a sub type item
class AbilityContainer : Ability {
    private var  _container : [String : AbilityProtocol] = [String : AbilityProtocol]()

    
    func addAbility(ability : AbilityProtocol){
        _container[ability.getName()] = ability
    }
    
  
    
   override func description() -> String{
        var tempString = description() + "\n\tAbilities:"
        
        let abilityNames : [String] = [String](_container.keys)
        for abilityName in abilityNames{
            tempString += "\n\t\t\(_container[abilityName]!.description())"
        }
        return tempString
    }
}
