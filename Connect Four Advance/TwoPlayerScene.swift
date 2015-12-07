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
    var game = GameStatus()
    
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
        
        self.backgroundColor = UIColor.whiteColor()
        self.scaleMode = .AspectFit
        drawGrid()
    }
    
    

    func isValidMove(loc: CGPoint) -> Bool {
        
        var result = true
        let gridHeight = (self.frame.height / 100) * 70 //The padding on each side is 10%, so the available space should be 80%
        let gridWidth = gridHeight // needs to be equal so we have a grid.
        let paddingSidesWidth = (self.frame.width - gridWidth) / 2
        
        if movesCount >= 42 { result = false }
        if loc.x <= paddingSidesWidth { result = false }
        if loc.x >= (self.frame.width - paddingSidesWidth) { result = false }
        
        return result
    }
    
    
    func columnName(pixel: CGPoint) -> String
    {
        print(pixel)
        
        switch pixel.x
        {
        case let x where x > self.frame.width/100 * 25 && x < self.frame.width/100 * 35 -  2 * (self.frame.width/100):
            return "buttonFactory1"
        default:
            return "failed"

            }
        return "none"
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            
            if isValidMove(touch.locationInNode(self)){
                
                let location = CGPoint(x:touch.locationInNode(self).x, y:(self.frame.height/100 * 80)) //Take x co-ordinate for users input, change Y co-ordinate to the top of the column
                let Node = SKShapeNode(circleOfRadius: (self.frame.height/20.7)) //Make more scalable?
                
                if playerTurn == 0 {
                    Node.fillColor = UIColor.yellowColor()
                    playerTurn = 1
                }
                    
                else if playerTurn == 1{
                    Node.fillColor = UIColor.redColor()
                    playerTurn = 0
                }
            
                Node.position = location
                Node.physicsBody = SKPhysicsBody(circleOfRadius: Node.frame.width/2)
                Node.physicsBody?.friction = 0
                Node.physicsBody?.restitution = 0.1
                Node.physicsBody?.allowsRotation = false
                Node.zPosition = 1.0
                
                self.addChild(Node)
                
                let col:String = columnName(location)
                print(col)
                movesCount++
                
                game.hasWon(col, turn: movesCount)
               
                
                columnName(touch.locationInNode(self)) //Debug testing column inputs/ recording
            }
        }
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func drawGrid()
    {
        //Define some variables
        let gridLineWidth = self.frame.width / 100 //How thick the lines of the grid are.
        let gridHeight = (self.frame.height / 100) * 70 //The padding on each side is 10%, so the available space should be 80%
        let gridWidth = gridHeight // needs to be equal so we have a grid.
        let paddingSidesWidth = (self.frame.width - gridWidth) / 2
        let paddingBottomHeight = (self.frame.height - gridHeight) / 2
        let colWidth = gridWidth / 7

        // Code to create columns
        for index in 1 ... 8 {
            
            let wallNode = SKShapeNode(rectOfSize: CGSize(width: gridLineWidth, height: gridHeight))
            
            wallNode.fillColor = UIColor.blueColor()
            wallNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: gridLineWidth * 0.5, height: gridHeight))
            wallNode.physicsBody?.friction = 0
            wallNode.physicsBody?.allowsRotation = false
            wallNode.physicsBody?.dynamic = false
            wallNode.zPosition = 2.0
            wallNode.position = CGPointMake(CGFloat(paddingSidesWidth) + CGFloat(index - 1) * CGFloat(colWidth), self.frame.height/2)
            
            self.addChild(wallNode)
        }
        
        //Create bottom row, with physical body so cannot pass through
        let rowNode = SKShapeNode(rectOfSize: CGSize(width: gridWidth, height: gridLineWidth))
        
        rowNode.fillColor = UIColor.blueColor()
        rowNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: gridWidth, height: gridLineWidth * 0.5))
        rowNode.physicsBody?.friction = 0
        rowNode.physicsBody?.allowsRotation = false
        rowNode.physicsBody?.dynamic = false
        rowNode.zPosition = 1.0
        rowNode.position = CGPointMake(self.frame.width/2, paddingBottomHeight)
        
        self.addChild(rowNode)
        
        //Create rest of rows
        for rowIndex in 1...6 {
            
            let otherRows = SKShapeNode(rectOfSize: CGSize(width: gridWidth, height: gridLineWidth))
            
            otherRows.fillColor = UIColor.blueColor()
            otherRows.zPosition = 2.0
            otherRows.position = CGPointMake(self.frame.width/2, CGFloat(paddingBottomHeight) + CGFloat(rowIndex) * CGFloat(colWidth))
            
            self.addChild(otherRows)
        }
    }
}






//        //Left padding
//        let padd = SKShapeNode(rectOfSize: CGSize(width: paddingSidesWidth, height: self.frame.height))
//
//        padd.physicsBody = SKPhysicsBody(rectangleOfSize: padd.frame.size)
//        padd.physicsBody?.friction = 0
//        padd.physicsBody?.allowsRotation = false
//        padd.physicsBody?.dynamic = false
//        padd.zPosition = 1.0
//        padd.fillColor = UIColor.whiteColor()
//        padd.position = CGPointMake(padd.frame.width/2, self.frame.height/2)
//
//        self.addChild(padd)
//
//
//        //Right padding
//        let padd2 = SKShapeNode(rectOfSize: CGSize(width: paddingSidesWidth, height: self.frame.height))
//
//        padd2.physicsBody = SKPhysicsBody(rectangleOfSize: padd2.frame.size)
//        padd2.physicsBody?.friction = 0
//        padd2.physicsBody?.allowsRotation = false
//        padd2.physicsBody?.dynamic = false
//        padd2.zPosition = 1.0
//        padd2.fillColor = UIColor.whiteColor()
//        padd2.position = CGPointMake( (self.frame.width - padd2.frame.width/2), self.frame.height/2)
//
//        self.addChild(padd2)
//
//
//        //Bottom padding
//        let padd3 = SKShapeNode(rectOfSize: CGSize(width: self.frame.width, height: paddingBottomHeight))
//
//        padd3.physicsBody = SKPhysicsBody(rectangleOfSize: padd3.frame.size)
//        padd3.physicsBody?.friction = 0
//        padd3.physicsBody?.allowsRotation = false
//        padd3.physicsBody?.dynamic = false
//        padd3.zPosition = 1.0
//        padd3.fillColor = UIColor.whiteColor()
//        padd3.position = CGPointMake(self.frame.width/2, padd3.frame.height/2)
//
//        self.addChild(padd3)
//
//
//        //Top padding
//        let padd4 = SKShapeNode(rectOfSize: CGSize(width: self.frame.width, height: paddingBottomHeight))
//
//        padd4.physicsBody = SKPhysicsBody(rectangleOfSize: padd4.frame.size)
//        padd4.physicsBody?.friction = 0
//        padd4.physicsBody?.allowsRotation = false
//        padd4.physicsBody?.dynamic = false
//        padd4.zPosition = 1.0
//        padd4.fillColor = UIColor.whiteColor()
//        padd4.position = CGPointMake(self.frame.width/2, (self.frame.height - padd4.frame.height/2))
//
//        self.addChild(padd4)




