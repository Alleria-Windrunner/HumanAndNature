//
//  Label.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/6/23.
//  Copyright © 2020 sky. All rights reserved.
//

import Foundation
import SpriteKit

class Bloodlabel: SKLabelNode {
    var blood: Int
    override init() {
        blood=0
        super.init()
        self.text = blood.description
    }
    func update() {
        if let item = parent as? Building {
            self.blood = item.amount
            self.text = blood.description
        }
        else if let item = parent as? Army {
            self.blood = item.amount
            self.text = blood.description
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
