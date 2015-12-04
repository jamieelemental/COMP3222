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
    var movesCount = 0
    
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
        drawGrid()
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            if movesCount < 35 {
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
            movesCount++
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func drawGrid()
    {
        
        // Code to create columns.
        let walls = 8
        let padding:Float = 52
        
        // Generate the walls
        let offset:Float = (Float(self.frame.size.width) - (Float(10) * Float(walls) + padding * (Float(walls) - 1 ) ) ) / 2
        
        
        for index in 1 ... walls {
            
            
            let wallNode = SKShapeNode(rectOfSize: CGSize(width: (self.frame.width / 100), height: self.frame.size.height/2))
            wallNode.fillColor = UIColor.blueColor()
    
            
            let wall = SKSpriteNode()
            
            wall.physicsBody = SKPhysicsBody(rectangleOfSize: wallNode.frame.size)
            wall.physicsBody?.friction = 0
            wall.physicsBody?.allowsRotation = false
            wall.physicsBody?.dynamic = false
            wall.zPosition = 1.0
            
            //let calc1:Float = Float(index) - 0.5
            //let calc2:Float = Float(index) - 1
            //wall.position = CGPointMake(CGFloat(calc1 * Float(wall.frame.size.width) + calc2 * padding + offset), 30)
            wall.position = CGPointMake( (CGFloat(offset) + CGFloat(index) * CGFloat(padding)), self.frame.height/2)
            
            
            wall.addChild(wallNode)
            self.addChild(wall)
            
        }
        
        
        let width = (CGFloat(offset) + CGFloat(1) * CGFloat(padding)) - (CGFloat(offset) + CGFloat(8) * CGFloat(padding))
        
        let baseNode = SKShapeNode(rectOfSize: CGSize(width: width, height: self.frame.width/100))
        baseNode.fillColor = UIColor.blueColor()
        
        let base = SKSpriteNode()
        
        base.physicsBody = SKPhysicsBody(rectangleOfSize: baseNode.frame.size)
        base.physicsBody?.friction = 0
        base.physicsBody?.allowsRotation = false
        base.physicsBody?.dynamic = false
        base.zPosition = 1.0
        base.position = CGPointMake(self.frame.width/2 + CGFloat(self.frame.width/60),  self.frame.height/4)
        base.addChild(baseNode)
        
        self.addChild(base)
    }
}


