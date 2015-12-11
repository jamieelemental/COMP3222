//
//  GamePlay.swift
//  Connect Four Advance
//
//  Created by J C C Element on 10/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation

//var playerTurn = 1
//var moveNo = 1

//var game = GameStatus()
//var move = IsValidMove()


//    func columnName(pixel: CGPoint) -> String
//    {
//        //Gets a column name identifier for each column, based on co-ordinate position.
//        switch pixel.x
//        {
//        case let x where x >= (paddingSidesWidth) && x <= (paddingSidesWidth + colWidth):
//            return "buttonFactory1"
//        case let x where x >= (paddingSidesWidth + colWidth) && x <= (paddingSidesWidth + 2 * colWidth):
//            return "buttonFactory2"
//        case let x where x >= (paddingSidesWidth + 2 * colWidth) && x <= (paddingSidesWidth + 3 * colWidth):
//            return "buttonFactory3"
//        case let x where x >= (paddingSidesWidth + 3 * colWidth) && x <= (paddingSidesWidth + 4 * colWidth):
//            return "buttonFactory4"
//        case let x where x >= (paddingSidesWidth + 4 * colWidth) && x <= (paddingSidesWidth + 5 * colWidth):
//            return "buttonFactory5"
//        case let x where x >= (paddingSidesWidth + 5 * colWidth) && x <= (paddingSidesWidth + 6 * colWidth):
//            return "buttonFactory6"
//        case let x where x >= (paddingSidesWidth + 6 * colWidth) && x <= (paddingSidesWidth + 7 * colWidth):
//            return "buttonFactory7"
//        default:
//            return "failed"
//        }
//    }


//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//
//        for touch in touches {
//
//            let location = CGPoint(x:touch.locationInNode(self).x, y:(paddingBottomHeight + gridHeight - colWidth)) //Take x co-ordinate of users input, changes Y co-ordinate to top of column
//
//            let col = columnName(location) //get column identifier
//
//            if move.checkValid(col){
//
//                let Node = SKShapeNode(circleOfRadius: (colWidth - 0.4 * gridLineWidth)/2) //Circle have a radius of half the column space, minus some of the column walls.
//
//                game.hasWon(col, turn: playerTurn) //Prompt some Win notice?
//
//                if playerTurn == 1 {
//                    Node.fillColor = UIColor.yellowColor()
//                    playerTurn = 2
//                }
//
//                else if playerTurn == 2{
//                    Node.fillColor = UIColor.redColor()
//                    playerTurn = 1
//                }
//
//                Node.position = location
//                Node.physicsBody = SKPhysicsBody(circleOfRadius: Node.frame.width/2)
//                Node.physicsBody?.friction = 0
//                Node.physicsBody?.restitution = 0.1
//                Node.physicsBody?.allowsRotation = false
//                Node.zPosition = 1.0
//
//                self.addChild(Node)
//
//                moveNo++
//            }
//        }
//    }
