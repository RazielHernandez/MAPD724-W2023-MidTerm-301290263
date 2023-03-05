//  MidTerm Test
//  GameViewController.swift
//  MAPD724-W2023-MidTerm-301290263
//
//  Created by Raziel Hernandez on 2023-03-03.
//  Student Number: 301290263
//
//  This is a action game (demo), the user play as a airplane pilot
//  moving the airplane (top - down) to avoid clouds while go through
//  the islands.
//
//  Touck a cloud makes the user lose lives, while fly over a island
//  give him 100 points.
//
//  Each time the player reach 1000 points (10 islands) get a extra life
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
    
    // On view did load
    // Present the start scene and set the view controller for Collision manager
    override func viewDidLoad() {
        super.viewDidLoad()
        presentStartScene()
        CollisionManager.gameViewController = self
    }
    
    // Update lives value on screen
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    // Update score value on screen
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    // Load a scene into the screen depending the sceneName param
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
    
    // Set UI and load StartScene
    func presentStartScene(){
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        PlayGameLabel.isHidden = false
        StartGameButton.isHidden = false
        GameOverLabel.isHidden = true
        RestartGameButton.isHidden = true
        setScene(sceneName: "StartScene")
    }
    
    // Set UI and load GameOver scene
    func presentEndScene(){
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        PlayGameLabel.isHidden = true
        StartGameButton.isHidden = true
        GameOverLabel.isHidden = false
        RestartGameButton.isHidden = false
        setScene(sceneName: "EndScene")
    }
    
    // When the player press startbutton
    // Set the UI and load GameScene
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
    
    // When the player press Restart button
    // Set the UI and load GameScene
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
