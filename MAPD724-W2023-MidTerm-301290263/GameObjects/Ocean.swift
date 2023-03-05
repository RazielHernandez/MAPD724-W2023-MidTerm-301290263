import GameplayKit
import SpriteKit

//
//  Ocean (GameObject)
//  Manage the island behaviour, movement and collision detection
//
class Ocean: GameObject{
    
    // Init the game object, set the asset and the scale
    init(){
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // At the start set the layer in Z and set the horizontal speed
    override func Start() {
        zPosition = Layer.ocean.rawValue
        horizontalSpeed = 5.0
    }
    
    // Every frame set the move and checkbounds
    override func Update() {
        Move()
        CheckBound()
    }
    
    // Reset the position if is out of bounds
    override func CheckBound() {
        if (position.x <= -1270){
            Reset()
        }
    }
    
    // Reset the position
    override func Reset() {
        position.x = 1270
        
    }
    
    // Move the game object
    func Move(){
        position.x -= horizontalSpeed!
    }
}
