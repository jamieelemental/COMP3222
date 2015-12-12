//
//  TableViewController.swift
//  Connect Four Advance
//
//  Created by J C C Element on 12/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = [NSManagedObject]()
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\"Leaderboard\""
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            people = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return names.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
            
            cell!.textLabel!.text = names[indexPath.row]
            
            return cell!
    }
}