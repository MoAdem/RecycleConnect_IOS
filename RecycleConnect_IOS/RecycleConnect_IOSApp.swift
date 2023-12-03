//
//  RecycleConnect_IOSApp.swift
//  RecycleConnect_IOS
//
//  Created by Med adem Torkhani   on 28/11/2023.
//

import SwiftUI

@main
struct RecycleConnect_IOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          
        NavView()
        }
    }
}
//  ContentView()
    //  .environment(\.managedObjectContext, persistenceController.container.viewContext)
