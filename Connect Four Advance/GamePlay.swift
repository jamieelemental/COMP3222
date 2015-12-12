////
////  GamePlay.swift
////  Connect Four Advance
////
////  Created by J C C Element on 10/12/2015.
////  Copyright © 2015 DanAndJamie. All rights reserved.
////
//
//import Foundation
//import UIKit
//import SpriteKit
//
//class GamePlay
//{
//    var game = GameStatus()
//    var move = IsValidMove()
//    var gamePlay = GamePlay()
//
//    
//    func columnName(pixel: CGPoint, screen: CGSize) -> String
//    {
//        var shortSide = screen.width
//        if screen.width > screen.height { shortSide = screen.height }
//        
//        let paddingSidesWidth = (screen.width - shortSide/100 * 70) / 2
//        let colWidth = (shortSide/100 * 70 / 7)
//        
//        //Gets a column name identifier for each column, based on co-ordinate position.
//        switch pixel.x
//        {
//            
//        case let x where x >= paddingSidesWidth && x <= paddingSidesWidth + colWidth:
//            return "buttonFactory1"
//            
//        case let x where x >= paddingSidesWidth + colWidth && x <= paddingSidesWidth + 2 * colWidth:
//            return "buttonFactory2"
//            
//        case let x where x >= paddingSidesWidth + 2 * colWidth && x <= paddingSidesWidth + 3 * colWidth:
//            return "buttonFactory3"
//            
//        case let x where x >= paddingSidesWidth + 3 * colWidth && x <= paddingSidesWidth + 4 * colWidth:
//            return "buttonFactory4"
//            
//        case let x where x >= paddingSidesWidth + 4 * colWidth && x <= paddingSidesWidth + 5 * colWidth:
//            return "buttonFactory5"
//            
//        case let x where x >= paddingSidesWidth + 5 * colWidth && x <= paddingSidesWidth + 6 * colWidth:
//            return "buttonFactory6"
//            
//        case let x where x >= paddingSidesWidth + 6 * colWidth  && x <= paddingSidesWidth + 7 * colWidth:
//            return "buttonFactory7"
//        default:
//            return "failed"
//        }
//        
//        
//        func dropCounter(location: CGPoint, screen: CGSize, status: GameStatus)
//        {
//            var shortSide = screen.width
//            if screen.width > screen.height { shortSide = screen.height }
//            
//            
//                
//                //let location = CGPoint(x: touch.locationInView(self.view).x, y:(self.view.frame.height/100 * 60)) //Take x co-ordinate of users input, changes Y co-ordinate to top of column
//                
//                let col = self.columnName(location, screen: screen) //get column identifier
//                print(col)
//                
//                if status.checkValid(col){
//                    
//                    let Node = SKShapeNode(circleOfRadius: (shortSide/100 * 67 / 7)/2) //Circle have a radius of half the column space.
//                    
//                    game.hasWon(col, turn: playerTurn) //Prompt some Win notice?
//                    
//                    if playerTurn == 1 {
//                        Node.fillColor = UIColor.yellowColor()
//                        playerTurn = 2
//                    }
//                        
//                    else if playerTurn == 2{
//                        Node.fillColor = UIColor.redColor()
//                        playerTurn = 1
//                    }
//                    
//                    Node.position = location
//                    Node.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: Node.frame.width * 0.97, height: Node.frame.width * 0.97))
//                    Node.physicsBody?.friction = 0
//                    Node.physicsBody?.restitution = 0.1
//                    Node.physicsBody?.allowsRotation = false
//                    Node.zPosition = 3.0
//                    
//                    scene.addChild(Node)
//                    
//                    moveNo++
//                }
//            }
//            
//            
//        }
//}
