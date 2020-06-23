//
//  building.swift
//  HumanAndNature1
//
//  Created by 缪禕天 on 2020/5/30.
//  Copyright © 2020 sky. All rights reserved.
//
import SpriteKit

class Building: SKSpriteNode {
    var type: Int
    var amount:Int
    init(type:Int,amount:Int) {
        self.type = type
        self.amount = amount
        let tree = Tree()
        let camp = Camp()
        var texture:SKTexture
        if(type==0) {texture = tree.tREE()}
        else { texture = camp.cAMP()}
        var size = texture.size()
        if(type==0) {size.width *=  2; size.height *= 2 ; }
        let color = UIColor.clear

        super.init(texture: texture, color: color, size: size)
  }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
  }
    func attacked(amount:Int) -> Bool {
        if(self.amount>amount){
            self.amount -= amount
            return false
        }
        else{
            self.amount = amount - self.amount
            if(self.type==0){
                let camp = Camp()
                self.type = 1; texture = camp.cAMP();
                self.size = texture!.size()
            }
            else {
                let tree = Tree()
                self.type = 0; texture = tree.tREE();
                self.size = texture!.size()
                size.width *=  2; size.height *= 2 
            }
            return true
        }
    }
}
class Tree {
    let TREEK_NN                               = "TREEK_NN"
    let textureAtlas = SKTextureAtlas(named: "assets")
    func tREE() -> SKTexture                               {
        return textureAtlas.textureNamed(TREEK_NN) }
}
class Camp{
    let CAMP                             = "BRKS3NNE副本"
    let textureAtlas = SKTextureAtlas(named: "assets")
     // individual texture objects
    func cAMP() -> SKTexture                             { return textureAtlas.textureNamed(CAMP) }
}
