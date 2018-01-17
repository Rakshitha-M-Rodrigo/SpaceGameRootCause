//
//  GameScene.swift
//  Space Game Root Cause
//
//  Created by Rakshitha Muranga Rodrigo on 1/17/18.
//  Copyright © 2018 Rakshitha Muranga Rodrigo. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var fallingStars: SKEmitterNode!
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var score: Int = 0{
        didSet{
            scoreLabel.text = "Score \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        
        print("Starting...")
        
        fallingStars = SKEmitterNode(fileNamed: "FallingStars")
        fallingStars.position = CGPoint(x: 0, y: 0)
        fallingStars.advanceSimulationTime(10)
        fallingStars.zPosition = -1
        self.addChild(fallingStars)
        
        player = SKSpriteNode(imageNamed: "shuttle")
        player.scale(to: CGSize(width: 100, height: 100))
        player.position = CGPoint(x: 0, y: -self.frame.size.height/2 + 100)
        self.addChild(player)
        
        //MARK: Physics world configurations
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        
        //MARK: Score label
        scoreLabel = SKLabelNode(text: "Score 0")
        scoreLabel.position = CGPoint(x:-self.frame.size.width/2 + 100, y: self.frame.size.height/2 - 50)
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        scoreLabel.fontSize = 36
        scoreLabel.fontColor = UIColor.white
        score = 0
        self.addChild(scoreLabel)
    }
}
