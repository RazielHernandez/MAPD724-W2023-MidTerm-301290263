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
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var PlayGameLabel: UILabel!
    @IBOutlet weak var GameOverLabel: UILabel!
    
    @IBOutlet weak var StartGameButton: UIButton!
    @IBOutlet weak var RestartGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentStartScene()
        
        
        CollisionManager.gameViewController = self
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
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
    
    func presentStartScene(){
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        PlayGameLabel.isHidden = false
        StartGameButton.isHidden = false
        GameOverLabel.isHidden = true
        RestartGameButton.isHidden = true
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene(){
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        PlayGameLabel.isHidden = true
        StartGameButton.isHidden = true
        GameOverLabel.isHidden = false
        RestartGameButton.isHidden = false
        setScene(sceneName: "EndScene")
    }
    
    
    @IBAction func StartButton_Pressed(_ sender: UIButton) {
        LivesLabel.isHidden = false
        ScoreLabel.isHidden = false
        PlayGameLabel.isHidden = true
        StartGameButton.isHidden = true
        GameOverLabel.isHidden = true
        RestartGameButton.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton) {
        RestartGameButton.isHidden = true
        LivesLabel.isHidden = false
        ScoreLabel.isHidden = false
        GameOverLabel.isHidden = true
        
        setScene(sceneName: "GameScene")
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
