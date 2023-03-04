import GameplayKit
import SpriteKit

class Ocean: GameObject{
    
    init(){
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        zPosition = Layer.ocean.rawValue
        horizontalSpeed = 5.0
    }
    
    override func Update() {
        Move()
        CheckBound()
    }
    
    override func CheckBound() {
        if (position.x <= -1270){
            Reset()
        }
    }
    
    override func Reset() {
        position.x = 1270
        
    }
    
    func Move(){
        position.x -= horizontalSpeed!
    }
}
