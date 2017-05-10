//
//  Game.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/17/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa
class Game {
    var player : Player?
    var parser : Parser
    var playing : Bool
    
    init(gameIO : GameOutput) {
        //let gameWorld : GameWorld = GameWorld()
        playing = false
        parser = Parser(newCommands: CommandWords())
        player = Player(room:GameWorld.sharedInstance.entrance, output: gameIO)
    
        //if you have alot of these can use constants
        
        //The notication centers used for fly Away methods and attacks
        
       
        let nca = NotificationCenter.default
        nca.addObserver(forName: Notification.Name(rawValue: "GameWon"), object : nil, queue: nil,using:GameWon)
        
        
        let ncb = NotificationCenter.default
        ncb.addObserver(forName: Notification.Name(rawValue:"PlayerDidAttack"), object:nil, queue: nil, using:PlayerDidAttack)
        
        
    }
   
    
    
    
    // for notification if attacked
    func PlayerDidAttack(Notification : Notification)  {
        self.attacks()
    }
    func attacks() {
        player?.outputMessage("\nYou have  attacked")
    }
    
    
    //System is a singleton and only 1 instance of it so if you call it all the things are in that system. 

    
    
    //
    func playerWillEnterRoom(notification:Notification) -> Void{
        //player?.outputMessage("\n\n\tplayer entered room", color: NSColor.purple)
        let room : Room = notification.object as! Room
        if room === GameWorld.sharedInstance.trigger
        {
            player?.outputMessage("\n\t You got to the trigger room", color:NSColor.green)
           
        }
    }
       func start() {
        playing = true
        player?.outputMessage(welcome())
        //used for testing to start at a certain point if you are testing
       // execute("go west")
       // execute("go west")
       // execute("go west")
    }
    
    func end() {
        playing = false
        player?.outputMessage(goodbye())
    }
    
    func welcome() -> String {
        let message = "Welcome to the World of Dragon Egg\n\nYou are a Dragon with no abilities outside the gate of the castle. You are to make your way through the castle to the top and pickup your eggs and fly back to outside the gate . Goodluck remember you can go to max 15 rooms ,back doesn't count \n\nType 'help' if you need help."
        return "\(message)\n\n\(player!.currentRoom.description())"
        
    }
    

    
    func goodbye() -> String {
        return "\nThank you for playing. ~Darius Little 2017\n"
    }
    
    // method used to end the game once you reach the end used by notication above and FlyAway method in Player
    func GameWon(Notification : Notification) {
        player?.outputMessage("\nYou have  Won")
        self.end()
    }
    
    
    
    func execute(_ commandString : String) -> Bool {
        var finished : Bool = false
        if playing {
            player?.commandMessage("\n>\(commandString)")
            let command : Command? = parser.parseCommand(commandString)
            if command != nil {
                finished = (command?.execute(player!))!
            } else {
                player?.errorMessage("\nI don't understand...")
            }
        }
        return finished
    }
}
