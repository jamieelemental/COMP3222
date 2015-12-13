//
//  GameStatus.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GameStatus {
    var Player = 0
    var board: [[Int]] = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
    var col1count = 0
    var col2count = 0
    var col3count = 0
    var col4count = 0
    var col5count = 0
    var col6count = 0
    var col7count = 0
    let leaderBoard = LeaderBoard()
    
    // check for a winner in a coloum.
    func CheckCol(array: [[Int]], col: Int) -> String {
        var prevItem = 10
        var count = 1
        if (array[col].count > 3) {
            for item in array[col] {
                if(prevItem == item && prevItem != 0){
                    count++
                    if count == 4{
                        return "won"
                    }
                } else {
                    count = 1
                }
                prevItem = item
            }
            
        }
        return "None"
    }
    
    
    // check for a winner in a Row.
    func CheckRow(array: [[Int]], col: Int, row: Int) -> String {
        var prevItem = 10
        var item = 5
        var count = 1
        var i = 0
        for (i = 0; i < array.count; i++){
            item = array[i][row]
            if(prevItem == item && prevItem != 0){
                count++
                if count == 4{
                    return "won"
                }
            } else {
                count = 1
            }
            prevItem = item
        }
        return "None"
    }
    
    // check for a winner in diagonal left to right.
    func CheckDiaLR(array: [[Int]], col: Int, row: Int) -> String {
        var count = 0
        for value in -3...3{
            if( (col+value) >= 0 && (col+value) < board.count && (row+value) >= 0 && (row+value) < board[col+value].count){
                if(board[col+value][row+value] == Player){
                    count++
                    if(count == 4){
                        return "won"
                    }
                    
                }
            }
        }
        return "None"
    }
    
    // check for a winner in diagonal right to left.
    func CheckDiaRL(array: [[Int]], col: Int, row: Int) -> String {
        var count = 0
        for value in -3...3{
            if( (col+value) >= 0 && (col+value) < board.count && (row-value) >= 0 && (row-value) < board[col+value].count){
                if(board[col+value][row-value] == Player){
                    count++
                    if(count == 4){
                        return "won"
                    }
                    
                }
            }
        }
        return "None"
    }
    
    
    
    // Track game status.
    
    func hasWon(move: String, turn: Int) -> Bool {
        Player = turn
        var result = ""
        var result2 = ""
        var result3 = ""
        var result4 = ""
        
        switch (move){
        case "buttonFactory1":
            //board[0].append(turn)
            board[0][col1count] = turn
            result = CheckCol(board, col: 0)
            result2 = CheckRow(board, col: 0,row: col1count)
            result3 = CheckDiaLR(board, col: 0,row: col1count)
            result4 = CheckDiaRL(board, col: 0,row: col1count)
            col1count++
        case "buttonFactory2":
            board[1][col2count] = turn
            result = CheckCol(board, col: 1)
            result2 = CheckRow(board, col: 1,row: col2count)
            result3 = CheckDiaLR(board, col: 1,row: col2count)
            result4 = CheckDiaRL(board, col: 1,row: col2count)
            col2count++
        case "buttonFactory3":
            board[2][col3count] = turn
            result = CheckCol(board, col: 2)
            result2 = CheckRow(board, col: 2,row: col3count)
            result3 = CheckDiaLR(board, col: 2,row: col3count)
            result4 = CheckDiaRL(board, col: 2,row: col3count)
            col3count++
        case "buttonFactory4":
            board[3][col4count] = turn
            result = CheckCol(board, col: 3)
            result2 = CheckRow(board, col: 3,row: col4count)
            result3 = CheckDiaLR(board, col: 3,row: col4count)
            result4 = CheckDiaRL(board, col: 3,row: col4count)
            col4count++
        case "buttonFactory5":
            board[4][col5count] = turn
            result = CheckCol(board, col: 4)
            result2 = CheckRow(board, col: 4,row: col5count)
            result3 = CheckDiaLR(board, col: 4,row: col5count)
            result4 = CheckDiaRL(board, col: 4,row: col5count)
            col5count++
        case "buttonFactory6":
            board[5][col6count] = turn
            result = CheckCol(board, col: 5)
            result2 = CheckRow(board, col: 5,row: col6count)
            result3 = CheckDiaLR(board, col: 5,row: col6count)
            result4 = CheckDiaRL(board, col: 5,row: col6count)
            col6count++
        case "buttonFactory7":
            board[6][col7count] = turn
            result = CheckCol(board, col: 6)
            result2 = CheckRow(board, col: 6,row: col7count)
            result3 = CheckDiaLR(board, col: 6,row: col7count)
            result4 = CheckDiaRL(board, col: 6,row: col7count)
            col7count++
        default: break
        }
        
        if (result == "won"||result2 == "won"||result3 == "won"||result4 == "won"){
            return true
        }
        return false
    }
    
    
    
    // Method to finish the game.
    func gameWon(name: String, turns: Int,times: String){
        let alert = UIAlertView()
        alert.title = "GameWon"
        alert.message = "You have won \(name)"
        alert.addButtonWithTitle("Submit")
        alert.show()
        
        // Save to LeaderBoard
        let currentTime = CFAbsoluteTimeGetCurrent()
        let gameLength = String(format: "%.2f", currentTime - Double(times)!)
        
        
        leaderBoard.Save(name, turns: turns, time: gameLength)
    }
    
    func gameOver(){
        let alert = UIAlertView()
        alert.title = "GameOver"
        alert.message = " Click to restart"
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
    
    func returnBoard() -> [[Int]]{
        return board
    }
    
    
    func returnValidMove() -> String{
        var currentGameStatus: [Int] = [col1count,col2count,col3count,col4count,col5count,col6count,col7count]
        var count = 0
        var move = ""
        var validMoves: [String] = []
        for index in currentGameStatus {
            print("Col: ", index)
            if index < 6 {
                count++
                move = "buttonFactory\(count)"
                validMoves.append("buttonFactory\(count)")
            } else {
                count++
            }
        }
        let randomIndex = Int(arc4random_uniform(UInt32(validMoves.count)))
        move = validMoves[randomIndex]
        return move
    }
    
}




