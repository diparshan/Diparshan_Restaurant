//
//  Diparshan_FinalApp.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import SwiftUI

@main
struct Diparshan_FinalApp: App {
    let coreDBHelper = CoreDBHelper(moc: PersistanceController.shared.container.viewContext)
    let locationHelper = LocationHelper()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(coreDBHelper)
                .environmentObject(locationHelper)
        }
    }
}
