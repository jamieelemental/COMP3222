//
//  MenuViewController.swift
//  Connect Four Advance
//
//  Created by J C C Element on 30/11/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var TwoPlayerSwitch: UISwitch!
    @IBOutlet weak var PlayerTwoText: UITextField!
    @IBOutlet weak var PlayerOneText: UITextField!
    
    @IBAction func changeOri(sender: AnyObject) {
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }

    @IBAction func SwitchChanged(sender: UISwitch) {
        if TwoPlayerSwitch.on {
            PlayerTwoText.hidden = false
        }
        if !TwoPlayerSwitch.on {
            PlayerTwoText.hidden = true
        }
        
    }
    @IBAction func SubmitButton(sender: UIButton) {
        if TwoPlayerSwitch.on {
            performSegueWithIdentifier("TwoPlayer", sender: nil)
        }
        else {
            performSegueWithIdentifier("OnePlayer", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//        if !TwoPlayerSwitch.on {
//            let vc = segue.destinationViewController as? SinglePlayerViewController
//            vc.player1 = PlayerOneText.text
//        }
        
        if TwoPlayerSwitch.on {
            let vc = segue.destinationViewController as? TwoPlayerViewController
            vc?.player1 = PlayerOneText.text!
            vc?.player2 = PlayerTwoText.text!
        }
    }
}
