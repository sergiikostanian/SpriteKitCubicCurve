//
//  GameScene.swift
//  CubicCurveDemo
//
//  Created by Serhii Kostanian on 28.06.2021.
//

import SpriteKit

class GameScene: SKScene {
    
    private var rect = SKShapeNode(circleOfRadius: 100)

    override func didMove(to view: SKView) {
        rect.fillColor = .systemYellow
        rect.strokeColor = .systemOrange
        rect.lineWidth = 8
        rect.position.y = 400.0
        addChild(rect)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !rect.hasActions() else { return }

        if rect.position.y > 0 {
            let moveDown = SKAction.moveY(from: rect.position.y,
                                          to: -400.0,
                                          timing: TimingFunction(0.8, 1.2, 0.2, -0.2, duration: 1.5))
            rect.run(moveDown)
        } else {
            let moveUp = SKAction.moveY(from: rect.position.y,
                                        to: 400.0,
                                        timing: TimingFunction(0.0, 1.3, 1.0, -0.3, duration: 1.5))
            rect.run(moveUp)
        }
    }
}
