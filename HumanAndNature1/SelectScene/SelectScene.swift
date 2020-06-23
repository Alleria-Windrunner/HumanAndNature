//
//  SelectScene.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/6/23.
//  Copyright © 2020 sky. All rights reserved.
//

import Foundation
import SpriteKit

class SelectScene: SKScene {
    var difficulty: Int = 0
    var map :Int = 0
    var playertype : Int = 0
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        switch atPoint(location).name {
        case "easy":
                changeDifficulty(diff: 1)
            break
        case "normal":
            changeDifficulty(diff: 2)
            break
        case "hard":
            changeDifficulty(diff: 3)
            break
        case "map1":
            changemap(map: 1)
            break
        case "map2":
            changemap(map: 2)
            break
        case "map3":
            changemap(map: 3)
            break
        case "type1":
            changePlayerType(type: 1)
            break
        case "type2":
            changePlayerType(type: 2)
            break
        case "type3":
            changePlayerType(type: 3)
            break
        case "type4":
            changePlayerType(type: 4)
        case "StartButton":
            if difficulty != 0 && playertype != 0 && map != 0{
                startGame()
            }
            break
        default:
            break
        }
    }
    
    
    func changeDifficulty(diff:Int){
        var node:SKLabelNode? = nil
        var name:String = ""
        if(diff != difficulty){
            switch difficulty {
            case 1:
                name = "easy"
                break
            case 2:
                name = "normal"
                break
            case 3:
                name = "hard"
                break
            default:
                break
            }
            if(!name.isEmpty){
                node = (self.childNode(withName: name) as! SKLabelNode)
                node!.fontSize -= 30
            }
            switch diff {
            case 1:
                name = "easy"
                break
            case 2:
                name = "normal"
                break
            case 3:
                name = "hard"
                break
            default:
                break
            }
            node = (self.childNode(withName: name) as! SKLabelNode)
            node!.fontSize += 30
            difficulty = diff
        }
    }
    
    
    func changemap(map:Int) {
        var node:SKLabelNode? = nil
        var name:String = ""
        if(map != self.map){
            switch self.map {
            case 1:
               name = "map1"
               break
            case 2:
              name = "map2"
               break
            case 3:
               name = "map3"
               break
            default:
               break
            }
            if(!name.isEmpty){
                node = (self.childNode(withName: name) as! SKLabelNode)
                node!.fontSize -= 30
            }
            switch map {
            case 1:
               name = "map1"
               break
            case 2:
              name = "map2"
               break
            case 3:
               name = "map3"
               break
            default:
               break
            }
            node = (self.childNode(withName: name) as! SKLabelNode)
            node!.fontSize += 30
            self.map = map
        }
        
    
    }
    
    func changePlayerType(type:Int) {
          var node:SKLabelNode? = nil
          var name:String = ""
          if(type != self.playertype){
            switch self.playertype {
            case 1:
                name = "type1"
                break
            case 2:
                name = "type2"
                break
            case 3:
                name = "type3"
                break
            case 4:
                name = "type4"
            default:
                break
            }
            if(!name.isEmpty){
                node = (self.childNode(withName: name) as! SKLabelNode)
                node!.fontSize -= 30
            }
            switch type {
            case 1:
                name = "type1"
                break
            case 2:
                name = "type2"
                break
            case 3:
                name = "type3"
                break
            case 4:
                name = "type4"
                break
            default:
                break
            }
            node = (self.childNode(withName: name) as! SKLabelNode)
            node!.fontSize += 30
            playertype = type
          }
        
    }
    func startGame() {
        let startGame = GameScene(fileNamed: "GameScene")!
        startGame.userData = NSMutableDictionary()
        startGame.userData!.setObject(difficulty, forKey: "difficulty" as NSCopying)
        startGame.userData!.setObject(map, forKey: "map" as NSCopying)
        startGame.userData!.setObject(playertype, forKey: "playerType" as NSCopying)
        print("set difficulty",difficulty)
        startGame.scaleMode = .aspectFit
        // Present the scene
        let startTrans = SKTransition.doorsOpenHorizontal(withDuration: 4)
        
        self.view?.presentScene(startGame, transition: startTrans)
    }
    
    
}
