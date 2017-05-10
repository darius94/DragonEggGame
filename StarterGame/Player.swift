//
//  Player.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/16/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa


struct Stack<Element>{
    var abilities = [Element]()
    mutating func push(ability: Element){
        abilities.append(ability)
    }
    mutating func pop() -> Element{
        return abilities.removeLast()
    }
    mutating func isEmpty() -> Bool{
        return abilities.isEmpty
    }
    
}
var prevRoom = Stack<Room>()

class Player {
    var currentRoom : Room
    var io : GameOutput
    var attached : [String : AbilityProtocol]
    var weightLimit : Int
    var currentWeight : Int
    var volumeLimit : Int
    var currentVolume : Int
    var roomCount: Int
   
    
    
    
    init(room : Room, output : GameOutput) {
        currentRoom = room
        io = output
        attached = [String : Ability]()
        self.weightLimit = 7
        self.volumeLimit = 3
        self.currentVolume = 0
        self.currentWeight = 0
        self.roomCount = 0
        
        
    }
    

    
    func walkTo(_ direction : String) {
        // roomCount used to keep count on the movement the player makes for fly away method. 
        //also used inside to exit game if a numer is reached.
        roomCount += 1
        let door: Door? = currentRoom.getExit(direction)
        if door != nil {
            //
            if door!.isOpen(){
                let nextRoom :Room? = door?.room(otherRoom: currentRoom)
                if nextRoom != nil{
                    prevRoom.push(ability: currentRoom)
                    //let lastRoom = self.currentRoom
                    //could put a player in room using line under and put it in a room by nextRoom or self.currentRoom
                    self.currentRoom = nextRoom!
                    self.outputMessage("\n\(nextRoom!.description())")
                    self.outputMessage("\nRoom Count:\(roomCount)")
                    if roomCount >= 15 {
                        flyEnd()
                        self.errorMessage("\nYou walked around too long you lose!!!! remember backs dont count ,only When Go is used ")
                         self.errorMessage("\n***** remember backs dont count ,only When Go is used***** ")
                    }
                }
            }
            else{
                self.errorMessage("\nThe door on '\(direction) is closed")
            }

            } else {
            self.errorMessage("\nThere is no door on '\(direction)'")
        }
    }
    
    
    
    
    
    
    
    //func can open door if closed checks if closed,locked, or door exist at all
    func open(_ direction:String){
        let door: Door? = currentRoom.getExit(direction)
        if door != nil{
            door!.open()
            if door!.isOpen(){
                self.commandMessage("\nThe door on \(direction) is open")
            }else{
                self.commandMessage("\n The door on \(direction) is closed ")
                if door!.isLocked(){
                    self.commandMessage("\n The door on \(direction) is locked ")
                }else{
                    self.commandMessage("\n The door on \(direction) is just closed not locked ")
                }
            }
        }else{
         self.errorMessage("\nThere is no door on '\(direction)'")
        }
        
    }
    
    
    
    

    
    
    //allows the player to go back to the previous levels. using stack isEmpty
    func goBack(){
        if prevRoom.isEmpty() == true{
        self.errorMessage("\n You have reached the begining Room.")
        }   else{
                let nextRoom : Room? = prevRoom.pop()
                self.currentRoom = nextRoom!
                self.outputMessage("\n\(nextRoom!.description())")
            }
        
        }
    
    
    
    
    
    
    
    // unlocking the door
    func unlock(_ direction : String){
        let door: Door? = currentRoom.getExit(direction)
        if door != nil{
            door!.unlock()
            if door!.isUnlocked(){
                self.commandMessage("\nThe door on \(direction) is open")
            }else{
                self.commandMessage("\n The door on \(direction) is closed")
                
            }
            
        }else{
            self.errorMessage("\nThere is no door on '\(direction)'")
        }
    }
    
    
    
    
    
    
    
    
    
