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
    var connectTable: NSManagedObject?
    var fetchRequest: NSFetchRequest<NSManagedObject>?
    
    private init () {
        self.container = NSPersistentContainer(name: self.modelName)
        self.container.loadPersistentStores {(storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        self.managedContext = container.viewContext
    }
    
    func saveContext () -> Bool {
        guard self.managedContext.hasChanges else { return false}
        
        do {
            try self.managedContext.save()
            return true
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
            return false
        }
    }

    func connectTable (_ table: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: table, in: managedContext) else {return}
        fetchRequest = NSFetchRequest<NSManagedObject>(entityName: table)
        connectTable = NSManagedObject(entity: entity, insertInto: managedContext)
    }

    func fetchDataFromTable() -> [Any] {
        guard let fetchRequest = fetchRequest else {return []}
        var results: [Any]?
        do {
            results = try managedContext.fetch(fetchRequest)
            managedContext.fetch
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        guard let listRecords = results else {return []}
        return listRecords
    }

    func fetchDataWithDate() -> [Any] {
        guard let fetchRequest = fetchRequest else {return []}
        let endDate = Date()
        fetchRequest.predicate = NSPredicate(format: "select_date == %@", CommonUtility.formatToString(endDate))
        var results: [Any]?
        do {
            results = try managedContext.fetch(fetchRequest)
            managedContext.fetch
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        guard let listRecords = results else {return []}
        return listRecords
    }
    
}
