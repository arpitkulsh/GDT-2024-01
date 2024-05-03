//
//  DBManager.swift
//  DataBaseSample
//
//  Created by Arpit on 01/05/24.
//

import Foundation
import CoreData
import UIKit


/*
 CRUD
 - Create [DONE]
 - Read [DONE]
 - Update [DONE]
 - Delete [DONE]
 
 
 */

class DBManager: NSObject {
    
    var managedContext: NSManagedObjectContext!
    
    static let shared: DBManager = {
        let instance = DBManager()
        return instance
    }()
    
    private override init() {
        super.init()
        let application = UIApplication.shared
        let appDelegate = application.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        self.managedContext = container?.viewContext
    }
    
    func saveDataToStudent(withEntity: String, with dataModel: StudentModel) -> Bool {
        if let entity = NSEntityDescription.entity(forEntityName: withEntity, in: self.managedContext) {
            let user = NSManagedObject(entity: entity, insertInto: self.managedContext)
            
            user.setValue(dataModel.name, forKey: "name")
            user.setValue(dataModel.age, forKey: "age")
            user.setValue(dataModel.email, forKey: "email")
            
//            saveData()
           // return true
            do {
                try self.managedContext.save()
                return true
            }
            catch {
                print(error)
            }
        }
        
        return false
        
    }
    
    func saveData() {
        let application = UIApplication.shared
        let appDelegate = application.delegate as? AppDelegate
        appDelegate?.saveContext()
    }
    
    func fetchData(withEntity: String) -> [NSManagedObject] {
        var fetchResult: [NSManagedObject] = []
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: withEntity)
        
        do {
            fetchResult = try self.managedContext.fetch(fetchRequest) as? [NSManagedObject] ?? []
            
            return fetchResult
        }
        catch {
            print(error)
        }
        
        return []
    }
    
    func updateData(withEntity: String, with dataModel: StudentModel) -> Bool
    {
        var fetchResult: [NSManagedObject] = []
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: withEntity)
        fetchRequest.fetchLimit = 1
        
        do {
            fetchResult = try self.managedContext.fetch(fetchRequest) as? [NSManagedObject] ?? []
            if fetchResult.count > 0 {
                let obj = fetchResult[0] as NSManagedObject
                obj.setValue(dataModel.name, forKey: "name")
                obj.setValue(dataModel.age, forKey: "age")
                obj.setValue(dataModel.email, forKey: "email")
            }
            saveData()
            return true
        }
        catch {
            print(error)
        }
       
        return false
    }
    
    func deleteData(withEntity: String) -> Bool {
        var fetchResult: [NSManagedObject] = []
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: withEntity)
        fetchRequest.fetchLimit = 1
        
        do {
            fetchResult = try self.managedContext.fetch(fetchRequest) as? [NSManagedObject] ?? []
            if fetchResult.count > 0 {
                let obj = fetchResult[0] as NSManagedObject
                self.managedContext.delete(obj)
            }
            saveData()
            return true
        }
        catch {
            print(error)
        }
       
        return false
    }
    
    
    func addPersitentStore()
    {
        let application = UIApplication.shared
        let appDelegate = application.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        
        let storeCordinator = container?.persistentStoreCoordinator
        
        let defaultURL = NSPersistentContainer.defaultDirectoryURL()
        
        let storeURL = defaultURL.appendingPathComponent("Sample.sqlite")
        
        do {
           let store = try storeCordinator?.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        }
        catch {
            print(error)
        }
        
        
    }
    
    

    

}


