import GameplayKit
import SpriteKit

//
//  GameObject
//  Implements GameProtocol
//  Define the variables for all the game objects
//  The variables are used to implmenet the behaviour like movement and collision detection
//
class GameObject : SKSpriteNode, GameProtocol
{
    
    // public instance members
    var horizontalSpeed: CGFloat?
    var verticalSpeed: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    // Constructor / Initializer
    init(imageString: String, initialScale: CGFloat)
    {
        // initialize the game object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        // configuration
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isColliding = false
        name = imageString
        randomSource = GKARC4RandomSource()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    func Start()
    {
        
    }
    
    func Update()
    {
        
    }
    
    func CheckBound() {
        
    }
    
    func Reset()
    {
        
    }
}
