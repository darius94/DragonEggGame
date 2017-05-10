//
//  Room.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/16/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

import Foundation

class Room : RoomProtocol{
    var exits : [String : Room]
    var doors: [String : Door]
    var tag : String
    var ability : [String : Attached]
    var abilities : [String : AbilityProtocol]
    private var _delegate : RoomProtocol?
    var  _container : [String : AbilityProtocol] = [String : AbilityProtocol]()
    
    
    var delegate : RoomProtocol {
        get{
            return _delegate!
        }  set{
            _delegate = newValue
            _delegate!.setContainer(self)
        }
    }
    
  
    
    convenience init() {
        self.init(tag: "No Tag")
    }
    
    init(tag : String) {
        exits = [String : Room]()
        doors = [String: Door]()
        self.tag = tag
        abilities = [String : Ability]()
        ability = [String : Attached]()
        
        
       
    }

    //method to setthe exits
    func setExit(_ exitName : String, door : Door) {
        if _delegate == nil{
            doors[exitName] = door
        }else{
            _delegate?.setExit(exitName, door: door)
        
        }
        
    }
    
    //method to display the exits
    func getExit(_ exitName : String) -> Door? {
        if _delegate == nil{
            return doors[exitName]
        }else{
            return  _delegate?.getExit(exitName)
            
        }
    }
    
    //method to get the exits and diplsay
    func getExits() -> String {
        if _delegate == nil{
           let exitNames : [String] = [String](doors.keys)
        return "Exits: " + exitNames.joined(separator: " ")
        }
        else{
            return (_delegate?.getExits())!
        }
        
    }
    
    
   
    // Method to return abilities that were stored in the abilities dictionary
    func getAbilities() -> String {
        let abilityName : [String] = [String](abilities.keys)
        return "\n" + abilityName.joined(separator: "\n")
    }
    
        
        func setContainer(_ container: Room){
        
        }
    
    // method to pickup ability from room and attach to abilities dictionary. Its called in player Pickup
    func pickup(_ abilityName : String) ->  AbilityProtocol? {
        let ability = abilities[abilityName]
        if ability != nil {
                abilities.removeValue(forKey: abilityName)
        }
        return ability
    }
 
    //method to remove ability from room
    func removeAbility(_ abilityName : String) -> AbilityProtocol? {
        let ability = _container[abilityName]
        if ability != nil {
            _container.removeValue(forKey: abilityName)
        }
        return ability
    }
    
    
    
    // method to drop ability back into room
    func drop(_ ability : AbilityProtocol) {
        abilities[ability.getName()] = ability
    }
 
    
    // method for removing an abilty
    func takes(abilityName : String) -> AbilityProtocol? {
        let ability = abilities[abilityName]
        
        if ability != nil {
            abilities.removeValue(forKey: abilityName)
    }
        
        return ability
    }
    
    
    
    
    // method to return the exits and abilities in  the room
    func description() -> String {
        return "\nYou are \(tag).\n *** \(self.getExits()) \n Abilities in room: \(self.getAbilities())"
    }
    
    
    deinit {
        tag = ""
        doors.removeAll()
    }
    
}







