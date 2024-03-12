//
//  Diparshan_FinalApp.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import SwiftUI

@main
struct Diparshan_FinalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
