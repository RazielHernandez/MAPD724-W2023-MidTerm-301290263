//
//  GameScene.swift
//  MAPD724-W2023-MidTerm-301290263
//
//  Created by Raziel Hernandez on 2023-03-03.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    var island: Islands?
    
    override func sceneDidLoad() {

        name = "GAME"
        
        // add the first ocean to the Scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add the second ocean to the scene
        ocean2 = Ocean()
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        player = Player()
        addChild(player!)
        
        // add the island to the Scene
        island = Islands()
        addChild(island!)
        
        // Get main screen bounds
        let screenSize: CGRect = UIScreen.main.bounds

        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        print("Screen width = \(screenWidth), screen height = \(screenHeight)")
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: -340, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: -340, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: -340, y: pos.y))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        ocean1?.Update()
        ocean2?.Update()
        
        player?.Update()
        island?.Update()
    }
}
