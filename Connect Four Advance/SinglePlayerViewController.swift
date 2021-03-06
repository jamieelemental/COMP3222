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
    
    var scene = SKScene()
    var player1 = "Player 1"
    var player2 = "AI"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let SinglePlay = SinglePlayerScene(size: view.bounds.size) //Instantiate scene
        
        //Set player names
        SinglePlay.p1 = player1
        SinglePlay.p2 = player2
        
        //Set up SKScene
        scene = SinglePlay
        scene.scaleMode = .AspectFit
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene) //Present the scene within the view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //On device rotation, set the scene size to the new size, recenter the grid and contents in the scene.
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        
        let newSize =  CGSize(width: view.bounds.width, height: view.bounds.height)
        let oldSize = CGSize(width: view.bounds.height, height: view.bounds.width)
        
        scene.size = newSize
        recenterGrid(newSize, old: oldSize)
    }
    
    //override support for all orientations so all are allowed
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All
    }
    
    //centers all the nodes in the scene
    func recenterGrid(new: CGSize, old: CGSize)
    {
        var shortSide = old.width
        if old.width > old.height { shortSide = old.height }
        
        for node in scene.children
        {
            if let _ = (node as? SKLabelNode)
            {
                continue //Ignore the label nodes as they are aligned differently
            }
            else
            {
                //remove old padding
                node.position.x = node.position.x - (old.width - (shortSide * 0.7)) / 2
                node.position.y = node.position.y - (old.height - (shortSide * 0.7)) / 2
                
                //apply new
                node.position.x = node.position.x + (new.width - (shortSide * 0.7)) / 2
                node.position.y = node.position.y + (new.height - (shortSide * 0.7)) / 2
            }
        }
    }
}