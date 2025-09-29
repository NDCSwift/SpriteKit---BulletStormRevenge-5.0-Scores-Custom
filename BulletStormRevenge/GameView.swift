//
    // Project: BulletStormRevenge
    //  File: GameView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import SpriteKit

struct GameView: View {
    var scene: SKScene{
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene) // embed our new sprite kit based game
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}
