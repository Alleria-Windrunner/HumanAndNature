//
//  Army.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/5/30.
//  Copyright © 2020 sky. All rights reserved.
//

import SpriteKit

class Army: SKSpriteNode {
    let type : Int
    let amount : Int
    init(type:Int,amount:Int) {
        let texture:SKTexture
        self.type=type
        self.amount = amount
        let deer = Deer()
        let eagle = Eagle()
        if(type==0){texture=deer.dEER1()}
        else {texture=eagle.eAGLE_0()}
        var size = texture.size()
        size.width*=5;size.height*=5;
        let color = UIColor.clear

        super.init(texture: texture, color: color, size: size)

        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
