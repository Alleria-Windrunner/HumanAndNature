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
  
    var startlocation: SKNode? = nil
    var touchright: Bool = false
    var buildingNum : Int = 0
    var mapType:Int = 0
    var playerType = 0
    var endgame:Int = 10 {
          didSet{
              if(endgame==0){
                  gameEnd(isWin: true)
              }
              else if endgame==buildingNum {
                  gameEnd(isWin: false)
              }
          }
      }
    
    override func didMove(to view: SKView) {
        playerType = self.userData?.object(forKey: "playerType") as! Int
        // Map initialize
        if((self.userData?.object(forKey: "map")) != nil){
            mapType = self.userData?.object(forKey: "map") as! Int
            switch mapType {
            case 1:
                buildingNum = 4
                break
            case 2:
                buildingNum = 6
                break
            case 3:
                buildingNum = 8
                break
            default:
                break
            }
        }
        let map = Map()
        let maparray = map.getMap(type: mapType)
        for index in 1...buildingNum {
            var building: SKSpriteNode;
            if(index <= buildingNum/2
                ){
                building = buildingNode(type: 0,amount: 50 ,x: maparray[index].x, y: maparray[index].y);
            }
            else{
                building = buildingNode(type: 1, amount: 50,x: maparray[index].x, y: maparray[index].y)
            }
            building.name = "building"
            let blood = createLabel()
            building.addChild(blood)
            self.addChild(building);
        }
        endgame = buildingNum/2
        
        //recover
        let wait = SKAction.wait(forDuration:0.5)
        let recover = SKAction.run { self.childNode(withName: "building")
            self.enumerateChildNodes(withName: "building") { (node, stop) in
                if let item = node as? Building{
                    if self.playerType == 2 && item.type == 0 && item.amount % 5 == 0 {
                        item.amount+=1                        //繁盛额外
                        print("繁盛触发")
                    }
                    if(item.amount<100){
                        item.amount+=1}
//                    print(item.name,item.amount)
                    let blood = item.childNode(withName: "blood") as! Bloodlabel
                    blood.update()
                }
            }
        }
        run(SKAction.repeatForever (SKAction.sequence([wait,recover])))
        
        //AI
        var duation :Int = 3
        if((self.userData?.object(forKey: "difficulty")) != nil){
            print("find data success")
            switch self.userData?.object(forKey: "difficulty") as! Int {
            case 1:
                duation = 9
                break
            case 2:
                duation = 5
                break
            case 3:
                duation = 1
            default:
                break
            }
        }
        print("not find")
        let waitAi = SKAction.wait(forDuration: TimeInterval(duation))
        print("duation",duation)
        let Aiaction = SKAction.run{
            self.aifightback()
        }
        run(SKAction.repeatForever (SKAction.sequence([waitAi,Aiaction])))
    }
    
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the location of the touch on the screen
        let touch = touches.first!
        let location = touch.location(in: self)

        // Check if the touch was on the Orange Tree
        if atPoint(location).name == "building" {
            let sp : Building = atPoint(location) as! Building
          // Create the orange and add it to the scene at the touch location
            if(sp.type==0){
                startlocation = sp;
                sp.xScale *= 1.25; sp.yScale*=1.25;
                touchright = true;
                
            }
//            var army = Army(type: sp.type)
//            army.position = location
//            addChild(army)
//
//          // Give the orange an impulse to make it fly!
//          let vector = CGVector(dx: 100, dy: 0)
//          army?.physicsBody?.applyImpulse(vector)
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(touchright){
            let touch = touches.first!
            let location = touch.location(in: self)
            if atPoint(location).name == "building" {
                let end :Building = atPoint(location) as! Building
                runArmy(startbuilding: startlocation as! Building, endbuilding: end)
            }
            startlocation!.xScale *= 0.8;startlocation!.yScale *= 0.8;
            startlocation = nil
            touchright = false
        }
    }
    
    
    
    func buildingNode(type:Int,amount:Int,x:CGFloat,y:CGFloat) -> SKSpriteNode {
        let building = Building(type: type,amount: amount)
        building.zPosition = -1
        building.anchorPoint=CGPoint(x:0.5,y:0.5)
        building.position = CGPoint(x: x, y: y)
        return building
    }
    
    
    func runArmy(startbuilding:Building,endbuilding:Building) {
        //create army
        let type = startbuilding.type
        let amount = startbuilding.amount/2;
        startbuilding.amount -= amount;
        let multiplierForDirection : CGFloat
        if(startbuilding.position.x<=endbuilding.position.x){
            //walk left
            multiplierForDirection = -1;
        } else {
            //walk right
            multiplierForDirection = 1;
        }
        let army = Army(type: type,amount: amount)
        army.position = startbuilding.position
        army.zPosition = 0
        army.xScale = abs(army.xScale) * multiplierForDirection //切换左右
        let blood = createLabel()
        blood.fontSize = 60
        blood.xScale *= multiplierForDirection
        army.addChild(blood)
        blood.update()
        self.addChild(army)
        //动画
        if(type==0){
            let deer = Deer()
            let runAction = SKAction.animate(with: deer.dEER_run(), timePerFrame: 0.15)
            let runForever = SKAction.repeatForever(runAction)
            army.run(runForever)                        //动画
        }
        else{
            let eagle = Eagle()
            let runAction = SKAction.animate(with: eagle.eAGLE_run(), timePerFrame: 0.15)
            let runForever = SKAction.repeatForever(runAction)
            army.run(runForever)
        }
        let xlength = abs(startbuilding.position.x - endbuilding.position.x)
        let ylength = abs(startbuilding.position.y - endbuilding.position.y)
        let length = sqrt(xlength*xlength + ylength*ylength)
        let duation:CGFloat
        if playerType == 1 && startbuilding.type == 0 {
            duation = length / 350              //轻盈额外
        }
        else { duation = length / 300 }
        print("duation",duation)
        let moveAction = SKAction.move(to: endbuilding.position, duration:TimeInterval(duation))  //move
        let doneAction = SKAction.run {      //done and hit
            if(endbuilding.type==type){
                endbuilding.amount += army.amount
            }
            else{
                let hitAmount:Int
                if self.playerType == 3 && army.type == 1 {         //稳重额外
                    hitAmount =  (Int)((Double)(army.amount)  * 0.8)
                }
                else { hitAmount = army.amount }
                if(endbuilding.attacked(amount: hitAmount)){
                    self.endgame += (startbuilding.type * 2 - 1)
                }
            }
            army.removeFromParent()
            print("doneAction Finish")
            print(self.endgame.description)
        }//finish
        let moveActionwithdone = SKAction.sequence([moveAction,doneAction])
        army.run(moveActionwithdone, withKey: "runArmy")
    }
    
    
    func createLabel() -> Bloodlabel {
        let blood = Bloodlabel()
        blood.name = "blood"
        blood.text = "0"
        blood.fontSize = 100
        blood.fontName = "VCR OSD Mono"
        blood.fontColor = UIColor.black
        blood.position = CGPoint(x: 0, y: -200 )
        blood.zPosition = 1
        return blood
    }
    
    
    func aifightback() {
        var tree_min: Int = 80
        var tree_min_node:Building? = nil
        var camp_max:Int = 0
        var camp_max_node:Building? = nil
        self.enumerateChildNodes(withName: "building") { (node , stop) in
            if let building = node as? Building {
                if building.type == 0{          //找出最小的tree
                    if(building.amount < tree_min){
                        tree_min = building.amount
                        tree_min_node = building
                    }
                }
                else{        //找出最大的camp
                    if (building.amount > camp_max){
                        camp_max = building.amount
                        camp_max_node = building
                    }
                }
            }
        }
        if((tree_min_node != nil) && (camp_max_node != nil)){
            runArmy(startbuilding: camp_max_node!, endbuilding: tree_min_node!)
        }
    }
    
    
    func gameEnd(isWin:Bool){
        self.removeAllActions()
        
        let endBar = SKLabelNode(text: "")
        if(isWin){
            endBar.text = "游戏结束，你赢了✌️"
        }
        else {
            endBar.text = "游戏结束，你输了！"
        }
        endBar.fontSize = 150
        endBar.fontColor = UIColor.black
        endBar.fontName = "Marker Felt"
        endBar.position.x = self.size.width/2
        endBar.position.y = self.size.height/2
        endBar.zPosition = 2
        self.addChild(endBar)
        let trans = SKTransition.doorsCloseVertical(withDuration: 8)
        let returnScene = StartScene(fileNamed: "StartScene")!
        returnScene.scaleMode = .aspectFit
        self.view?.presentScene(returnScene,transition: trans)
    }
}
