//
    // Project: BulletStormRevenge
    //  File: EnemyManager.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
import SpriteKit // Importing SpriteKit for game-related functionality

// Enum defining different types of enemies in the game
enum EnemyType {
    case normal  // Standard enemy that moves straight down
    case seeker  // Enemy that slowly moves towards the player's X position
}

// Custom class for enemy objects, inheriting from SKSpriteNode
class EnemyNode: SKSpriteNode {
    var type: EnemyType // Stores the type of enemy

    // Initializes an enemy with a given type and texture
    init(type: EnemyType, texture: SKTexture) {
        self.type = type // Assigns the enemy type
        super.init(texture: texture, color: .clear, size: texture.size()) // Calls superclass initializer

        // Sets up physics body for collision detection
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2) // Defines the collision area
        self.physicsBody?.isDynamic = true // Enables movement via physics engine
        self.physicsBody?.categoryBitMask = 2 // Assigns category for enemies
        self.physicsBody?.contactTestBitMask = 1 // Detects collisions with the player
        self.physicsBody?.collisionBitMask = 0 // Prevents unintended physics interactions
        self.physicsBody?.usesPreciseCollisionDetection = true // Improves accuracy for fast-moving objects

        // If the enemy is a seeker, apply a glowing effect
        if type == .seeker {
            addGlowEffect() // Adds a red glow effect for visual distinction
        }
    }

    // Required initializer (not implemented since enemies should always have a type)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Updates enemy movement logic
    func updateMovement(playerPosition: CGPoint) {
        switch type {
        case .normal:
            break // Normal enemies only fall downward, no additional movement
        case .seeker:
            let moveSpeed: CGFloat = 5 // Speed at which the seeker enemy moves toward the player

            // Adjusts the seeker's X position to move towards the player
            if playerPosition.x > self.position.x {
                self.position.x += moveSpeed
            } else if playerPosition.x < self.position.x {
                self.position.x -= moveSpeed
            }
        }
    }

    // Adds a pulsing red glow effect to seeker enemies
    private func addGlowEffect() {
        let glowAction = SKAction.colorize(with: .red, colorBlendFactor: 0.7, duration: 0.3) // Red tint effect
        let removeGlow = SKAction.colorize(with: .white, colorBlendFactor: 0.0, duration: 0.3) // Restore original color
        let pulse = SKAction.sequence([glowAction, removeGlow]) // Creates a pulse effect
        let repeatGlow = SKAction.repeatForever(pulse) // Makes the effect loop continuously
        
        self.run(repeatGlow) // Applies the animation to the seeker enemy
    }
}
