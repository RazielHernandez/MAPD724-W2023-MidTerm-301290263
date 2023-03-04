import GameplayKit
import SpriteKit

class Islands : GameObject{
    
    
    init(){
        super.init(imageString: "island", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        zPosition = Layer.island.rawValue
        horizontalSpeed = 5.0
        Reset()
    }
    
    override func Update() {
        Move()
        CheckBound()
    }
    
    override func CheckBound() {
        if (position.x <= -560){
            Reset()
        }
        
    }
    
    override func Reset() {
        position.x = 560
        let randomY: Int = (randomSource?.nextInt(upperBound: 280))! - 140
        position.y = CGFloat(randomY)
        isColliding = false
    }
    
    func Move(){
        position.x -= horizontalSpeed!
    }
}
