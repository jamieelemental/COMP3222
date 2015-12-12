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
    
    var shortSide = CGFloat(0)
    var gridLineWidth = CGFloat(0)
    var gridHeight = CGFloat(0)
    var gridWidth = CGFloat(0)
    var colWidth = CGFloat(0)
    var game = GameStatus()
    var move = IsValidMove()
    var playerTurn = 1
    var moveNo = 1
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.physicsWorld.gravity = CGVectorMake(0, -8)
        
        //Define the shorter and longer sides (change with orientation), for scaling.
        if self.frame.height < self.frame.width {
            shortSide = self.frame.height
        }
        
        if self.frame.width < self.frame.height {
            shortSide = self.frame.width
        }
        
        //Iniitalize variables for grid. Some scaled, some not.
        self.gridLineWidth = shortSide/200
        self.gridHeight = (shortSide / 100) * 70
        self.gridWidth = gridHeight
        self.colWidth = gridWidth / 7
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        drawGrid()
        centerGrid()
        applyGridOverlay()
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func columnName(pixel: CGPoint) -> String
    {
        var shortSide = self.frame.width
        if self.frame.width > self.frame.height { shortSide = self.frame.height }
        
        let paddingSidesWidth = (self.frame.width - shortSide/100 * 70) / 2
        let colWidth = (shortSide/100 * 70 / 7)
        
        //Gets a column name identifier for each column, based on co-ordinate position.
        switch pixel.x
        {
            
        case let x where x >= paddingSidesWidth && x <= paddingSidesWidth + colWidth:
            return "buttonFactory1"
            
        case let x where x >= paddingSidesWidth + colWidth && x <= paddingSidesWidth + 2 * colWidth:
            return "buttonFactory2"
            
        case let x where x >= paddingSidesWidth + 2 * colWidth && x <= paddingSidesWidth + 3 * colWidth:
            return "buttonFactory3"
            
        case let x where x >= paddingSidesWidth + 3 * colWidth && x <= paddingSidesWidth + 4 * colWidth:
            return "buttonFactory4"
            
        case let x where x >= paddingSidesWidth + 4 * colWidth && x <= paddingSidesWidth + 5 * colWidth:
            return "buttonFactory5"
            
        case let x where x >= paddingSidesWidth + 5 * colWidth && x <= paddingSidesWidth + 6 * colWidth:
            return "buttonFactory6"
            
        case let x where x >= paddingSidesWidth + 6 * colWidth  && x <= paddingSidesWidth + 7 * colWidth:
            return "buttonFactory7"
        default:
            return "failed"
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        var shortSide = self.frame.width
        if self.frame.width > self.frame.height { shortSide = self.frame.height }
        
        for touch in touches {
            
            let location = CGPoint(x: touch.locationInView(self.view).x, y:(self.frame.height/100 * 65)) //Take x co-ordinate of users input, changes Y co-ordinate to top of column
            
            let col = self.columnName(location) //get column identifier
            print(col)
            
            if move.checkValid(col){
                
                let Node = SKShapeNode(circleOfRadius: (shortSide/100 * 67 / 7)/2) //Circle have a radius of half the column space.
                
                if game.hasWon(col, turn: playerTurn)
                {
                    game.gameWon("Player \(playerTurn)", turns: moveNo, times: "0 seconds!")
                }
                
                if playerTurn == 1 {
                    Node.fillColor = UIColor.yellowColor()
                    playerTurn = 2
                }
                    
                else if playerTurn == 2{
                    Node.fillColor = UIColor.redColor()
                    playerTurn = 1
                }
                
                Node.position = location
                Node.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: Node.frame.width * 0.97, height: Node.frame.width * 0.97))
                Node.physicsBody?.friction = 0
                Node.physicsBody?.restitution = 0.1
                Node.physicsBody?.allowsRotation = false
                Node.zPosition = 3.0
                
                self.addChild(Node)
                if moveNo == 42 { game.gameOver() }
                moveNo++
            }
        }
    }
    
    
    func drawGrid()
    {
        // Code to create columns
        for index in 1 ... 8 {
            
            let wallNode = SKShapeNode(rectOfSize: CGSize(width: gridLineWidth, height: gridHeight))
            
            wallNode.fillColor = UIColor.whiteColor()
            wallNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: gridLineWidth * 0.5, height: gridHeight))
            wallNode.physicsBody?.friction = 0
            wallNode.physicsBody?.allowsRotation = false
            wallNode.physicsBody?.dynamic = false
            wallNode.zPosition = 2.0
            wallNode.position = CGPointMake(CGFloat(index - 1) * CGFloat(colWidth) + gridLineWidth/2, wallNode.frame.height/2)
            
            self.addChild(wallNode)
        }
        
        //Create bottom row, with physical body so cannot pass through
        let rowNode = SKShapeNode(rectOfSize: CGSize(width: gridWidth, height: gridLineWidth))
        
        rowNode.fillColor = UIColor.whiteColor()
        rowNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: gridWidth, height: gridLineWidth * 0.5))
        rowNode.physicsBody?.friction = 0
        rowNode.physicsBody?.allowsRotation = false
        rowNode.physicsBody?.dynamic = false
        rowNode.zPosition = 1.0
        rowNode.position = CGPointMake(rowNode.frame.width/2, gridLineWidth/2)
        
        self.addChild(rowNode)
        
        //Create rest of rows
        for rowIndex in 1...6 {
            
            let otherRows = SKShapeNode(rectOfSize: CGSize(width: gridWidth, height: gridLineWidth))
            
            otherRows.fillColor = UIColor.whiteColor()
            otherRows.zPosition = 2.0
            otherRows.position = CGPointMake(rowNode.frame.width/2 + gridLineWidth/2, CGFloat(rowIndex) * CGFloat(colWidth))
            
            self.addChild(otherRows)
        }
    }
    
    func applyGridOverlay()
    {
        let gameBoard = SKSpriteNode(imageNamed:"grid2")
        
        gameBoard.size = CGSizeMake(shortSide/100 * 70, shortSide/100 * 70)
        gameBoard.position = CGPoint(x: CGRectGetMidX(self.frame) + shortSide/200, y: CGRectGetMidY(self.frame))
        gameBoard.zPosition = 100
        
        self.addChild(gameBoard)
    }
    
    
    func centerGrid()
    {
        for node in self.children
        {
            node.position.x =  node.position.x + (self.frame.width - (shortSide/100 * 70)) / 2
            node.position.y = node.position.y + (self.frame.height - (shortSide/100 * 70)) / 2
        }
    }
    
    
    func recenterGrid(new: CGSize, old: CGSize)
    {
        var shortSide = old.width
        if old.width > old.height { shortSide = old.height }
        
        for node in self.children
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
