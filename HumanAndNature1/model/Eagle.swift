//
//  Eagle.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/6/20.
//  Copyright © 2020 sky. All rights reserved.
//

import Foundation
import SpriteKit

class Eagle {
    let EAGLE_0                                = "EAGLE 0"
    let EAGLE_1                                = "EAGLE  1"
    let EAGLE_10                               = "EAGLE 10"
    let EAGLE_11                               = "EAGLE 11"
    let EAGLE_12                               = "EAGLE 12"
    let EAGLE_2                                = "EAGLE  2"
    let EAGLE_3                                = "EAGLE 3"
    let EAGLE_4                                = "EAGLE 4"
    let EAGLE_5                                = "EAGLE 5"
    let EAGLE_6                                = "EAGLE 6"
    let EAGLE_7                                = "EAGLE 7"
    let EAGLE_8                                = "EAGLE 8"
    let EAGLE_9                                = "EAGLE 9"
    
    // load texture atlas
    let textureAtlas = SKTextureAtlas(named: "assets")
    
    func eAGLE_0() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_0) }
     func eAGLE_1() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_1) }
     func eAGLE_10() -> SKTexture                               { return textureAtlas.textureNamed(EAGLE_10) }
     func eAGLE_11() -> SKTexture                               { return textureAtlas.textureNamed(EAGLE_11) }
     func eAGLE_12() -> SKTexture                               { return textureAtlas.textureNamed(EAGLE_12) }
     func eAGLE_2() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_2) }
     func eAGLE_3() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_3) }
     func eAGLE_4() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_4) }
     func eAGLE_5() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_5) }
     func eAGLE_6() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_6) }
     func eAGLE_7() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_7) }
     func eAGLE_8() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_8) }
     func eAGLE_9() -> SKTexture                                { return textureAtlas.textureNamed(EAGLE_9) }
    func eAGLE_run() -> [SKTexture] {
        return [
            eAGLE_0(),
            eAGLE_1(),
            eAGLE_2(),
            eAGLE_3(),
            eAGLE_4(),
            eAGLE_5(),
            eAGLE_6(),
            eAGLE_7(),
            eAGLE_8(),
            eAGLE_9(),
            eAGLE_10(),
            eAGLE_11(),
            eAGLE_12()
        ]
    }
}
