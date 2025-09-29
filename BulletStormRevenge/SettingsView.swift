import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var settings: [GameSettings]
    @Binding var showSettings: Bool // ✅ Binding to control settings visibility

    @State private var selectedShipColor: String = "red" // Default ship color
    @State private var shipScale: CGFloat = 1.0 // For animation effect

    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()

            Text("Select Ship Color:")
                .font(.headline)
                .padding(.top)

            // Display the selected ship with an animation
            Image("ship_\(selectedShipColor)")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .scaleEffect(shipScale) // Apply animation effect
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: shipScale) // Smooth transition

            Picker("Ship Color", selection: $selectedShipColor) {
                Text("Red").tag("red")
                Text("Purple").tag("purple")
                Text("Yellow").tag("yellow")
                Text("Silver").tag("silver")
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selectedShipColor) { newValue in
                updateShipColor(newValue)
            }

            Spacer()
            
            // ✅ Added Save & Return Button
            Button(action: saveAndReturn) {
                Text("Save & Return")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
        }
        .padding()
        .onAppear {
            // Load saved ship color when the settings screen opens
            selectedShipColor = settings.first?.selectedShipColor ?? "red"
        }
    }

    // Helper function to bind settings properties


    // Function to update ship color and animate the ship
    private func updateShipColor(_ color: String) {
        shipScale = 1.3 // Briefly enlarge the ship
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            shipScale = 1.0 // Return to normal size
        }

        // Save selected color to SwiftData
        if settings.isEmpty {
            let newSettings = GameSettings(selectedShipColor: color)
            modelContext.insert(newSettings)
        } else {
            settings.first?.selectedShipColor = color
        }

        // Save selected color to UserDefaults for retrieval in GameScene
        UserDefaults.standard.set(color, forKey: "selectedShipColor")
    }

    // ✅ Function to save settings and return to ContentView
    private func saveAndReturn() {
        Task {
            do {
                try modelContext.save() // Save changes to SwiftData
            } catch {
                print("Failed to save settings: \(error)")
            }
            showSettings = false // Return to ContentView
        }
    }
}
