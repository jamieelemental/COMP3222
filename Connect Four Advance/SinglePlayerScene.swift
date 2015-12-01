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
    var moveCount = 0
    
    // Create Music player
    var bgMusicPlayer = AVAudioPlayer()
    
    
    override func didMoveToView(view: SKView) {
        
        //let bgMusicURL = NSBundle.mainBundle().URLForResource("BGMusic", withExtension: "mp3")
        //bgMusicPlayer = AVAudioPlayer(contentsOfURL: bgMusicURL, error: nil)
        
        
        //let backgroundImage = SKSpriteNode(imageNamed: "bg")
        //backgroundImage.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        //self.addChild(backgroundImage)
        self.backgroundColor = UIColor.darkGrayColor()
        
        // Control Gravity
        self.physicsWorld.gravity = CGVectorMake(0, -10)
        
        // set border of world
        let screenBorder = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = screenBorder
        self.physicsBody?.friction = 1
        
        // Code to create columns.
        let walls = 8
        let wallWidth = SKSpriteNode(imageNamed: "wall").size.width
        let padding:Float = 40
        // Code to generate ball factorys
        let ballFacts = 7
        
        
        // Generate the walls
        let offset:Float = (Float(self.frame.size.width) - (Float(wallWidth) * Float(walls) + padding * (Float(walls) - 1 ) ) ) / 2
        
        for index in 1 ... walls {
            let wall = SKSpriteNode(imageNamed: "wall")
            
            let calc1:Float = Float(index) - 0.5
            let calc2:Float = Float(index) - 1
            
            wall.position = CGPointMake(CGFloat(calc1 * Float(wall.frame.size.width) + calc2 * padding + offset), 1)
            
            wall.physicsBody = SKPhysicsBody(rectangleOfSize: wall.frame.size)
            wall.physicsBody?.allowsRotation = false
            wall.name = wallCategoryName
            wall.physicsBody?.dynamic = false
            wall.zPosition = 1.0

            self.addChild(wall)
    }
        
        // Generate Ball Factorys
        for index in 1 ... ballFacts {
            let wall = SKSpriteNode(imageNamed: "wall")
            
            let calc1:Float = Float(index) - 0.5
            let calc2:Float = Float(index) - 1
            
            //Ball Factory code
            let ballMaker = SKSpriteNode(imageNamed:"ball")
            ballMaker.name = buttonFactoryCategoryName + String(wallNumber)
            ballMaker.physicsBody?.allowsRotation = false
            ballMaker.physicsBody?.dynamic = false
            ballMaker.size.width = CGFloat(39)
            ballMaker.size.height = CGFloat(39)
            ballMaker.position = CGPointMake(CGFloat(calc1 * Float(wall.frame.size.width) + calc2 * padding + offset + 30), 270)
            ballMaker.zPosition = 1.0
            
            self.addChild(ballMaker)
            wallNumber = wallNumber + 1
            
        }
    }
    
    
//    override func didMoveToView(view: SKView) {
//        
//    }
    
    
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
                game.hasWon(name, turn: turn)
                let piece = SKSpriteNode()
                let Node = SKShapeNode(circleOfRadius: 18)
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
                piece.zPosition = 1.0
                
                piece.physicsBody = SKPhysicsBody(circleOfRadius: Node.frame.size.width/2)
                piece.physicsBody?.friction = 0
                piece.physicsBody?.restitution = 0.1
                piece.physicsBody?.allowsRotation = false
                self.addChild(piece)
                moveCount++
                print(moveCount)
            } else if moveCount == 42 {
                let alert = UIAlertView()
                alert.title = "GameOver"
                alert.message = " Click to restart"
                alert.addButtonWithTitle("Ok")
                alert.show()
                
                let gameScene = SinglePlayerScene(size: self.size)
                let transition = SKTransition.doorsCloseHorizontalWithDuration(2.5)
                gameScene.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene, transition: transition)
            }
            
        }
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
