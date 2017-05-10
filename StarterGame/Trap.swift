//
//  Trap.swift
//  StarterGame
//
//  Created by Darius Little on 3/28/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//
//a trap for the room where the exits dont work
import Foundation

//
//class Trap : RoomProtocol {



class Trap : RoomProtocol{
    var doors : [String : Door]
    var tag : String
    var abilities : [String : AbilityProtocol]
    var _container : Room?
    var container : Room
        
        {get{
            return _container!
        }set{
            _container = newValue
        }
    }
    
    var isTrap : Bool = true
    
    convenience init() {
        self.init(tag: "No Tag")
    }
    
    init(tag : String) {
        doors = [String : Door]()
        self.tag = tag
        abilities = [String : Ability]()
        // super.init(tag : tag)
        let nc = NotificationCenter.default
        nc.addObserver(forName: Notification.Name(rawValue:"PlayerDidAttack"), object:nil, queue: nil, using:playerPaidFee)
    }
    
    
    func setExit(_ exitName : String, door : Door){
        
    }
    
    
    func drop(_ ability : AbilityProtocol) {
        abilities[ability.getName()] = ability
    }
    
    
    func getExits() -> String{
        let exitNames : [String] = [String](doors.keys)
        return "Exits: " + exitNames.joined(separator: " ")
        
    }
    
    func getExit(_ exitName : String) -> Door? {
        if isTrap
        {
            // return _container
            return nil
        }
        else{
            return doors[exitName]
            
            
        }
    }
    
    
    
    func playerPaidFee(notification:Notification) -> Void{
        isTrap = false
        
    }
    
    
    //printing out information to tell you to pay of your in the trap but if not in trap just prints regular description
    func description() -> String {
        if !isTrap{
            return "You are \(tag).\n *** \(self.getExits())"
        }
        return "You are \(tag).\n *** \(self.getExits())\nYou must attack to get out of here"
    }
    
    func setContainer(_ containerRoom: Room){
        container = containerRoom
        
    }
}

