import GameplayKit
import SpriteKit

//
//  Island (GameObject)
//  Manage the island behaviour, movement and collision detection
//

class Islands : GameObject{
    
    // Init the game object, set the asset and the scale
    init(){
        super.init(imageString: "island", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // At the start set the layer in Z, reset to start position and set horizontal speed
    override func Start() {
        zPosition = Layer.island.rawValue
        horizontalSpeed = 5.0
        Reset()
    }
    
    // Every frame set the move and checkbounds
    override func Update() {
        Move()
        CheckBound()
    }
    
    // Reset the position if is out of bounds
    override func CheckBound() {
        if (position.x <= -560){
            Reset()
        }
        
    }
    
    // Reset the position
    override func Reset() {
        position.x = 560
        let randomY: Int = (randomSource?.nextInt(upperBound: 280))! - 140
        position.y = CGFloat(randomY)
        isColliding = false
    }
    
    // Move the game object
    func Move(){
        position.x -= horizontalSpeed!
    }
}
