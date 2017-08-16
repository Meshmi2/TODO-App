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

    func addTask(_ task: TaskModel?) -> Bool {
        let tableName = "Task"
        let entity = NSEntityDescription.entity(forEntityName: tableName, in: managedContext)
        guard let tmpEntity = entity else {return false}
        let connectTable = NSManagedObject(entity: tmpEntity, insertInto: managedContext)
        if let descriptionTask = task?.descriptionTask,
            let repeatTime = task?.timeRepeat,
            let location = task?.location,
            let fromTime = task?.fromTime,
            let toTime = task?.toTime,
            let title = task?.titleTask,
            let allDay = task?.allDay,
            let selectDate = task?.selectDate {
            connectTable.setValue(title, forKey: "title")
            connectTable.setValue(descriptionTask, forKey: "description_task")
            connectTable.setValue(CommonUtility.formatToString(selectDate), forKey: "select_date")
            connectTable.setValue(location, forKey: "location")
            connectTable.setValue(repeatTime, forKey: "repeat_task")
            connectTable.setValue(fromTime, forKey: "from_time")
            connectTable.setValue(toTime, forKey: "to_time")
            connectTable.setValue(allDay, forKey: "all_day")
            connectTable.setValue("init", forKey: "status")
        }
        let result = saveContext()
        return result
    }

    func fetchDataFromTable() -> [Any] {
        let fetchRequest =  NSFetchRequest<NSManagedObject>(entityName: "Task")
        var results: [Any]?
        do {
            results = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        guard let listRecords = results else {return []}
        return listRecords
    }

    func fetchDataCurrentdateWithStatus() -> [Any] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        let currentDate = Date()
        fetchRequest.predicate = NSPredicate(format: "select_date == %@ AND status IN {'init', 'completed', 'snoozed', 'overdue'}", CommonUtility.formatToString(currentDate))
        var results: [Any]?
        do {
            results = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        guard let listRecords = results else {return []}
        return listRecords
    }

    func fetchDataWithQuery(_ month: String) -> [Any] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        fetchRequest.predicate = NSPredicate(format: "select_date LIKE %@  AND status IN {'completed', 'snoozed', 'overdue'}", "??/?\(month)/????")
        var results: [Any]?
        do {
            results = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        guard let listRecords = results else {return []}
        return listRecords
    }

    func fetchDataWithDate() -> [Any] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        let currentDate = Date()
        fetchRequest.predicate = NSPredicate(format: "select_date == %@", CommonUtility.formatToString(currentDate))
        var results: [Any]?
        do {
            results = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        guard let listRecords = results else {return []}
        return listRecords
    }

    func resetData () {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        let request = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        do {
            try managedContext.execute(request)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
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
}
