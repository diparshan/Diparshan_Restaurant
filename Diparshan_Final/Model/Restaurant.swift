//
//  Restaurant.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import Foundation

struct Restaurant : Codable, Hashable{
    var id : String? = UUID().uuidString
    var name : String
    var latitude : Double
    var longitude : Double
    
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
