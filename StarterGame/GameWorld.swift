//
//  GameWorld.swift
//  StarterGame
//
//  Created by Darius Little on 3/14/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//


import Foundation

class GameWorld{
    static let sharedInstance : GameWorld = GameWorld()
    // can access by GameWorld.sharedInstance.entrance
    //sharedInstance is the singleton and can be accessed at any class 
   
   private  var _entrance : Room?
   
    private var _trigger: Room?
    var entrance : Room {
        get{
            return _entrance!
        }
    }
    
    
    
    var trigger : Room{
    get{
        return _trigger!
       }
    }
  
    
    private init(){
        _entrance = createWorld()
        
    }
   
    
    
    
    
private func createWorld() -> Room {
    let outside = Room(tag: "Outside the main entrance of the castle\n Theres a massive a gate thats cracked open")
    let courtyard = Room(tag: "Inside the gate in the Courtyard surrounded by grass a bridge is in front of you and a big moat around it. ")
    let bridge = Room(tag: "In the bridge above the Moat water to east and west")
    let moat = Room(tag: "In the Moat,I hope you can swim, theres may be abilities here")
    let castleEntrance = Room(tag: "Directly in front of the castle door")
    let floor1 = Room(tag: "You are in  first floor of the castle")
    let floor2 = Room(tag: "You are in  second floor of the castle")
    let floor3 = Room(tag: "You are in  third floor of the castle")
    let floor4 = Room(tag: "You are in  fourth floor of the castle ")
    let floor5 = Room(tag: "You are in  fifth floor of the castle., the lights dont work so its very dark if an item cant be picked up it should be attacked")
    let finalFloor = Room(tag: "In  the room with the Eggs you win the game, Pickup the eggs and FlyAway")
    
    
    
    
var door : Door = connect(firstRoom:outside,secondRoom:courtyard,firstLabel:"north",secondLabel:"south")
     door = connect(firstRoom:courtyard,secondRoom:bridge,firstLabel:"north",secondLabel:"south")
    
    
    
    door = connect(firstRoom:bridge,secondRoom:castleEntrance,firstLabel:"north",secondLabel:"south")
    door = connect(firstRoom:castleEntrance,secondRoom:floor1,firstLabel:"north",secondLabel:"south")
    door.close()
    door = connect(firstRoom:moat,secondRoom:bridge,firstLabel:"east",secondLabel:"west")
    door = connect(firstRoom:moat,secondRoom:bridge,firstLabel:"west",secondLabel:"east")
    door = connect(firstRoom:floor1,secondRoom:floor2,firstLabel:"north",secondLabel:"south")
    door = connect(firstRoom:floor2,secondRoom:floor3,firstLabel:"north",secondLabel:"south")
    door = connect(firstRoom:floor3,secondRoom:floor4,firstLabel:"north",secondLabel:"south")
    door = connect(firstRoom:floor4,secondRoom:floor5,firstLabel:"north",secondLabel:"south")
   
    
    //Example of  Facade locking with a regular lock and closing the door
    door = connectWithLockedClosedDoor(firstRoom:floor5,secondRoom:finalFloor,firstLabel:"north",secondLabel:"south")
   
    
   
    
    
    
  
    
    ////////////////////////////////////
    /*Decorator explained: is like adding things on top of a defined thing. can add something that will change a characteristic of an object without changing the object. Can give the item and concatenate the the different things and give the values.
     with delegate you have 1
     but with decorator you can have multiple
     */
    /*
    notification center where seperate objects send there info without directly contacting one another
    can be done in swift because language is message passing most other languages arent
    */
    /*
    design Pattern Facade: simplifies the interface and you can request something in the background
    ex: like picking a pizza without telling your toppings. like a hot and ready-pep from little caesars
    if i create another connect like :connect with regular lock it doesnt say what kind of lock in Door class . if it was a func connect with regular lock , it makes it with automatically with regular lock. can be added just like function at bottom of door.its a simple way of creating something complex
        */
    ////////////////////////////////////
    
    
    
    
    
    
    
    ////////////////////////
    
    ////dropping something thats not ability into the rooms
    //let bag : ItemContainer =ItemContainer(name:"bag",value:1)
    //theGreen.dropItem(item:bag)
    //let goldcoin : Item = Item(name:"coin",value:5)
    //let goldplating : Item = Item (name:"gold",value:25)
    //goldcoin.decorate(decorator:golfPlating)
    //bad.addItem(item:goldcoin)
    //thegreen.dropItem(item:bag)
    
    
    
    /*
     let staff : ItemProtocol = Item("staff",value:3)
     let gold : ItemProtocol = Item(name:"gold",value:10)
     let magic:ItemProtocol = Item(name:"magic",value:15)
     
     //staff.decorate(decorator : gold)
     staff.decorate(decorator : magic)
     schuster.dropIten(item: staff)
     */
    
    //////////////////////
    
    
    
    
    
    
    
   
    
    
       _trigger = floor5
    
    
    //can drop by creating a dictionary something similar to door exit so you can drop multiple items not just 1
    //what he shows in class isnt the correct way because its for only one item
    
    // creating Abilities and dropping in the rooms
    let fireBreathe : Ability = Ability(name:"FireBreathe",weight:2,volume:1)
    castleEntrance.drop(fireBreathe)
    
    
    let goldenWings : Ability = Ability(name:"GoldenWings",weight:2,volume:1)
    moat.drop(goldenWings)
    
    
    let fire : AbilityProtocol = Ability(name:"Fire",weight:1,volume:1)
    let claw : AbilityProtocol = Ability(name:"Claw",weight:5,volume:1)
    courtyard.drop(fire)
    
    //decorating claw with fire
    claw.decorate(decorator: fire)
    floor3.drop(claw)
    
    
    
    
    
    
     let WindGust: AbilityProtocol = Ability(name:"WindGust",weight:1,volume:1)
     moat.drop(WindGust)
   
    
   
    let UltimateFireBreathe : Ability = Ability(name:"UltimateFireBreathe",weight:4,volume:1)
     floor4.drop(UltimateFireBreathe)
   
    //dropping Cannon into room cant be  picked up too heavy
    let cannon1 : Cannon = Cannon(name:"Cannon",shot:"Molten Lava",weight:20,volume:4)
    floor5.drop(cannon1)
    
    //eggs the purpose of the game is to pick this up
    let eggs : Eggs = Eggs(name:"Eggs",weight:7,volume:3)
    finalFloor.drop(eggs)
    
   
    
    
    
    return outside
    }
    
    
    
    
}
