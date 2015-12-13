//
//  MenuViewController.swift
//  Connect Four Advance
//
//  Created by J C C Element on 30/11/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var TwoPlayerSwitch: UISwitch!
    @IBOutlet weak var PlayerTwoText: UITextField!
    @IBOutlet weak var PlayerOneText: UITextField!
    
    // MARK: Actions
    @IBAction func SwitchChanged(sender: UISwitch) {
        
        //Show/hide second player text box depending on switch state.
        PlayerTwoText.hidden = !TwoPlayerSwitch.on
    }
    
    @IBAction func SubmitButton(sender: UIButton) {
        //Warns the user if they have left certain text boxes empty. If all good, begin segue.
        if TwoPlayerSwitch.on && PlayerOneText.text! != "" && PlayerTwoText.text! != ""
        {
            performSegueWithIdentifier("TwoPlayer", sender: nil)
        }
        else if !TwoPlayerSwitch.on && PlayerOneText.text! != ""
        {
            performSegueWithIdentifier("OnePlayer", sender: nil)
        }
        else
        {
            let alert = UIAlertView()
            alert.title = "Incorrect Input"
            alert.message = "Please Enter your name."
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
    
    //Adds tap gesture to dismiss the keyboard.
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap"))//Creates a Tap Gesture, referencing a function to call when a tap is detected.
        view.addGestureRecognizer(tap) //Adds tap gesture to the view.
    }
    
    func handleTap()
    {
        self.view.endEditing(true) //Dismiss keyboard.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() // Dispose of any resources that can be recreated.
    }
    
    //Pass through players name to segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //Set player names before segue.
        if segue.identifier == "TwoPlayer"
        {
            let vc = segue.destinationViewController as? TwoPlayerViewController
            vc?.player1 = PlayerOneText.text!
            vc?.player2 = PlayerTwoText.text!
        }
        else if segue.identifier == "OnePlayer"
        {
            let vc = segue.destinationViewController as? SinglePlayerViewController
            vc?.player1 = PlayerOneText.text!
        }
    }
}
