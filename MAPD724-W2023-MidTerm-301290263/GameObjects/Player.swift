import GameplayKit
import SpriteKit

class Player : GameObject{
    
    init(){
        super.init(imageString: "plane", initialScale: 1.0)
        zRotation = -Double.pi / 2
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update() {
        //Move()
        CheckBound()
    }
    
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
    
    override func Reset() {
        position.x = -340
    }
    
    func TouchMove(newPos: CGPoint){
        
        position = newPos
    }
}
