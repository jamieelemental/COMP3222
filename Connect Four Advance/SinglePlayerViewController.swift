//
//  SinglePlayerViewController.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 30/11/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import UIKit
import SpriteKit


class SinglePlayerViewController: UIViewController {
    
  //  override func viewDidLoad() {
  //      super.viewDidLoad()
        
        
        
        //let scene = SinglePlayerScene (size){
            // Configure the view.
        //    let skView = self.view as! SKView
        //    skView.showsFPS = true
        //    skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
        //    skView.ignoresSiblingOrder = true
        //
        //    /* Set the scale mode to scale to fit the window */
        //    scene.scaleMode = .AspectFill
        //
        //    skView.presentScene(scene)
        //}
    
    // Do any additional setup after loading the view.
//}

        override func viewDidLoad() {
            super.viewDidLoad()
            let scene = SinglePlayerScene(size: view.bounds.size)
            let skView = view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            skView.presentScene(scene)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
