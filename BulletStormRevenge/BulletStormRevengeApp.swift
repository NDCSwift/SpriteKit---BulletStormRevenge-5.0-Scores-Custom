//
    // Project: BulletStormRevenge
    //  File: BulletStormRevengeApp.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import SwiftData // ✅ Import SwiftData for settings persistence

@main
struct BulletStormRevengeApp: App {
    // ✅ Define a shared SwiftData model container
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([GameSettings.self]) // ✅ Register settings model
        let container = try! ModelContainer(for: schema)
        return container
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer) // ✅ Inject SwiftData into ContentView
        }
    }
}
