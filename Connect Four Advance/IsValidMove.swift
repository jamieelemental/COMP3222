//
//  IsValidMove.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation

class IsValidMove {
    var b1Count = 0
    var b2Count = 0
    var b3Count = 0
    var b4Count = 0
    var b5Count = 0
    var b6Count = 0
    var b7Count = 0
    
    func checkValid(move: String) -> Bool {
        
        switch (move){
        case "buttonFactory1":
            b1Count = b1Count + 1
            if b1Count < 7 {
                return true
            } else {
            return false
            }
        case "buttonFactory2":
            b2Count = b2Count + 1
            if b2Count < 7 {
                return true
            } else {
                return false
            }
        case "buttonFactory3":
            b3Count = b3Count + 1
            if b3Count < 7 {
                return true
            } else {
                return false
            }
        case "buttonFactory4":
            b4Count = b4Count + 1
            if b4Count < 7 {
                return true
            } else {
                return false
            }
        case "buttonFactory5":
            b5Count = b5Count + 1
            if b5Count < 7 {
                return true
            } else {
                return false
            }
        case "buttonFactory6":
            b6Count = b6Count + 1
            if b6Count < 7 {
                return true
            } else {
                return false
            }
        case "buttonFactory7":
            b7Count = b7Count + 1
            if b7Count < 7 {
                return true
            } else {
                return false
            }
        default:
            return false
        }
    }
}

