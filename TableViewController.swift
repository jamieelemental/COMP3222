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
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backToHome(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"This List\""
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
    }
    

    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")

        let person = people[indexPath.row]
        
        cell!.textLabel!.text = "\((person.valueForKey("name") as? String)!) - Turns: \((person.valueForKey("turns") as? Int)!)  Time: \((person.valueForKey("time") as? String)!) "
        
        //print((person.valueForKey("name") as? String)! + " test")
        
        return cell!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: true)
        let sortDescriptors = [sortDescriptor]
        fetchRequest.sortDescriptors = sortDescriptors
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            people = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
}





















