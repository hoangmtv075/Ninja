//
//  Ground.swift
//  NInja
//
//  Created by Jack Ily on 13/11/2019.
//  Copyright © 2019 Jack Ily. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "ground")
        super.init(texture: texture, color: .clear, size: texture.size())
        name = "Ground"
        zPosition = -1.0
        anchorPoint = CGPoint(x: 0.0, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configurations

extension Ground {
    
    func setupGround(_ scene: SKScene) {
        for i in 0...2 {
            let ground = Ground()
            ground.position = CGPoint(x: CGFloat(i)*ground.frame.size.width, y: scene.frame.size.height/2.0)
            scene.addChild(ground)
        }
    }
    
    func moveGround(_ scene: GameScene) {
        scene.enumerateChildNodes(withName: "Ground") { (node, _) in
            let node = node as! SKSpriteNode
            node.position.x -= scene.moveSpeed
            
            if node.position.x < -scene.frame.width {
                node.position.x += scene.frame.size.width*2.0
            }
        }
    }
}
