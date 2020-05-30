//
//  Army.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/5/30.
//  Copyright © 2020 sky. All rights reserved.
//

import SpriteKit

class Army: SKSpriteNode {
  init() {
    let texture = SKTexture(imageNamed: "BRKS3NNE.SLP")
    let size = texture.size()
    let color = UIColor.clear

    super.init(texture: texture, color: color, size: size)

    physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
