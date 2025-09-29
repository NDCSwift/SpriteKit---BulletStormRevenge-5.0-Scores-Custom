//
    // Project: BulletStormRevenge
    //  File: Untitled.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    
import SpriteKit // Importing SpriteKit for game-related functionality

// Enum defining different types of power-ups available in the game
enum PowerUpType {
    case speedBoost  // Increases game speed and enemy movement temporarily
    case slowEnemies // Slows down enemy movement temporarily
    case shield      // Provides a shield that absorbs one enemy hit
}

// Power-up class representing collectible items that provide temporary effects
class PowerUp: SKSpriteNode {
    var type: PowerUpType // Stores the type of power-up

    // Initializes the power-up with a specific type
    init(type: PowerUpType) {
        self.type = type // Assigns the power-up type
        let texture: SKTexture // Variable to hold the appropriate texture
        
        // Selects the correct texture based on the power-up type
        switch type {
        case .speedBoost:
            texture = SKTexture(imageNamed: "powerup_speed") // Texture for speed boost power-up
        case .slowEnemies:
            texture = SKTexture(imageNamed: "powerup_slow") // Texture for slow enemies power-up
        case .shield:
            texture = SKTexture(imageNamed: "powerup_shield") // Texture for shield power-up
        }
        
        // Calls the superclass initializer with texture and default size
        super.init(texture: texture, color: .clear, size: CGSize(width: 30, height: 30))

        // Sets up physics body for collision detection
        self.physicsBody = SKPhysicsBody(circleOfRadius: 15) // Defines the collision area
        self.physicsBody?.isDynamic = true // Allows power-ups to move
        self.physicsBody?.affectedByGravity = false // Prevents power-ups from falling
        self.physicsBody?.categoryBitMask = PhysicsCategory.powerUp // Assigns category for collision filtering
        self.physicsBody?.contactTestBitMask = PhysicsCategory.player // Detects contact with the player
        self.physicsBody?.collisionBitMask = 0 // Prevents physical collisions, only detects contact
        self.zPosition = 1 // Ensures power-ups appear above the background
    }

    // Required initializer, not implemented since power-ups should always be initialized with a type
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
