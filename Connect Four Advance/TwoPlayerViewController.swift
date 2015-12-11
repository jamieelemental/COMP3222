//
//  TwoPlayerViewController.swift
//  Connect Four Advance
//
//  Created by J C C Element on 01/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import UIKit
import SpriteKit

class TwoPlayerViewController: UIViewController {
    
    var scene = SKScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Two Player loaded")
        
        scene = TwoPlayerScene(size: view.bounds.size)
        scene.scaleMode = .AspectFit
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
   
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        let newSize =  CGSize(width:view.bounds.width, height:view.bounds.height)
        scene.size = newSize
    }
}






