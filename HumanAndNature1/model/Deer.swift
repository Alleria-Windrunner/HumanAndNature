//
//  Deer.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/6/20.
//  Copyright © 2020 sky. All rights reserved.
//

import Foundation
import SpriteKit
class Deer  {
    let DEER1                                  = "DEER1"
    let DEER10                                 = "DEER10"
    let DEER2                                  = "DEER2"
    let DEER3                                  = "DEER3"
    let DEER4                                  = "DEER4"
    let DEER5                                  = "DEER5"
    let DEER6                                  = "DEER6"
    let DEER7                                  = "DEER7"
    let DEER8                                  = "DEER8"
    let DEER9                                  = "DEER9"
    
    
    // load texture atlas
    let textureAtlas = SKTextureAtlas(named: "assets")


    
    func dEER1() -> SKTexture                                  { return textureAtlas.textureNamed(DEER1) }
    func dEER10() -> SKTexture                                 { return textureAtlas.textureNamed(DEER10) }
    func dEER2() -> SKTexture                                  { return textureAtlas.textureNamed(DEER2) }
    func dEER3() -> SKTexture                                  { return textureAtlas.textureNamed(DEER3) }
    func dEER4() -> SKTexture                                  { return textureAtlas.textureNamed(DEER4) }
    func dEER5() -> SKTexture                                  { return textureAtlas.textureNamed(DEER5) }
    func dEER6() -> SKTexture                                  { return textureAtlas.textureNamed(DEER6) }
    func dEER7() -> SKTexture                                  { return textureAtlas.textureNamed(DEER7) }
    func dEER8() -> SKTexture                                  { return textureAtlas.textureNamed(DEER8) }
    func dEER9() -> SKTexture                                  { return textureAtlas.textureNamed(DEER9) }
    func dEER_run() -> [SKTexture] {
        return [
            dEER1(),
            dEER2(),
            dEER3(),
            dEER4(),
            dEER5(),
            dEER6(),
            dEER7(),
            dEER8(),
            dEER9(),
            dEER10()
        ]
    }
}
