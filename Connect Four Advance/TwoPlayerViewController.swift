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
    
//    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
//            return .AllButUpsideDown
//        } else {
//            return .All
//        }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Two Player loaded")
        
        let scene = TwoPlayerScene(size: view.bounds.size)
        
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
        
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            skView.presentScene(scene)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}






