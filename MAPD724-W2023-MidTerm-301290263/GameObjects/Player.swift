import GameplayKit
import SpriteKit

//
//  Player (GameObject)
//  Manage the island behaviour, movement and collision detection
//
class Player : GameObject{
    
    // Init the game object, set the asset and the scale
    init(){
        super.init(imageString: "plane", initialScale: 1.0)
        zRotation = -Double.pi / 2
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // At the start set the layer in Z and reset to start position
    override func Start() {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    // Every frame checkbounds
    override func Update() {
        CheckBound()
    }
    
    // Check the bounds to limit the movement in Y or/and X
    override func CheckBound() {
        //down boundary
        if (position.y <= -140){
            position.y = -140
        }
        
        //top boundary
        
        if (position.y >= 140){
            position.y = 140
        }
        
    }
    
    // Reset the position
    override func Reset() {
        position.x = -340
    }
    
    // Apply movement when the player touch the screen
    func TouchMove(newPos: CGPoint){
        
        position = newPos
    }
}
