//
//  LeaderBoard.swift
//  Connect Four Advance
//
//  Created by Daniel Nuttall on 11/12/2015.
//  Copyright © 2015 DanAndJamie. All rights reserved.
//

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
    
}