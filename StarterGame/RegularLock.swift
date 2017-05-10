//
//  RegularLock.swift
//  StarterGame
//
//  Created by Darius Little on 4/11/17.
//  Copyright © 2017 Rodrigo Obando. All rights reserved.
//

import Foundation

class RegularLock : Lockable{
    private var _locked : Bool = true
    private var _destroy :Bool = true
  
    
    
    
    func lock(){
      
        _locked = true
    }
    
    func unlock(){
              
        _locked = false
    }
    

    
    
    
    func isLocked() ->Bool{
        return _locked
    
    }
    
    func isUnlocked() -> Bool{
        return !_locked
    }
    
    func destroy() -> Bool{
        if _locked {
            return _destroy
        }
        return false
    }
    
    func canOpen() -> Bool{
        if isUnlocked(){
            return true
        
        }else{
            return false
        }
    
    }
    func canClose() -> Bool{
        return true
    }

}
