//
//  winScreen.swift
//  BabaIsYou-F19
//
//  Created by Ashok Dhdharia on 17/10/19.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class winScreen:SKScene {

override init(size: CGSize) {
    super.init(size: size)
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}


override func didMove(to view: SKView) {
   
    let background = SKSpriteNode(imageNamed:"winScreen")
    background.position = CGPoint(x:size.width/2, y:size.height/2)
    addChild(background)
    let message = SKLabelNode(text:"CONGRATS LEVEL COMPLETE!")
       message.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
       message.fontColor = UIColor.magenta
       message.fontSize = 50
       message.fontName = "AvenirNext-Bold"
    addChild(message)
    
}

override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    let main = GameScene(size:self.size)
    self.view?.presentScene(main)
}
}
