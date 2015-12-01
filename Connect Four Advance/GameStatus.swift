//
//  GameStatus.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation

class GameStatus {
    var array1: [Int] = [0,0,0,0,0,0]
    var array2: [Int] = [0,0,0,0,0,0]
    var array3: [Int] = [0,0,0,0,0,0]
    var array4: [Int] = [0,0,0,0,0,0]
    var array5: [Int] = [0,0,0,0,0,0]
    var array6: [Int] = [0,0,0,0,0,0]
    var array7: [Int] = [0,0,0,0,0,0]
    var b1Count = 0
    var b2Count = 0
    var b3Count = 0
    var b4Count = 0
    var b5Count = 0
    var b6Count = 0
    var b7Count = 0
    //var turn = 0
    
    func hasWon(move: String, turn: Int) -> Bool {
        
        switch (move){
        case "buttonFactory1":
            array1[b1Count] = turn
            b1Count = b1Count + 1
        case "buttonFactory2":
            array2[b2Count] = turn
            b2Count = b2Count + 1
        case "buttonFactory3":
            array3[b3Count] = turn
            b3Count = b3Count + 1
        case "buttonFactory4":
            array4[b4Count] = turn
            b4Count = b4Count + 1
        case "buttonFactory5":
            array5[b5Count] = turn
            b5Count = b5Count + 1
        case "buttonFactory6":
            array6[b6Count] = turn
            b6Count = b6Count + 1
        case "buttonFactory7":
            array7[b7Count] = turn
            b7Count = b7Count + 1
        default: break
            
        }
        
        // check col for win
        func CheckCol(array: [Int]) -> Int
        {
            var prevItem = 10
            var count = 1
            
            for item in array
            {
                if(prevItem == item)
                {
                    count++
                } else if (prevItem != item) {
                    count = 0
                }
                
                prevItem = item
            }
            
            return count
        }
        
        print(CheckCol(array1))
        print(CheckCol(array2))
        print(CheckCol(array3))
        print(CheckCol(array4))
        print(CheckCol(array5))
        print(CheckCol(array6))
        print(CheckCol(array7))

        print(array1)
        print(array2)
        print(array3)
        print(array4)
        print(array5)
        print(array6)
        print(array7)
        
        return true
    }
    
    
    
}