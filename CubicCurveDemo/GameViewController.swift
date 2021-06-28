//
//  GameViewController.swift
//  CubicCurveDemo
//
//  Created by Serhii Kostanian on 28.06.2021.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: CGSize(width: view.bounds.width * UIScreen.main.scale,
                                               height: view.bounds.height * UIScreen.main.scale))
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            scene.scaleMode = .aspectFill
            scene.backgroundColor = .clear
            view.presentScene(scene)
            view.allowsTransparency = true
        }
    }
}
