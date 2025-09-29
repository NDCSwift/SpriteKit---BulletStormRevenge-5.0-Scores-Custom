//
// Project: BulletStormRevenge
// File: ContentView.swift
// Created by Noah Carpenter
// 🐱 Follow me on YouTube! 🎥
// https://www.youtube.com/@NoahDoesCoding97
// Like and Subscribe for coding tutorials and fun! 💻✨
// Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
// Dream Big, Code Bigger

import SwiftUI // Importing SwiftUI framework for UI components

// Main view of the game that allows players to start or return from the game scene
struct ContentView: View {
    @State private var showGameScene = false // ✅ Controls whether the game scene is displayed
    @State private var showSettings = false // Controls whether the settings screen is displayed

    var body: some View {
        ZStack { // ✅ A stack that overlays views on top of each other
            if showGameScene {
                GameView()
                    .id(UUID()) // ✅ Ensures GameView resets when restarted to prevent state issues
                    .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("exitToMainMenu"))) { _ in
                        showGameScene = false // ✅ Listens for an exit notification to return to the main menu
                    }
            } else if showSettings {
                SettingsView(showSettings: $showSettings)
                    } else {
                VStack(spacing: 20) { // ✅ Vertically stacks the main menu elements with spacing
                    Text("Bullet Storm Revenge 🎮") // ✅ Game title
                        .font(.largeTitle) // ✅ Large title font
                        .bold() // ✅ Makes the text bold
                        .padding() // ✅ Adds padding around the title

                    Button(action: { // ✅ Button that starts the game
                        showGameScene = true // ✅ Sets `showGameScene` to true, switching to the game view
                    }) {
                        Text("Start Game") // ✅ Button label
                            .bold() // ✅ Bold text for emphasis
                            .padding() // ✅ Padding inside the button for better touch area
                            .frame(maxWidth: .infinity) // ✅ Expands the button width
                            .background(.blue) // ✅ Sets button background color to blue
                            .foregroundColor(.white) // ✅ Sets text color to white
                            .clipShape(RoundedRectangle(cornerRadius: 12)) // ✅ Adds rounded corners to the button
                    }
                    .padding(.horizontal, 40) // ✅ Adds horizontal padding to position the button

                    Button(action: { // Button that opens the settings
                        showSettings = true // Sets `showSettings` to true, switching to settings view
                    }) {
                        Text("Settings") // Button label
                            .bold() // Bold text for emphasis
                            .padding() // Padding inside the button for better touch area
                            .frame(maxWidth: .infinity) // Expands the button width
                            .background(.gray) // Sets button background color to gray
                            .foregroundColor(.white) // Sets text color to white
                            .clipShape(RoundedRectangle(cornerRadius: 12)) // Adds rounded corners to the button
                    }
                    .padding(.horizontal, 40) // Adds horizontal padding to position the button

                    Text("Survive as long as possible in this intense bullet storm! 🚀") // ✅ Game description
                        .font(.body) // ✅ Standard text font for readability
                        .foregroundColor(.gray) // ✅ Makes the text gray
                        .multilineTextAlignment(.center) // ✅ Centers the text
                        .padding(.horizontal, 20) // ✅ Adds horizontal padding for proper spacing
                }
                .padding() // ✅ Adds padding to the VStack for overall spacing
                .transition(.opacity) // ✅ Smooth fade-in/fade-out transition when switching views
            }
        }
        .animation(.easeInOut, value: showGameScene) // ✅ Animates changes between menu and game screen
        .animation(.easeInOut, value: showSettings) // Animates changes between menu and settings screen
    }
}

// ✅ Provides a preview for the SwiftUI canvas in Xcode
#Preview {
    ContentView()
}
