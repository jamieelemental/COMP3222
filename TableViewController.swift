//
//  TableViewController.swift
//  Connect Four Advance
//
//  Created by J C C Element on 12/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UIViewController, UITableViewDataSource{
    
    var leaders = [NSManagedObject]()
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Actions
    @IBAction func backToHome(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"This List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //Returns count of leaders
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return leaders.count
    }
    
    
    //Runs for each row, adding player details
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let player = leaders[indexPath.row]
        
        cell!.textLabel!.text = "\((player.valueForKey("name") as? String)!) - Turns: \((player.valueForKey("turns") as? Int)!)  Time: \((player.valueForKey("time") as? String)!) "
        
        return cell!
    }
    
    //Gets data from CoreData and displays it in table view
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "LeaderboardStore")
        let sortDescriptor = NSSortDescriptor(key: "turns", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.fetchLimit = 10
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            leaders = results as! [NSManagedObject]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}





















