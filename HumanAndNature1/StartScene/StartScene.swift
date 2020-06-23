//
//  StartScene.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/6/23.
//  Copyright © 2020 sky. All rights reserved.
//

import Foundation
import SpriteKit

class StartScene: SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        if atPoint(location).name == "StartButton" {
            
            let selectScene = SelectScene(fileNamed: "SelectScene")!
            
            selectScene.scaleMode = .aspectFit
            // Present the scene
            let startTrans = SKTransition.crossFade(withDuration: 4)
            self.view?.presentScene(selectScene, transition: startTrans)
        }
    }
    
}
