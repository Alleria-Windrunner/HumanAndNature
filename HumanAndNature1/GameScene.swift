//
//  GameScene.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/5/30.
//  Copyright © 2020 sky. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var building: SKSpriteNode!
    var army: Army?
    override func didMove(to view: SKView) {
        // Connect Game Objects
        building = childNode(withName: "building") as! SKSpriteNode
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the location of the touch on the screen
        let touch = touches.first!
        let location = touch.location(in: self)

        // Check if the touch was on the Orange Tree
        if atPoint(location).name == "building" {
          // Create the orange and add it to the scene at the touch location
          army = Army()
          army?.position = location
          addChild(army!)

          // Give the orange an impulse to make it fly!
          let vector = CGVector(dx: 100, dy: 0)
          army?.physicsBody?.applyImpulse(vector)
        }
    }
}
