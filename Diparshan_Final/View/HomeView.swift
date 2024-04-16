//
//  HomeView.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coreDBHelper : CoreDBHelper
    @EnvironmentObject var restaurantMO: RestaurantMO
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(self.coreDBHelper.restaurantList.enumerated().map({$0}), id: \.element.self){index, currentRestro in
                    
                    NavigationLink(destination: DetailView(selectedRestroIndex: index)){
                        Text("\(currentRestro.name)")
                            .font(.headline)
                                    .foregroundColor(.blue) // Adjust color as needed
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                    }//navigationLink
                }//ForEach
            }//List
            .navigationTitle("Restaurants")
            .foregroundColor(.blue)
            .onAppear(){
                let restaurants = [
                    ("Green Basil", 43.67194509399123, 79.29481045076973),
                    ("Garden State Restaurant", 43.67328970467347, 79.28743641138487),
                    ("ViVetha Bistro", 43.67445500956285, 79.28192137352565),
                    ("La Sala Restaurant", 43.67055563130399, 79.30038745534648),
                    ("Moti Mahal", 43.672931144770516, 79.3225715402185),
                    ("Uncle Betty’s Diner", 43.71525069234152, 79.40050585666548),
                ]
                
//                for item in restaurants.enumerated(){
//                    self.coreDBHelper.insertRestaurant(newRestro: Restaurant(name: item.element.0, latitude: item.element.1, longitude: item.element.2))
//                }
                
                self.coreDBHelper.getAllRestaurants()
            }
        }//NavigationStack
    }//view
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
