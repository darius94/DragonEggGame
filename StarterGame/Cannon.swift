//
//  Cannon.swift
//  StarterGame
//
//  Created by Darius Little on 4/24/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class Cannon : Ability {
    private var _shot : String = ""
    private var _name : String = ""
    private var _volume : Int
    private var _weight : Int
    var  _container : [String : AbilityProtocol] = [String : AbilityProtocol]()
    private var _decorator: AbilityProtocol?
    
    
    var isShot : Bool = true
  
    
    // name,shot, and weight getters
    
   override var name : String {
        get{
            return _name
        }
        set{
            _name = newValue
            
            }
        }
    
    var shot : String {
        get{
            return _shot
        }
        set{
            _shot = newValue
            
        }
    }

    
   override var weight : Int {
        get{
            return _weight
        }
        set{
            _weight = newValue
            
        }
    }
    
  override  var volume : Int {
        get{
            return _volume
        }
        set{
            _volume = newValue
        }
    }
    
    
    convenience init(){
        self.init(name:"",shot:"Molten Lava",weight:20,volume:3)
        
    }
    
    init(name: String,shot: String,weight:Int,volume:Int){
        _shot = shot
        _name = name
        _weight = weight
        _volume = volume
         super.init(name: "", weight: 0, volume: 0)
    }


    
    override func getName() -> String {
        return name
    }
    
    override func getVolume() -> Int {
        return _volume
    }
        
    override func getWeight() -> Int {
        return weight
    }
    
    
  //method for shot
    func shoot(shot: String) -> String{
        return _shot
        
    }
    
    override func decorate(decorator : AbilityProtocol) {
        if self._decorator == nil {
            self._decorator = decorator
        } else {
            _decorator?.decorate(decorator : decorator)
            }
        }
        
    
    

        
    override func description() -> String {
        return _name + ((decorator != nil) ? "with" + _decorator!.description() + " weight at \(weight)": "volume at \(volume)")
    }
  }




