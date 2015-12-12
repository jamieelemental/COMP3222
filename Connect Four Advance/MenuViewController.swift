//
//  MenuViewController.swift
//  Connect Four Advance
//
//  Created by J C C Element on 30/11/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func changeOri(sender: AnyObject) {
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }

    @IBAction func setOrientation(sender: AnyObject) {
//        let orientation = UIInterfaceOrientation.LandscapeLeft.rawValue
//        UIDevice.currentDevice().setValue(orientation, forKey: "orientation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
