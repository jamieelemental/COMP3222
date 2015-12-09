//
//  GameStatus.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation

class GameStatus {
    var array1: [Int] = []
    var array2: [Int] = []
    var array3: [Int] = []
    var array4: [Int] = []
    var array5: [Int] = []
    var array6: [Int] = []
    var array7: [Int] = []
    var Player = 0
    
    // check for a winner in a coloum.
    func CheckCol(array: [Int]) -> String
    {
        var prevItem = 10
        var count = 1
        if (array.count > 3){
            for item in array
            {
                if(prevItem == item && prevItem != 0)
                {
                    count++
                    if count == 4 {
                        return "won"
                    }
                } else if (prevItem != item) {
                    count = 1
                }
                
                prevItem = item
            }
        }
        
        return "None"
    }

    
    
    // Check for a winner.
    
    func hasWon(move: String, turn: Int) -> Bool {
        Player = turn
        var result = ""
        
        switch (move){
        case "buttonFactory1":
            array1.append(turn)
            result = CheckCol(array1)
        case "buttonFactory2":
            array2.append(turn)
            result = CheckCol(array2)
        case "buttonFactory3":
            array3.append(turn)
            result = CheckCol(array3)
        case "buttonFactory4":
            array4.append(turn)
            result = CheckCol(array4)
        case "buttonFactory5":
            array5.append(turn)
            result = CheckCol(array5)
        case "buttonFactory6":
            array6.append(turn)
            result = CheckCol(array6)
        case "buttonFactory7":
            array7.append(turn)
            result = CheckCol(array7)
        default: break
        }
        
        print(result)
        
        if (result == "won"){
            return true
        }
        return false
    }
    
    
    
}