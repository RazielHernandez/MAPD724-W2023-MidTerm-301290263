import GameplayKit
import SpriteKit

//
//  Cloud (GameObject)
//  Manage the island behaviour, movement and collision detection
//
class Cloud : GameObject{
    
    // Init the game object, set the asset and the scale
    init(){
        super.init(imageString: "cloud", initialScale: 0.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // At the start set the layer in Z, reset to start position and set alpha to 0.5
    override func Start() {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5
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
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        let randomX: Int = (randomSource?.nextInt(upperBound: 30))! + 560
        position.x = CGFloat(randomX)
        
        let randomY: Int = (randomSource?.nextInt(upperBound: 280))! - 140
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    // Move the game object
    func Move(){
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
