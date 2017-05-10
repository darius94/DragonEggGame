//
//  Attached.swift
//  StarterGame
//
//  Created by Darius Little on 3/29/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class Attached : Ability {
    var attached : [String : Ability]
    var weightLimit : Int
    var currentWeight : Int
    var volumeLimit : Int
    
    
    
      override init(name : String, weight : Int, volume : Int) {
        attached = [String : Ability]()
        self.weightLimit = 7
        self.volumeLimit = 2
        self.currentWeight = 0
        
        super.init(name: name, weight : weight, volume : volume)
    }
 
 
    func setWeightLimit(weightLimit : Int) {
        self.weightLimit = weightLimit
    }
    //
     func isAttached() -> Bool {
        return true
    }
    //method to check if attached is empty
    func isEmpty() -> Bool {
        if attached.isEmpty == true {
            return true
        } else {
            return false
        }
    }
    
   // method to drop the atached ability
    func drop(abilityName : String) -> Bool {
        if attached.isEmpty == true {
            return false
        } else {
            attached.removeValue(forKey: abilityName)
        }
        return true
    }
    
  /*
    
     override func getVolume() -> Int {
        var totalValue : Int = 0
        for ability in attached.values {
            totalValue += ability.getVolume()
        }
        totalValue += super.getVolume()
        return totalValue
    }
    
    
    func pickup(ability : Ability) -> Bool {
        if (currentWeight + ability.getWeight()) <= weightLimit || (currentWeight + ability.getVolume()) <= volumeLimit {
            attached[ability.name] = ability
            currentWeight += ability.getWeight()
            currentWeight += ability.getVolume()
            return true
        } else {
            return false
        }
    }
    
 
    override func getWeight() -> Int {
        var totalWeight : Int = 0
        for ability in attached.values {
            totalWeight += ability.getWeight()
        }
        totalWeight += super.getWeight()
        return totalWeight
    }
 
 */
    
}
