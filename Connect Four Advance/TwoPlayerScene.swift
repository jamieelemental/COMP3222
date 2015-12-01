//
//  TwoPlayerScene.swift
//  Connect Four Advance
//
//  Created by J C C Element on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation
import SpriteKit

class TwoPlayerScene: SKScene {
    
    var playerTurn = 0
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.physicsWorld.gravity = CGVectorMake(0, -8)
        let screenBorder = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = screenBorder
        self.physicsBody?.friction = 1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        
        print("Two player loaded")
        scaleMode = .ResizeFill
        self.backgroundColor = UIColor.whiteColor()
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            
            let location = touch.locationInNode(self)
            let sprite = SKSpriteNode()
            let Node = SKShapeNode(circleOfRadius: 19)
            
            if playerTurn == 0 {
                Node.fillColor = UIColor.yellowColor()
                playerTurn = 1
            }
            
            else if playerTurn == 1{
                Node.fillColor = UIColor.redColor()
                playerTurn = 0
            }
            
            sprite.addChild(Node)
            sprite.position = location
            sprite.physicsBody = SKPhysicsBody(circleOfRadius: Node.frame.size.width/2)
            sprite.physicsBody?.friction = 0
            sprite.physicsBody?.restitution = 0.1
            sprite.physicsBody?.allowsRotation = false
            sprite.zPosition = 1.0

            self.addChild(sprite)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func drawGrid()
    {
        
        
        
        
        
    }
    
}


