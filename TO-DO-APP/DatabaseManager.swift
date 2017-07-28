//
//  DatabaseManager.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 7/31/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import Foundation
import CoreData

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private var modelName: String = "Model"
    private var managedContext: NSManagedObjectContext
    private let container: NSPersistentContainer
    
    private init () {
        self.container = NSPersistentContainer(name: self.modelName)
        self.container.loadPersistentStores {(storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        self.managedContext = container.viewContext
    }
    
    func saveContext () {
        guard self.managedContext.hasChanges else { return }
        
        do {
            try self.managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
}
