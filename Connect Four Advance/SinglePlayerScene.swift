//
//  SinglePlayerScene.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 30/11/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import SpriteKit

class SinglePlayerScene: SKScene {
    
    //Variables
    var shortSide = CGFloat(0)
    var gridLineWidth = CGFloat(0)
    var gridHeight = CGFloat(0)
    var gridWidth = CGFloat(0)
    var colWidth = CGFloat(0)
    var game = GameStatus()
    var move = IsValidMove()
    var AI = Ai()
    
    var playerTurn = 1
    var moveNo = 1
    var p1 = "Player 1"
    var p2 = "Player 2"
    var moveLabel = SKLabelNode()
    var pl1 = SKLabelNode(text:"")
    var pl2 = SKLabelNode(text:"")
    let gameStart = CFAbsoluteTimeGetCurrent()
    
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
        self.gridHeight = (shortSide * 0.7)
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
        addText()
    }
    
    //Method to generate a counter on touch input, also generates counter for the AI. Checks whether the game has been won, and if move is valid.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        var shortSide = self.frame.width
        if self.frame.width > self.frame.height { shortSide = self.frame.height }
        
        for touch in touches {
            
            let location = CGPoint(x: touch.locationInView(self.view).x, y:(self.frame.height * 0.65)) //Changes Y co-ordinate to top of column
            let col = self.columnName(location) //get column identifier
            
            if move.checkValid(col){
                
                let Node = SKShapeNode(circleOfRadius: (shortSide * 0.67 / 14)) //Circle have a radius of half the column space.
                
                if game.hasWon(col, turn: playerTurn)
                {
                    let playerWon = p1
                    
                    game.gameWon("\(playerWon)", turns: moveNo, times: "\(gameStart)")
                    ((scene!.view!.window?.rootViewController!)! as UIViewController).dismissViewControllerAnimated(true, completion: nil) //Return to menu screen
                    return
                }
                
                //Change player name colour to indicate turn.
                if playerTurn == 1 {
                    Node.fillColor = UIColor.yellowColor()
                    pl1.fontColor = UIColor.blackColor()
                    pl2.fontColor = UIColor.blueColor()
                    playerTurn = 2
                }
                
                Node.position = location
                Node.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: Node.frame.width * 0.9, height: Node.frame.width * 0.97))
                Node.physicsBody?.friction = 0
                Node.physicsBody?.restitution = 0.1
                Node.physicsBody?.allowsRotation = false
                Node.zPosition = 2.0
                
                self.addChild(Node)
                
                if moveNo >= 42
                {
                    game.gameOver()
                    ((scene!.view!.window?.rootViewController!)! as UIViewController).dismissViewControllerAnimated(true, completion: nil) //Returns to menu screen
                }
                moveNo++
                self.moveLabel.text = "\(moveNo - 1)"
                
                self.view!.userInteractionEnabled = false // disable user interaction while work is carried out.
                
                
                let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 2 * Int64(NSEC_PER_SEC))
                dispatch_after(time, dispatch_get_main_queue()) {
                    //put your code which should be executed with a delay here
                    
                    
                    
                    if self.playerTurn == 2 {
                        self.pl1.fontColor = UIColor.blueColor()
                        self.pl2.fontColor = UIColor.blackColor()
                        
                        let Node = SKShapeNode(circleOfRadius: (shortSide * 0.67 / 14))
                        let validMoveLocation = self.AI.takeMove(self.game,valid2: self.move,turn: self.playerTurn)  /// Need to use this to postion the node.
                        if self.game.hasWon(validMoveLocation, turn: self.playerTurn)
                        {
                            let playerWon = self.p2
                            
                            self.game.gameWon("\(playerWon)", turns: self.moveNo, times: "\(self.gameStart)")
                            ((self.scene!.view!.window?.rootViewController!)! as UIViewController).dismissViewControllerAnimated(true, completion: nil)
                        }
                        
                        
                        
                        Node.fillColor = UIColor.redColor()
                        
                        if self.frame.height < self.frame.width { shortSide = self.frame.height}
                        
                        let padding = (self.frame.width - shortSide * 0.7)/2
                        
                        switch (validMoveLocation){
                        case "buttonFactory1":
                            Node.position = CGPoint(x:(padding + shortSide * 0.051),y:(self.frame.height * 0.65))
                        case "buttonFactory2":
                            Node.position = CGPoint(x:(padding + shortSide * 0.151),y:(self.frame.height * 0.65))
                        case "buttonFactory3":
                            Node.position = CGPoint(x:(padding + shortSide * 0.251),y:(self.frame.height * 0.65))
                        case "buttonFactory4":
                            Node.position = CGPoint(x:(padding + shortSide * 0.351),y:(self.frame.height * 0.65))
                        case "buttonFactory5":
                            Node.position = CGPoint(x:(padding + shortSide * 0.451),y:(self.frame.height * 0.65))
                        case "buttonFactory6":
                            Node.position = CGPoint(x:(padding + shortSide * 0.551),y:(self.frame.height * 0.65))
                        case "buttonFactory7":
                            Node.position = CGPoint(x:(padding + shortSide * 0.651),y:(self.frame.height * 0.65))
                        default:
                            return
                        }
                        
                        Node.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: Node.frame.width * 0.9, height: Node.frame.width * 0.97))
                        Node.physicsBody?.friction = 0
                        Node.physicsBody?.restitution = 0.1
                        Node.physicsBody?.allowsRotation = false
                        Node.zPosition = 2.0
                        
                        self.addChild(Node)
                        
                        self.playerTurn = 1
                        self.moveNo++
                        self.moveLabel.text = "\(self.moveNo - 1)"
                        
                        if self.moveNo >= 42
                        {
                            self.game.gameOver()
                            ((self.scene!.view!.window?.rootViewController!)! as UIViewController).dismissViewControllerAnimated(true, completion: nil)
                        }
                        
                        self.view!.userInteractionEnabled = true  // re-enable toch screen
                    }
                    
                }
            }
        }
    }
    
    //If the scene changes size (rotation) reposition the player labels, and move count label.
    override func didChangeSize(oldSize: CGSize) {
        pl1.position = CGPoint(x: pl1.frame.width/2 + self.frame.width * 0.05, y: self.frame.height * 0.95)
        pl2.position = CGPoint(x: self.frame.width - pl2.frame.width/2 - self.frame.width * 0.05, y: self.frame.height * 0.95)
        moveLabel.position = CGPoint(x: self.frame.midX, y: self.frame.height * 0.95)
    }
    
    
    
    //Defined functions
    
    func columnName(pixel: CGPoint) -> String
    {
        var shortSide = self.frame.width
        if self.frame.width > self.frame.height { shortSide = self.frame.height }
        
        let paddingSidesWidth = (self.frame.width - shortSide * 0.7) / 2
        let colWidth = (shortSide/10)
        
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
    
    //Draws the grid and adds it to the scene
    func drawGrid()
    {
        // Code to create columns
        
        for index in 1 ... 8 {
            
            let wallNode = SKShapeNode(rectOfSize: CGSize(width: gridLineWidth, height: gridHeight))
            
            wallNode.fillColor = UIColor.whiteColor()
            wallNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: gridLineWidth/2, height: gridHeight))
            wallNode.physicsBody?.friction = 0
            wallNode.physicsBody?.allowsRotation = false
            wallNode.physicsBody?.dynamic = false
            wallNode.zPosition = 1.0
            wallNode.position = CGPointMake(CGFloat(index - 1) * CGFloat(colWidth) + gridLineWidth/2, wallNode.frame.height/2)
            
            self.addChild(wallNode)
        }
        
        //Create bottom row, with physical body so cannot pass through
        let rowNode = SKShapeNode(rectOfSize: CGSize(width: gridWidth, height: gridLineWidth))
        
        rowNode.fillColor = UIColor.whiteColor()
        rowNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: gridWidth, height: gridLineWidth/2))
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
            otherRows.zPosition = 1.0
            otherRows.position = CGPointMake(rowNode.frame.width/2 + gridLineWidth/2, CGFloat(rowIndex) * CGFloat(colWidth))
            
            self.addChild(otherRows)
        }
    }
    
    
    //Applies the image of the connect4 grid over the top of the grid
    func applyGridOverlay()
    {
        let gameBoard = SKSpriteNode(imageNamed:"grid2")
        
        gameBoard.size = CGSizeMake(shortSide * 0.7, shortSide * 0.7)
        gameBoard.position = CGPoint(x: CGRectGetMidX(self.frame) + shortSide/200, y: CGRectGetMidY(self.frame))
        gameBoard.zPosition = 3.0
        
        self.addChild(gameBoard)
    }
    
    
    //Centers the position of each grid line (node)
    func centerGrid()
    {
        for node in self.children
        {
            node.position.x =  node.position.x + (self.frame.width - (shortSide * 0.7)) / 2
            node.position.y = node.position.y + (self.frame.height - (shortSide * 0.7)) / 2
        }
    }
    
    //Adds the player name labels, and move count label to the scene.
    func addText()
    {
        pl1 = SKLabelNode(text: p1)
        pl1.position = CGPoint(x: pl1.frame.width/2 + self.frame.width * 0.05, y: self.frame.height * 0.95)
        pl1.fontSize = 24
        pl1.color = UIColor.blackColor()
        pl1.fontColor = UIColor.blueColor()
        pl1.zPosition = 4.0
        self.addChild(pl1)
        
        pl2 = SKLabelNode(text: p2)
        pl2.position = CGPoint(x: self.frame.width - pl2.frame.width/2 - self.frame.width * 0.05, y: self.frame.height * 0.95)
        pl2.fontSize = 24
        pl2.color = UIColor.blackColor()
        pl2.fontColor = UIColor.blackColor()
        pl2.zPosition = 4.0
        self.addChild(pl2)
        
        moveLabel.text = "\(moveNo - 1)"
        moveLabel.position = CGPoint(x: self.frame.midX, y: self.frame.height * 0.95)
        moveLabel.fontSize = 24
        moveLabel.color = UIColor.blackColor()
        moveLabel.fontColor = UIColor.blackColor()
        moveLabel.zPosition = 4.0
        self.addChild(moveLabel)
    }
}