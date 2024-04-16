//
//  CoreDBHelper.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import Foundation
import CoreData

class CoreDBHelper : ObservableObject {
    @Published var restaurantList = [RestaurantMO]()
    
    private static var shared: CoreDBHelper?
    private let ENTITY_NAME = "RestaurantMO"
    private let moc : NSManagedObjectContext
    
    static func getInstance() -> CoreDBHelper{
        if shared == nil {
            shared = CoreDBHelper(moc: PersistanceController.preview.container.viewContext)
        }
        
        return shared!
    }
    
    init(moc : NSManagedObjectContext){
        self.moc = moc
    }
    
    func insertRestaurant(newRestro: Restaurant){
        do{
            let restaurantToInsert = NSEntityDescription.insertNewObject(forEntityName: self.ENTITY_NAME, into: self.moc) as! RestaurantMO

            
            restaurantToInsert.id = UUID()
            restaurantToInsert.name = newRestro.name
            restaurantToInsert.latitude = newRestro.latitude
            restaurantToInsert.longitude = newRestro.longitude
            

            //saving the object to db
            if self.moc.hasChanges{
                try self.moc.save()

                print(#function, "Restaurant was successfully added to the database!")
            }
        }catch let error as NSError{
            print(#function, "Could not insert restaurant to coreDB successfullt: \(error)")
        }
    }
    
    func getAllRestaurants(){

        let request = NSFetchRequest<RestaurantMO>(entityName: self.ENTITY_NAME)
        request.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        
        do{

            let result = try self.moc.fetch(request)
            
            print(#function, "\(result.count) books fetched frpm db")
            
            self.restaurantList.removeAll()
            self.restaurantList.insert(contentsOf: result, at: 0)
            
        }catch let error as NSError{
            print(#function, "Couldn't fetch data from DB \(error)")
        }
    }
    
}
