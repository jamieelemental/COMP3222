//
//  Ai.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation

class Ai {
    
    func takeMove(valid: GameStatus,valid2: IsValidMove, turn: Int) -> String {
        let validMove = valid.returnValidMove()
        valid2.checkValid(validMove)
        return validMove
    }
}