//
//  iOS_ChatGPTApp.swift
//  iOS-ChatGPT
//
//  Created by sidkotha on 22/04/23.
//

import SwiftUI

@main
struct iOS_ChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model())
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
