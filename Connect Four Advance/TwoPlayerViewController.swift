//
//  TwoPlayerViewController.swift
//  Connect Four Advance
//
//  Created by J C C Element on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import UIKit
import SpriteKit

class TwoPlayerViewController: UIViewController {
    
    var scene = SKScene()
    var player1 = "Player 1"
    var player2 = "Player 2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Two Player loaded")
        
        let TwoPlay = TwoPlayerScene(size: view.bounds.size)
        TwoPlay.p1 = player1
        TwoPlay.p2 = player2
        
        scene = TwoPlay //TwoPlayerScene(size: view.bounds.size)
        scene.scaleMode = .AspectFit
        
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
        
        print(player1, player2)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        
        let newSize =  CGSize(width:view.bounds.width, height:view.bounds.height)
        let oldSize = CGSize(width:view.bounds.height, height:view.bounds.width)
        
        scene.size = newSize
        recenterGrid(newSize, old: oldSize)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All
    }
    
    func recenterGrid(new: CGSize, old: CGSize)
    {
        var shortSide = old.width
        if old.width > old.height { shortSide = old.height }
        
        for node in scene.children
        {
            //remove old padding
            node.position.x =  node.position.x - (old.width - (shortSide/100 * 70)) / 2
            node.position.y = node.position.y - (old.height - (shortSide/100 * 70)) / 2
            
            //apply new
            node.position.x =  node.position.x + (new.width - (shortSide/100 * 70)) / 2
            node.position.y = node.position.y + (new.height - (shortSide/100 * 70)) / 2
        }
    }
}




//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//
//        var shortSide = view.frame.width
//        if view.frame.width > view.frame.height { shortSide = view.frame.height }
//
//        for touch in touches {
//
//            let location = CGPoint(x: touch.locationInView(self.view).x, y:(self.view.frame.height/100 * 60)) //Take x co-ordinate of users input, changes Y co-ordinate to top of column
//
//            let col = gamePlay.columnName(location, screen: view.frame.size) //get column identifier
//            print(col)
//
//            if move.checkValid(col){
//
//                let Node = SKShapeNode(circleOfRadius: (shortSide/100 * 67 / 7)/2) //Circle have a radius of half the column space.
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
//                Node.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: Node.frame.width * 0.97, height: Node.frame.width * 0.97))
//                Node.physicsBody?.friction = 0
//                Node.physicsBody?.restitution = 0.1
//                Node.physicsBody?.allowsRotation = false
//                Node.zPosition = 3.0
//
//                scene.addChild(Node)
//
//                moveNo++
//            }
//        }
//    }


//    func centerGrid()
//    {
//        var shortSide = view.frame.width
//        if view.frame.width > view.frame.height { shortSide = view.frame.height }
//
//        for node in scene.children
//        {
//            node.position.x =  node.position.x + (view.frame.width - (shortSide/100 * 70)) / 2
//            node.position.y = node.position.y + (view.frame.height - (shortSide/100 * 70)) / 2
//        }
//    }
//
//
//

//    func columnName(pixel: CGPoint) -> String
//    {
//        var shortSide = view.frame.width
//        if view.frame.width > view.frame.height { shortSide = view.frame.height }
//
//        let paddingSidesWidth = (view.frame.width - shortSide/100 * 70) / 2
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
//    }







