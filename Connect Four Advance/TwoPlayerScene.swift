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
        //Define some variables
       
        
        
        let lineWidth = self.frame.width / 100
        let colHeight = (self.frame.height / 100) * 80 //The padding on each side is 15%, so the available space should be 70%
        let rowWidth = colHeight // needs to be equal so we have a grid.
        
         //let paddingWidth = (self.frame.width / 100) * 15 //Change this to dynamic calculation.
        
        let paddingWidth = (self.frame.width - rowWidth) / 2
        
        
        
        
        
        //Left padding
        let padd = SKShapeNode(rectOfSize: CGSize(width: paddingWidth, height: self.frame.height))
        
        padd.physicsBody = SKPhysicsBody(rectangleOfSize: padd.frame.size)
        padd.physicsBody?.friction = 0
        padd.physicsBody?.allowsRotation = false
        padd.physicsBody?.dynamic = false
        padd.zPosition = 1.0
        padd.fillColor = UIColor.blackColor()
        padd.position = CGPointMake(padd.frame.width/2, self.frame.height/2)
        self.addChild(padd)
        
        
        //right padding
        let padd2 = SKShapeNode(rectOfSize: CGSize(width: paddingWidth, height: self.frame.height))
        
        padd2.physicsBody = SKPhysicsBody(rectangleOfSize: padd2.frame.size)
        padd2.physicsBody?.friction = 0
        padd2.physicsBody?.allowsRotation = false
        padd2.physicsBody?.dynamic = false
        padd2.zPosition = 1.0
        padd2.fillColor = UIColor.blackColor()
        
        padd2.position = CGPointMake( (self.frame.width - padd2.frame.width/2), self.frame.height/2)
        
        self.addChild(padd2)
        
        
        //Bottom padding
        let padd3 = SKShapeNode(rectOfSize: CGSize(width: ((self.frame.width/100) * 100), height: (self.frame.height/100) * 15))
        
        padd3.physicsBody = SKPhysicsBody(rectangleOfSize: padd3.frame.size)
        padd3.physicsBody?.friction = 0
        padd3.physicsBody?.allowsRotation = false
        padd3.physicsBody?.dynamic = false
        padd3.zPosition = 1.0
        padd3.fillColor = UIColor.blackColor()
        
        padd3.position = CGPointMake(self.frame.width/2, padd3.frame.height/2)
        
        self.addChild(padd3)
        
        
        
        
        
//        // Code to create columns.
//        let walls = 8
//        let padding:Float = (Float(self.frame.width/10)) //width of the walls
//        
//        // Generate the walls
//        let offset:Float = Float(self.frame.width / 100 * 15) //Offset is the 15% padding
//        
//        for index in 1 ... walls {
//            
//            
//            let wallNode = SKShapeNode(rectOfSize: CGSize(width: (self.frame.width/ 100)), height: (self.frame.size.height/100) * 70))
//            wallNode.fillColor = UIColor.blueColor()
//            
//            wallNode.physicsBody = SKPhysicsBody(rectangleOfSize: wallNode.frame.size)
//            wallNode.physicsBody?.friction = 0
//            wallNode.physicsBody?.allowsRotation = false
//            wallNode.physicsBody?.dynamic = false
//            wallNode.zPosition = 1.0
//            wallNode.position = CGPointMake(CGFloat(offset) + CGFloat(index - 1) * CGFloat(padding), self.frame.height/2)
//            self.addChild(wallNode)
//            
//        }
//
//        
//        //create bottom row, with physical body so cannot pass through
//        let baseNode = SKShapeNode(rectOfSize: CGSize(width: self.frame.width / 100 * 70, height: self.frame.width/100))
//        baseNode.fillColor = UIColor.blueColor()
//        
//        baseNode.physicsBody = SKPhysicsBody(rectangleOfSize: baseNode.frame.size)
//        baseNode.physicsBody?.friction = 0
//        baseNode.physicsBody?.allowsRotation = false
//        baseNode.physicsBody?.dynamic = false
//        baseNode.zPosition = 1.0
//        baseNode.position = CGPointMake(self.frame.width/2, (self.frame.height/100 * 15))
//        
//        self.addChild(baseNode)
//        
//        
//        //create rest of rows
        
    }
}


