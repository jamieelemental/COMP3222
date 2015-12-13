//
//  Ai.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation

class Ai {
    // AI is passed the current copy of the GameStaus Class and uses this to find a valid move.
    func takeMove(valid: GameStatus,valid2: IsValidMove, turn: Int) -> String {
        let validMove = valid.returnValidMove()
        valid2.checkValid(validMove)
        return validMove
    }
}