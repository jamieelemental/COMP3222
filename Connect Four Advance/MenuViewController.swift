//
//  MenuViewController.swift
//  Connect Four Advance
//
//  Created by J C C Element on 30/11/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    let value = UIInterfaceOrientation.Portrait.rawValue
    
    override func shouldAutorotate() -> Bool {
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        return false;
    }

    override func viewDidLoad() {
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
