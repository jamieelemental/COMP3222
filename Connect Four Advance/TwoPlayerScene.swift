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
    var moveNo = 1
    
    var game = GameStatus()
    var move = IsValidMove()
    
    var shortSide = CGFloat(0)
    var longSide = CGFloat(0)
    var gridLineWidth = CGFloat(0)
    var gridHeight = CGFloat(0)
    var gridWidth = CGFloat(0)
    var paddingSidesWidth = CGFloat(0)
    var paddingBottomHeight = CGFloat(0)
    var colWidth = CGFloat(0)
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.physicsWorld.gravity = CGVectorMake(0, -8)
        
        //Define the shorter and longer sides (change with orientation), for scaling.
        if self.frame.height < self.frame.width {
            shortSide = self.frame.height
            longSide = self.frame.width}
        
        if self.frame.width < self.frame.height {
            shortSide = self.frame.width
            longSide = self.frame.height
        }
        
        //Iniitalize variables for grid. Some scaled, some not.
        
        //self.gridLineWidth = self.frame.width / 100 //How thick the lines of the grid are.
        self.gridLineWidth = longSide/100
        self.gridHeight = (shortSide / 100) * 70 //The padding on each side is 10%, so the available space should be 80%
        self.gridWidth = gridHeight // needs to be equal so we have a grid.
        self.paddingSidesWidth = (self.frame.width - gridWidth) / 2
        self.paddingBottomHeight = (self.frame.height - gridHeight) / 2
        self.colWidth = gridWidth / 7
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        self.scaleMode = .AspectFit
        drawGrid()
    }
    
    
    func columnName(pixel: CGPoint) -> String
    {
        //Gets a column name identifier for each column, based on co-ordinate position.
        switch pixel.x
        {
        case let x where x >= (paddingSidesWidth) && x <= (paddingSidesWidth + colWidth):
            return "buttonFactory1"
        case let x where x >= (paddingSidesWidth + colWidth) && x <= (paddingSidesWidth + 2 * colWidth):
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
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            
            let location = CGPoint(x:touch.locationInNode(self).x, y:(paddingBottomHeight + gridHeight - colWidth)) //Take x co-ordinate of users input, changes Y co-ordinate to top of column
            
            let col = columnName(location) //get column identifier
            
            if move.checkValid(col){
                
                
                let Node = SKShapeNode(circleOfRadius: (colWidth - 0.4 * gridLineWidth)/2) //Circle have a radius of half the column space, minus some of the column walls.
                
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
              
                game.hasWon(col, turn: moveNo) //Prompt some Win notice? 
                
                //ELSE
                moveNo++
            }
        }
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func drawGrid()
    {
        
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
