//
//  Protocols.swift
//  StarterGame
//
//  Created by Darius Little on 3/30/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

protocol AbilityProtocol {
    var name : String{ get set}
    var weight: Int{ get set}
    var volume: Int{ get set}
    func getName() -> String
    func getWeight() -> Int
    func getVolume() -> Int
    func description() -> String
    func decorate(decorator:AbilityProtocol)
    
}

protocol AbilityDecorator : AbilityProtocol {
    func decorate(decorator : AbilityProtocol)
}


protocol RoomProtocol{
    func setExit(_ exitName : String, door : Door)
    func getExit(_ exitName : String) -> Door?
    func getExits() -> String
    func description() -> String
    func drop(_ ability : AbilityProtocol)
    func setContainer(_ containerRoom: Room)
    
}

protocol Closeable{
    func open()
    func close()
    func isClosed() ->Bool //if a property it could be closed
    func isOpen() ->Bool //if a property it could be open
 
}



protocol Lockable{
    func lock()
    func unlock()
    func isLocked() ->Bool
    func isUnlocked() -> Bool
    func destroy() -> Bool
    func canOpen() -> Bool
    func canClose() -> Bool
    
    
}

