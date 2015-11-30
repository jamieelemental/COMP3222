//
//  GameScene.swift
//  Connect Four Advance
//
//  Created by J C C Element on 30/11/2015.
//  Copyright (c) 2015 DanAndJamie. All rights reserved.
//

import SpriteKit

class Grid:SKSpriteNode {
    var rows:Int!
    var cols:Int!
    var blockSize:Double!
    
    convenience init(blockSize:Double,rows:Int,cols:Int) {
        let texture = Grid.gridTexture(blockSize,rows: rows, cols:cols)
        self.init(texture: texture, color:SKColor.grayColor(), size: texture.size())
        self.blockSize = blockSize
        self.rows = rows
        self.cols = cols
    }
    
    class func gridTexture(blockSize:Double,rows:Int,cols:Int) -> SKTexture {
        
        // Add 1 to the height and width to ensure the borders are within the sprite
        let size = CGSize(width: Double(cols) * blockSize + 1.0, height: Double(rows) * blockSize + 1.0)
        UIGraphicsBeginImageContext(size)
        
        let context = UIGraphicsGetCurrentContext()
        let bezierPath = UIBezierPath()
        let offset:Double = 0.5
        
        // Draw vertical lines
        for i in 0...cols {
            let x = Double(i) * blockSize + offset
            bezierPath.moveToPoint(CGPoint(x: x, y: 0))
            bezierPath.addLineToPoint(CGPoint(x: CGFloat(x), y: size.height))
        
        }
        
        // Draw horizontal lines
        for i in 0...rows {
            let y = Double(i) * blockSize + offset
            bezierPath.moveToPoint(CGPoint(x: 0, y: y))
            bezierPath.addLineToPoint(CGPoint(x: size.width, y: CGFloat(y)))
        }
        
        SKColor.blueColor().setStroke()
        bezierPath.lineWidth = 4.0
        bezierPath.stroke()
        CGContextAddPath(context, bezierPath.CGPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        return SKTexture(image: image)
    }
    
    func gridPosition(row:Int, col:Int) -> CGPoint
    {
        let offset = blockSize / 2.0 + 0.5
        
        let x = (Double(col) * blockSize - (blockSize * Double(cols))) / 2.0 + offset
        
        let temp = Double(rows - row - 1) * blockSize
        
        let y = temp -  (blockSize * Double(rows)) / 2.0 + offset
        
        
        return CGPoint(x:x, y:y)
    }
    
}





class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        scaleMode = .ResizeFill
        let grid = Grid(blockSize: 50.0, rows: 6, cols: 7)
        grid.position = CGPointMake (CGRectGetMidX(view.frame),CGRectGetMidY(view.frame))
        addChild(grid)

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            var colr = UIColor.yellowColor()
            
            //UIViewController
            
            if (touch.tapCount % 2 == 0)
            {
                colr = UIColor.redColor()
            }
            
            //let sprite = SKSpriteNode(imageNamed:"Spaceship")
            //let sprite = SKSpriteNode(color: SKColor.yellowColor(), size: CGSize.init(width: 100, height: 100))
            let sprite = SKShapeNode(circleOfRadius: 50)
            sprite.fillColor = colr
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}


