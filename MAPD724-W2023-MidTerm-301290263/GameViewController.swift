//
//  GameViewController.swift
//  MAPD724-W2023-MidTerm-301290263
//
//  Created by Raziel Hernandez on 2023-03-03.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var currentScene: GKScene?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setScene(sceneName: "GameScene")
    }
    
    func setScene(sceneName: String) -> Void {
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
