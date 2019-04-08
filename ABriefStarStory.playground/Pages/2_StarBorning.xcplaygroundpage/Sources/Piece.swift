import Foundation
import PlaygroundSupport
import UIKit

public class Piece{
    
    var pieceImage: UIImage?
    var pieceImageView : UIImageView
    var isHeld : Bool!
    var canMove : Bool = true
    
    public init(imageName: String) {
        if let safe = UIImage(named: imageName) as UIImage?{
            self.pieceImage = safe
            self.pieceImageView = UIImageView(image: pieceImage)
        }else{
            self.pieceImage = nil
            self.pieceImageView = UIImageView(image: pieceImage)
        }
        self.isHeld = false
    }

    
    
}
