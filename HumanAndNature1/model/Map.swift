//
//  Map.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/6/23.
//  Copyright © 2020 sky. All rights reserved.
//

import Foundation
import SpriteKit
class Map{
    func getMap(type:Int)-> Array<CGPoint>{
        var array:Array<CGPoint> = Array<CGPoint>()
        var point: CGPoint = CGPoint()
        array.insert(point, at: 0)
        switch type {
        case 1:
            point.x = 750;point.y = 370; array.insert(point, at: 1)
            point.x = 750;point.y = 878; array.insert(point, at: 2)
            point.x = 2000;point.y = 370; array.insert(point, at: 3)
            point.x = 2000;point.y = 878; array.insert(point, at: 4)
        case 2:
            point.x = 869;point.y = 235; array.insert(point, at: 1)
            point.x = 597;point.y = 621; array.insert(point, at: 2)
            point.x = 869;point.y = 1007; array.insert(point, at: 3)
            point.x = 1792;point.y = 235; array.insert(point, at: 4)
            point.x = 2090;point.y = 621; array.insert(point, at: 5)
            point.x = 1792;point.y = 1007; array.insert(point, at: 6)
        case 3:
            point.x = 572;point.y = 311; array.insert(point, at: 1)
            point.x = 572;point.y = 621; array.insert(point, at: 2)
            point.x = 572;point.y = 932; array.insert(point, at: 3)
            point.x = 1144;point.y = 621; array.insert(point, at: 4)
            point.x = 2116;point.y = 311; array.insert(point, at: 5)
            point.x = 2116;point.y = 621; array.insert(point, at: 6)
            point.x = 2116;point.y = 932; array.insert(point, at: 7)
            point.x = 1344;point.y = 621; array.insert(point, at: 8)
        default:
            break
        }
        return array
    }
    
}
