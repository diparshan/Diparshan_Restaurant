//
//  DetailView.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import SwiftUI
import CoreLocation
import MapKit

struct DetailView: View {
    let selectedRestroIndex : Int
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var coreDBHelper : CoreDBHelper
    @EnvironmentObject var locationHelper : LocationHelper
    @State var restroAddress: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("\(self.coreDBHelper.restaurantList[selectedRestroIndex].name)")
                    .foregroundColor(.blue)
                    .font(
                        .system(size: 25, design: .rounded)                        .weight(.bold)
                    )
//                Text("Latitude: \(self.coreDBHelper.restaurantList[selectedRestroIndex].latitude)")
//                Text("Longitude: \(self.coreDBHelper.restaurantList[selectedRestroIndex].longitude)")
                
                if self.locationHelper.currentLocation != nil {
                    MapView(location: self.locationHelper.currentLocation!, restroAddress: self.restroAddress,
                            restroName: self.coreDBHelper.restaurantList[selectedRestroIndex].name)
                    .padding()
                }
            }//VStack
            .onAppear(){
                self.locationHelper.currentLocation = CLLocation(
                  latitude: self.coreDBHelper.restaurantList[selectedRestroIndex].latitude,
                  longitude: self.coreDBHelper.restaurantList[selectedRestroIndex].longitude)
                self.doReverseGeocoding()
            }
        }//navigationStack
        
    }//body
    
    private func doReverseGeocoding(){
        print("Performing reverse Geocoding...")
        
        let lat = self.coreDBHelper.restaurantList[selectedRestroIndex].latitude
        let lng = self.coreDBHelper.restaurantList[selectedRestroIndex].longitude
        
        let inputLocation = CLLocation(latitude: lat, longitude: lng)
        
        self.locationHelper.doReverseGeocoding(location: inputLocation, completionHandler: {(matchingAddress, error) in
            
            if (error == nil && matchingAddress != nil){
                self.restroAddress = matchingAddress!
                print(matchingAddress!)
            }else {
                print("Unable to obtain address for the provided coordinates of the restaurant")
            }
        })
    }
}


