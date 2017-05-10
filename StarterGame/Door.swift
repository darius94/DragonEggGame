//
//  Door.swift
//  StarterGame
//
//  Created by Darius Little on 3/26/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation
class Door : Closeable,Lockable{
    private var _roomA : Room
    private var _roomB : Room
    private var _closed : Bool
    private var _locked : Bool
    private var _destroy :Bool
    private var _lock : Lockable?
    
    public var lockingMechanism : Lockable {
        get{return _lock!}
        set{_lock = newValue}
    }
    
  
    
    
    private convenience init(){
    //*** infinte loop if called.  its private but wont call in class and cant outside of class
        self.init()
    }
    
    init(roomA: Room,roomB : Room){
       
        _roomA = roomA
        _roomB = roomB
        _closed = false
        _locked = true
        _destroy = true
}

    func room(otherRoom: Room) ->Room {
        if otherRoom === _roomA{
            return _roomB
        }else {
          return  _roomA
        }
    
    }
   
    
    
    //method to open  the door
    func open(){
        if _lock != nil{
            if _lock!.canOpen(){
                _closed = false
            }
        }else{
        _closed = false
        }
    }
    
    //method to close  the door
    func close(){
        if _lock != nil{
            if _lock!.canClose(){
               _closed = true
            }
        }else{
            _closed = true
        }
    }
    
    
    func isClosed() ->Bool{
        return _closed
    
    }
    
    func isOpen() ->Bool{
        return !_closed
    
    
    }
    
   //method to lock door
    func lock()  {
        if _lock != nil{
            _lock!.lock()
        }
    }
    
    //method to unlock door
    func unlock()  {
        if _lock != nil{
            _lock!.unlock()
        }
    }
    //method to check if lock is locked
    func isLocked() -> Bool {
        if _lock != nil{
            return _lock!.isLocked()
        }else{
            return false
        }
    }
    //method to check if unlock is unlocked
    func isUnlocked() -> Bool {
        if _lock != nil{
            return _lock!.isUnlocked()
        }else{
              return true
        }
  }
    
   
    //method to return  destoy
    func destroy() -> Bool {
        return _destroy
    }
    
    
    // method to check if the door can open
    func canOpen() -> Bool{
        if _lock != nil{
            return _lock!.canOpen()
        }else{
        return true
        }
    }
    
    // method to check if the door can close
    func canClose() -> Bool{
        if _lock != nil{
            return _lock!.canClose()
        }else{
            return true
        }
    }
}
//method to connect the doors
func connect(firstRoom:Room,secondRoom:Room,firstLabel:String,secondLabel:String) ->Door{
    let door : Door = Door(roomA:firstRoom,roomB:secondRoom)
    firstRoom.setExit(firstLabel, door: door)
    secondRoom.setExit(secondLabel, door: door)
    return door
}
// method to connect doors and lock them with regular locks and close it.
func connectWithLockedClosedDoor(firstRoom:Room,secondRoom:Room,firstLabel:String,secondLabel:String) -> Door{
    let door : Door = connect(firstRoom: firstRoom,secondRoom:secondRoom,firstLabel:firstLabel,secondLabel:secondLabel)
    let rLock : RegularLock = RegularLock()
    door.lockingMechanism = rLock
    door.close()
    return door
}






