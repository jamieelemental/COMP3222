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
    var game = GameStatus()
    var move = IsValidMove()
    var playerTurn = 1
    var moveNo = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Two Player loaded")
        
        scene = TwoPlayerScene(size: view.bounds.size)

        scene.scaleMode = .AspectFit
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        
        skView.presentScene(scene)
        centerGrid()
        applyGridOverlay()
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
        
        print(UIDevice.currentDevice().orientation.rawValue)
        
        let newSize =  CGSize(width:view.bounds.width, height:view.bounds.height)
        let oldSize = CGSize(width:view.bounds.height, height:view.bounds.width)
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone && UIDevice.currentDevice().orientation == .PortraitUpsideDown
        {
            return
        }

        
        recenterGrid(newSize, old: oldSize)
        scene.size = newSize
    }
    
    func centerGrid()
    {
        var shortSide = view.frame.width
        if view.frame.width > view.frame.height { shortSide = view.frame.height }

        
        for node in scene.children
        {
            node.position.x =  node.position.x + (view.frame.width - (shortSide/100 * 70)) / 2
            node.position.y = node.position.y + (view.frame.height - (shortSide/100 * 70)) / 2
        }
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
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            return .AllButUpsideDown
        }
        else
        {
            return .All
        }
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        var shortSide = view.frame.width
        if view.frame.width > view.frame.height { shortSide = view.frame.height }
        
                for touch in touches {
        
                    let location = CGPoint(x: touch.locationInView(self.view).x, y:(self.view.frame.height/100 * 68 - shortSide/100)) //Take x co-ordinate of users input, changes Y co-ordinate to top of column
        
                    let col = columnName(location) //get column identifier
                    print(col)
        
                    if move.checkValid(col){
        
                        let Node = SKShapeNode(circleOfRadius: (shortSide/10.8)/2) //Circle have a radius of half the column space, minus some of the column walls.
        
                        game.hasWon(col, turn: playerTurn) //Prompt some Win notice?
        
                        if playerTurn == 1 {
                            Node.fillColor = UIColor.yellowColor()
                            playerTurn = 2
                        }
        
                        else if playerTurn == 2{
                            Node.fillColor = UIColor.redColor()
                            playerTurn = 1
                        }
        
                        Node.position = location
                        Node.physicsBody = SKPhysicsBody(circleOfRadius: Node.frame.width/2)
                        Node.physicsBody?.friction = 0
                        Node.physicsBody?.restitution = 0.1
                        Node.physicsBody?.allowsRotation = false
                        Node.zPosition = 3.0
        
                        scene.addChild(Node)
        
                        moveNo++
                    }
                }
    }
    
    
    
    ///REWRITE COLUMN NAME
    func columnName(pixel: CGPoint) -> String
        {
            var shortSide = view.frame.width
            if view.frame.width > view.frame.height { shortSide = view.frame.height }

            var paddingSidesWidth = (view.frame.width - shortSide/100 * 70) / 2
            var colWidth = (shortSide/100 * 7)
            
            //Gets a column name identifier for each column, based on co-ordinate position.
            switch pixel.x
            {
            case let x where x >= (paddingSidesWidth) && x <= (paddingSidesWidth + colWidth):
                let col1 = SKShapeNode(rectOfSize: CGSize(width: colWidth, height: view.frame.height))
                col1.fillColor = UIColor.redColor()
                col1.position = CGPoint(x:paddingSidesWidth + col1.frame.width/2 + shortSide/100, y: view.frame.height/2)
                scene.addChild(col1)
                
                return "buttonFactory1"
            case let x where x >= (paddingSidesWidth + colWidth) && x <= (paddingSidesWidth + 2 * colWidth):
                
                let col2 = SKShapeNode(rectOfSize: CGSize(width: colWidth, height: view.frame.height))
                col2.fillColor = UIColor.redColor()
                col2.position = CGPoint(x:paddingSidesWidth + col2.frame.width/2 + shortSide/100 + colWidth , y: view.frame.height/2)
                scene.addChild(col2)
                return "buttonFactory2"
            case let x where x >= (paddingSidesWidth + 2 * colWidth) && x <= (paddingSidesWidth + 3 * colWidth):
                return "buttonFactory3"
            case let x where x >= (paddingSidesWidth + 3 * colWidth) && x <= (paddingSidesWidth + 4 * colWidth):
                return "buttonFactory4"
            case let x where x >= (paddingSidesWidth + 4 * colWidth) && x <= (paddingSidesWidth + 5 * colWidth):
                return "buttonFactory5"
            case let x where x >= (paddingSidesWidth + 5 * colWidth) && x <= (paddingSidesWidth + 6 * colWidth):
                return "buttonFactory6"
            case let x where x >= (paddingSidesWidth + 6 * colWidth) && x <= (paddingSidesWidth + 7 * colWidth):
                return "buttonFactory7"
            default:
                return "failed"
            }
        }

    func applyGridOverlay()
    {
        
        var shortSide = view.frame.width
        if view.frame.width > view.frame.height { shortSide = view.frame.height }
        
        var gameBoard = SKSpriteNode(imageNamed:"Connect4Board2")
        gameBoard.size = CGSizeMake(shortSide/100 * 70, shortSide/100 * 70 - shortSide/20)
        
        gameBoard.position = CGPoint(x: CGRectGetMidX(view.frame) + shortSide/200, y: CGRectGetMidY(view.frame) - shortSide/40)
        gameBoard.zPosition = 100
        scene.addChild(gameBoard)

    }
    
    
    
}






