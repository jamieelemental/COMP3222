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
    override func didMoveToView(view: SKView) {
        
        print("Two player loaded")
        scaleMode = .ResizeFill
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKShapeNode(circleOfRadius: 5)
            sprite.fillColor = UIColor.yellowColor()
            
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