    //method to destroy the door which essentially unlocks the door and opens it to enter
    func destroy(direction : String) {
        let door: Door? = currentRoom.getExit(direction)
        if door != nil {
            door!.unlock()
            if door!.isUnlocked() {
                self.commandMessage("\nThe door on \(direction) is now destroyed")
                door!.open()
                self.commandMessage("\nThe door \(direction) is available  to walk through ")
            } else {
                if door!.isOpen() {
                    self.commandMessage("\nThe door \(direction) door  was already open")
                }
            }
        }
    }
  
    
    
    
    
    
    
    
    //method used to end the game at the final floor you use flyAway to take you back outside at start
    func flyAway(){
        if getAbilitiess() == "Eggs"{
            NotificationCenter.default.post(name: Notification.Name(rawValue: "GameWon"), object: nil)
            self.outputMessage("\nYou flew to ouside of gate.", color: NSColor.blue)
        
            for _ in 1...roomCount{
                goBack()
            }
                self.outputMessage("\nThanks \nAdiós \nAu Revoir \n再见 .", color: NSColor.blue)
        }else{
            self.warningMessage("\n Cant leave without your Eggs")
        }
    }
    
    
    // similar to above method just doesnt check for Eggs and ends the game if >15 rooms entered
    func flyEnd(){
            NotificationCenter.default.post(name: Notification.Name(rawValue: "GameWon"), object: nil)
            self.outputMessage("\nYou flew to ouside of gate.", color: NSColor.blue)
            for _ in 1...roomCount{
                goBack()
            }
            self.outputMessage("\nGame Over You Lose .Thanks \nAdiós \nAu Revoir \n再见 .", color: NSColor.blue)
        }


    
    
    
    
    
    
    
//method to fly back certain levels based on steps and picks up ability from room and attacks : 3 parser commands Fly Command
    func FlyBack(steps:String,abilityName: String){
        //converting String to Int
        let stringSteps: String = steps
        let intSteps: Int = Int(stringSteps)!
        
        if intSteps <= roomCount{
            for _ in 1...intSteps{
                goBack()
                //roomCount -= 1
            }
            pickup(abilityName: abilityName)
            attack(abilityName: abilityName)
        }else{
            self.warningMessage("\n can only back as far as youve gone forward ")
        }
        
    }
    
    
    
    
    
    
    
    
    //method attacking using a ability and doing it with Notification, checks if ability is used first then sends a notifcation
    //Player did attack theres an observer Game class. tells player what abily used and abilities you have.
    func attack(abilityName: String) {
       //abilityName == getAbilitiess()
        // abilityName == "FireBreathe"||abilityName == "Fire"||abilityName == "WindGust"||abilityName == "Claw"||abilityName == "GoldenWings"||abilityName == "UltimateFireBreathe"
        
        if abilityName == getAbilitiess(){
            let ability : String? = getAbilitiess()
                if ability != nil{
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "PlayerDidAttack"), object: nil)
                    self.outputMessage("\nI Attacked with \(abilityName) I have these abilities:\(getAbilitiess()).", color: NSColor.blue)
                }else{
                    self.warningMessage("\nYou dont have \(abilityName) yet + \(getAbilitiess()) ")
                }
            
        
        }else{
            self.warningMessage("\n\(abilityName) isnt an ability .Or You dont have \(abilityName) yet,\nYou have these Abilities:\(getAbilitiess())")
        }
}
    
    
    
    
    
    
    
    //method to attach the ability will be used in pickup
    func give(ability : AbilityProtocol) {
        attached[ability.getName()] = ability
    }
    
    
    
    
    
    
    
    
    
    
    //method for dropping an ability into the room that you had attached and printing out a message, checks if you have ability otherwise prints warning message. In if ability drops it and subtracts its weight and subs volume
    func drop(abilityName : String) {
        let ability : AbilityProtocol? = self.take(abilityName: abilityName)
        if ability != nil {
            currentRoom.drop(ability!)
            self.commandMessage("\nI dropped \(abilityName) in the room")
            currentWeight -= ability!.getWeight()
            currentVolume -= ability!.getVolume()
            self.commandMessage("\nCurrent Weight: \(currentWeight) ")
            self.commandMessage("\nCurrent Value: \(currentVolume) \n")
        }else {
            self.warningMessage("\nI do not have \(abilityName)")
            }
        }
    
    
    
    
    
    
    
    //method picking up an ability in the current Room and checking weight and volume. if less than limit will be picked up and weight and volume added to total. else decrements the weight and volume you picked up because when you pick it up to check it it adds it before you check the weight and volume so you have to subtract it if dropping it back into the Room.
    func pickup(abilityName : String){
       
        //checking if the pickup ability is an actual ability
         if abilityName == "FireBreathe"||abilityName == "Claw"||abilityName == "GoldenWings"||abilityName == "UltimateFireBreathe"||abilityName == "Fire"||abilityName == "WindGust"||abilityName == "Eggs"||abilityName == "Cannon"{
            //refers to pickup defined in Room
        let ability : AbilityProtocol? = currentRoom.pickup(abilityName)
            weightLimit = 7
            volumeLimit = 3
            
        //using a if statement to check the weight and volume and then pick up and tell info
            if (currentWeight + ability!.getWeight() <= weightLimit && (currentVolume + ability!.getVolume()) <= volumeLimit){
                
                attached[abilityName] = ability
                currentWeight += ability!.getWeight()
                currentVolume += ability!.getVolume()
                self.give(ability: ability!)
                self.commandMessage("\nI picked up \(abilityName) from room")
                self.commandMessage("\nMax weight: 7")
                self.commandMessage("\nMax Volume: 3")
                self.commandMessage("\nYour total weight currently is \(currentWeight)")
                self.commandMessage("\nYour total volume currently is \(currentVolume)\n")
                }
            else{
                // decremented the ability we picked up from total and drops its back into room
                self.warningMessage("\n\(abilityName) cant be attached: weight limit or volume reached.Try to  **drop an ability.**. ")
                //currentWeight -= ability!.getWeight()
                //currentVolume -= 1
                currentRoom.drop(ability!)
            }
            }
         
    else{
        self.warningMessage("\n\(abilityName) isnt an ability ")
        }
        
}

    
   //Method to show  on screen the attached abilities for the inventory command
    func inventory() {
        self.commandMessage("\nAttached Abilities: \(self.getAbilitiess())")
    }
    
    
    // method to display attached abilities
    func getAbilitiess() -> String {
        let abilityName : [String] = [String](attached.keys)
        return  abilityName.joined(separator: "\n")
    }
    
    
    //a method to remove a ability from the room,removeValue for Key is how a key os removed the dictionary 
    func take(abilityName : String) -> AbilityProtocol? {
        let ability = attached[abilityName]
        if ability != nil {
            attached.removeValue(forKey: abilityName)
        }
        return ability
    }
    
    
    
    
    
    
    
    func outputMessage(_ message : String) {
        io.sendLine(message)
    }
    
    func outputMessage(_ message : String, color : NSColor) {
        let lastColor : NSColor = io.currentColor
        io.currentColor = color
        self.outputMessage(message)
        io.currentColor = lastColor
    }
    
    func errorMessage(_ message : String) {
        self.outputMessage(message, color: NSColor.red)
    }
    
    func warningMessage(_ message : String) {
        self.outputMessage(message, color: NSColor.orange)
    }
    
    func commandMessage(_ message : String) {
        self.outputMessage(message, color: NSColor.brown)
    }
}
