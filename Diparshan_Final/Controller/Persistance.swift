//
//  Persistance.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import Foundation
import CoreData

struct PersistanceController{
    static let shared = PersistanceController()
    let container : NSPersistentContainer
    
    static var preview : PersistanceController = {
        let result = PersistanceController(inMemory: true)
        let viewContext = result.container.viewContext
        return result
    }()
    
    init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: "Diparshan_Final")
        
        if inMemory{
            self.container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        self.container.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            if let error = error as NSError?{
                print(#function, "Unable to connect to CoreData: \(error)")
            }
        })
    }
}
