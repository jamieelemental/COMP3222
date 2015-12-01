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
    var turn = 0
    // Create Music player
    var bgMusicPlayer = AVAudioPlayer()
    
    
    override init(size: CGSize) {
        super.init(size: size)
        
        //let bgMusicURL = NSBundle.mainBundle().URLForResource("BGMusic", withExtension: "mp3")
        //bgMusicPlayer = AVAudioPlayer(contentsOfURL: bgMusicURL, error: nil)
        
        
        let backgroundImage = SKSpriteNode(imageNamed: "bg")
        backgroundImage.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        self.addChild(backgroundImage)
        
        // Control Gravity
        self.physicsWorld.gravity = CGVectorMake(0, -1)
        
        // set border of world
        let screenBorder = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = screenBorder
        self.physicsBody?.friction = 1
        
        // Code to create columns.
        let walls = 7
        let wallWidth = SKSpriteNode(imageNamed: "wall").size.width
        let padding:Float = 40
        
        
        // Generate the walls
        let offset:Float = (Float(self.frame.size.width) - (Float(wallWidth) * Float(walls) + padding * (Float(walls) - 1 ) ) ) / 2
        
        for index in 1 ... walls {
            let wall = SKSpriteNode(imageNamed: "wall")
            
            let calc1:Float = Float(index) - 0.5
            let calc2:Float = Float(index) - 1
            
            wall.position = CGPointMake(CGFloat(calc1 * Float(wall.frame.size.width) + calc2 * padding + offset), 1)
            
            wall.physicsBody = SKPhysicsBody(rectangleOfSize: wall.frame.size)
            wall.physicsBody?.allowsRotation
            wall.name = wallCategoryName
            wall.physicsBody?.dynamic = false
            wall.zPosition = 1.0
            
            self.addChild(wall)
        
    }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    override func didMoveToView(view: SKView) {
//        
//    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            var red = SKSpriteNode(imageNamed:"red")
            if turn == 0 {
                red = SKSpriteNode(imageNamed:"blue")
                turn = 1
            } else if turn == 1{
                red = SKSpriteNode(imageNamed:"red")
                turn = 0
           }
            
            red.name = redCategoryName
            red.position = location
            red.size.width = CGFloat(39)
            red.size.height = CGFloat(39)
            red.zPosition = 1.0
            
            red.physicsBody = SKPhysicsBody(circleOfRadius: red.frame.size.width/2)
            red.physicsBody?.friction = 0
            red.physicsBody?.restitution = 0.1
            red.physicsBody?.allowsRotation = false
            self.addChild(red)
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
