//
//  LeaderBoard.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 11/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LeaderBoard {
    
    
    // Method for saving Users to database.
    func Save(name: String, turns: Int, time: String) -> Bool {
        var players = [NSManagedObject]()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Person",inManagedObjectContext:managedContext)
        let player = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        player.setValue(name, forKey: "name")
        player.setValue(turns, forKey: "turns")
        player.setValue(time, forKey: "time")
        
        do {
            try managedContext.save()
            players.append(player)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            return false
        }
        return true
    }
    
    // Test Method for fetching results from database.
    func printCoreDataforTesting() {
        var players = [NSManagedObject]()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            players = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        print("Database Size: ",players.count)
        
        for index in players {
            print(index.valueForKey("name") as? String)
            print(index.valueForKey("turns") as? Int)
            print(index.valueForKey("time") as? String)
            
        }
    }
}