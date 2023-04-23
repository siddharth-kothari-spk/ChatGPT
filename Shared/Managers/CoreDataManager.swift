//
//  CoreDataManager.swift
//  ChatGPTApp
//
//  Created by sidkotha on 23/04/23.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "QueryHistoryModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store has failed \(error.localizedDescription)")
            }
        }
        
    }
}
