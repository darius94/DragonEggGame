//
//  Ability.swift
//  StarterGame
//
//  Created by Darius Little on 3/28/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation



class Ability :AbilityDecorator,AbilityProtocol {
    private var _name : String
    private var _weight : Int
    private var _volume : Int
    private var  _container : [String : AbilityProtocol] = [String : AbilityProtocol]()
    var decorator : AbilityDecorator?
    private var _decorator: AbilityProtocol?
    
    //getters and setters for name weight and volume
    
    var name : String {
        get{
            return _name
        }
        set{
            _name = newValue
            
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

    var weight : Int {
        get{
            return _weight + ((decorator != nil) ? decorator!.weight : 0)
        }
        set{
            _weight = newValue
            
        }
    }
    
    
    
    convenience init() {
        self.init(name: "No Name", weight: 0,volume:0)
    }
    
    init(name: String, weight: Int, volume:Int) {
        _name = name
        _weight = weight
       _volume = volume
    }
    
   
    
  

    func getName() -> String {
        return name
    }
    
    func getVolume() -> Int {
        return volume
    }
    
    func getWeight() -> Int {
        return weight
        
    }
   // method to decorate an ability
    func decorate(decorator : AbilityProtocol) {
        if _decorator == nil{
            _decorator = decorator
            
        }else{
            _decorator?.decorate(decorator : decorator)
            
        }
    }
    
   
    //description of ability name,weight and volume
    func description() -> String{
        return name + ((decorator != nil) ? "with" + decorator!.description() + " weight: \(weight)": "volume: \(volume)")
        
        }

    
}

    
    

