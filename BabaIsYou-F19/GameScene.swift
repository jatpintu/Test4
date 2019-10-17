//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var baba:SKSpriteNode!
    let baba_Speed:CGFloat = 15

    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        self.baba = self.childNode(withName: "baba") as! SKSpriteNode
        self.enumerateChildNodes(withName: "flag") {
                   (node, stop) in        }

        
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
       let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
        
   
        if (nodeA!.name == "baba" && nodeB!.name == "flag") {
            if let scene = SKScene(fileNamed: "winScreen") {
                print("code is working")
                self.view?.presentScene(scene, transition: SKTransition.flipVertical(withDuration: 1.5))
            }
            
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let mouseTouch = touches.first
        if (mouseTouch == nil) {
            return
        }
        let location = mouseTouch!.location(in: self)
        let nodeTouched = atPoint(location).name
      
        if (nodeTouched == "up") {
            self.baba.position.y = self.baba.position.y + baba_Speed
        }
        else if (nodeTouched == "down") {
             self.baba.position.y = self.baba.position.y - baba_Speed
        }
        else if (nodeTouched == "left") {
             self.baba.position.x = self.baba.position.x - baba_Speed
        }
        else if (nodeTouched == "right") {
             self.baba.position.x = self.baba.position.x + baba_Speed
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
