//
//  Eggs.swift
//  StarterGame
//
//  Created by Darius Little on 4/30/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class Eggs : AbilityProtocol,AbilityDecorator {
  
    private var _name : String = ""
    private var _volume : Int = 0
    private var _weight : Int = 0
   
    var  _container : [String : AbilityProtocol] = [String : AbilityProtocol]()
    private var _decorator: AbilityProtocol?
    
    
    
    
    
    
    var name : String {
        get{
            return _name
        }
        set{
            _name = newValue
            
        }
    }
    
  
    
    
    var weight : Int {
        get{
            return _weight
        }
        set{
            _weight = newValue
            
        }
    }
    
    var volume : Int {
        get{
            return _volume
        }
        set{
            _volume = newValue
            
        }
    }
    
    
    
    convenience init(){
        self.init(name:"",weight:0,volume:0)
        
    }
    
    init(name: String,weight:Int,volume:Int){
        _name = name
        _weight = weight
        _volume = volume
    }
    

    
    func getName() -> String {
        return _name
    }
    
    func getVolume() -> Int {
        return volume
    }
    
    func getWeight() -> Int {
        return weight
    }
    
    func decorate(decorator : AbilityProtocol) {
        if self._decorator == nil {
            self._decorator = decorator
        } else {
            _decorator?.decorate(decorator : decorator)
        }
    }
    
    
    func removeAbility(_ abilityName : String) -> AbilityProtocol? {
        let ability = _container[abilityName]
        if ability != nil {
            _container.removeValue(forKey: abilityName)
        }
        return ability
    }

    
    
    func description() -> String {
        return "\nYou have Eggs "
    }
        
    
}
