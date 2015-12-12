//
//  SinglePlayerScene.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 30/11/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import SpriteKit
import AVFoundation

class SinglePlayerScene: SKScene {
    
    // Create catogorys for elements of the scene.
    let redCategoryName = "red"
    let blueCategoryName = "blue"
    let buttonFactoryCategoryName = "buttonFactory"
    let wallCategoryName = "wall"
    var turn = 1
    var wallNumber = 1
    let valid = IsValidMove()
    let game = GameStatus()
    let leaderBoard = LeaderBoard()
    var moveCount = 0
    var gameBoard = SKSpriteNode()
    let a = CFAbsoluteTimeGetCurrent()
    
    
    // Create Music player
    var bgMusicPlayer = AVAudioPlayer()
    
    override func didMoveToView(view: SKView) {
        
        
        //let bgMusicURL = NSBundle.mainBundle().URLForResource("BGMusic", withExtension: "mp3")
        //bgMusicPlayer = AVAudioPlayer(contentsOfURL: bgMusicURL, error: nil)

        self.backgroundColor = UIColor.darkGrayColor()
        
        // Control Gravity
        self.physicsWorld.gravity = CGVectorMake(0, -10)
        
        // set border of world
        let screenBorder = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = screenBorder
        self.physicsBody?.friction = 1
        
        // Code to generate a playable area - to ensure compatability on multiple devices.
        gameBoard = SKSpriteNode(imageNamed:"Connect4Board2")
        gameBoard.size = CGSizeMake(self.frame.size.width/1.4, self.frame.size.width/2.4)
        
        gameBoard.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        gameBoard.zPosition = 100
        self.addChild(gameBoard)
        
        // Code to create columns & ball factorys.
        let walls = 8
        let ballFacts = 7
        var a = gameBoard.size.width/gameBoard.size.width
        var b = gameBoard.size.width/gameBoard.size.width
        
        // Generate the walls inside the playable area
        for _ in 1 ... walls {
            let wall = SKSpriteNode(imageNamed: "wall")
            wall.size.height = gameBoard.size.height
            wall.position = CGPointMake(0 - gameBoard.size.width/2 + a,0)
            wall.size.width = gameBoard.size.width/18
            wall.physicsBody = SKPhysicsBody(rectangleOfSize: wall.frame.size)
            wall.physicsBody?.allowsRotation = false
            wall.name = wallCategoryName
            wall.physicsBody?.dynamic = false
            wall.zPosition = 0
            
            a = a + gameBoard.size.width/7
            gameBoard.addChild(wall)
        }
        
        // Add Bottom
        let bottom = SKSpriteNode(imageNamed: "wall")
        bottom.size.height = 1
        bottom.size.width = gameBoard.size.width
        bottom.physicsBody = SKPhysicsBody(rectangleOfSize: bottom.frame.size)
        bottom.physicsBody?.allowsRotation = false
        bottom.name = wallCategoryName
        bottom.physicsBody?.dynamic = false
        bottom.zPosition = 1.0
        bottom.position = CGPointMake(0,0 - gameBoard.size.height/2)
        
        gameBoard.addChild(bottom)

        
        // Generate Ball Factorys
        for _ in 1 ... ballFacts {
            
            //Ball Factory code
            let ballMaker = SKSpriteNode(imageNamed:"ball")
            ballMaker.name = buttonFactoryCategoryName + String(wallNumber)
            ballMaker.physicsBody?.allowsRotation = false
            ballMaker.physicsBody?.dynamic = false
            ballMaker.size.width = gameBoard.size.width/13
            ballMaker.size.height = gameBoard.size.width/13
            ballMaker.position = CGPointMake(0 - gameBoard.size.width/2 + gameBoard.size.width/14 + b,gameBoard.size.height/2 - 5)
            ballMaker.zPosition = 1.0
            b = b + gameBoard.size.width/7
            
            gameBoard.addChild(ballMaker)
            wallNumber = wallNumber + 1
            
        }
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
        let positionInScene = touch.locationInNode(self)
        let touchedNode = self.nodeAtPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            // Deal with button touches
            if valid.checkValid(name) == true
            {
                // Check if User has won
                let piece = SKSpriteNode()
                let Node = SKShapeNode(circleOfRadius: gameBoard.size.width/25)
                if turn == 1 {
                        Node.fillColor = UIColor.blueColor()
                        turn = 2
                } else if turn == 2{
                        Node.fillColor = UIColor.redColor()
                        turn = 1
                }
                piece.addChild(Node)
                piece.name = redCategoryName
                piece.position = positionInScene
                piece.position.y = piece.position.y-4
                piece.zPosition = 1.0
                piece.physicsBody = SKPhysicsBody(circleOfRadius: Node.frame.size.width/2)
                piece.physicsBody?.friction = 0
                piece.physicsBody?.restitution = 0.1
                piece.physicsBody?.allowsRotation = false
                self.addChild(piece)
                moveCount++
                
                if game.hasWon(name, turn: turn) == true {
                    
                    game.gameWon("name", turns:moveCount, times: "22.22")
                    ((scene!.view!.window?.rootViewController!)! as UIViewController).dismissViewControllerAnimated(true, completion: nil)
                    
                }
                
            } else if moveCount == 42 {
                game.gameOver()
                ((scene!.view!.window?.rootViewController!)! as UIViewController).dismissViewControllerAnimated(true, completion: nil)
            }
            
        }
            
        }
    }
    
    // Method for tracking the Game Length.
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        let b = CFAbsoluteTimeGetCurrent()
        print("Current Time: ", b, " - StartTime: ", a)
        var c = secondsToHoursMinutesSeconds(Int(b)-Int(a))
        print("GameLength: ", c.0,c.1,c.2)
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}
