//
//  Ai.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation
import SpriteKit

class Ai {
    
    func takeMove(valid: GameStatus,valid2: IsValidMove, turn: Int) -> String {
        
        var validMove = valid.returnValidMove()
        //valid.hasWon(validMove, turn: turn)
        valid2.checkValid(validMove)
        
        print("ValidMove: ", validMove)
        
        return validMove
    }
    
    
}