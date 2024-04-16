//
//  RestaurantMO.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import Foundation
import CoreData

@objc(RestaurantMO)
class RestaurantMO : NSManagedObject {
    @NSManaged var id : UUID?
    @NSManaged var name : String
    @NSManaged var latitude : Double
    @NSManaged var longitude : Double
}

