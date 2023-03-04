import GameplayKit
import SpriteKit

class Cloud : GameObject{
    
    init(){
        super.init(imageString: "cloud", initialScale: 0.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func Start() {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5
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
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        let randomX: Int = (randomSource?.nextInt(upperBound: 30))! + 560
        position.x = CGFloat(randomX)
        
        let randomY: Int = (randomSource?.nextInt(upperBound: 280))! - 140
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    func Move(){
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
