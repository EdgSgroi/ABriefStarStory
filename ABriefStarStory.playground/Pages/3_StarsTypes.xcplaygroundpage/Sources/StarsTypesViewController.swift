import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class StarsTypesViewController : UIViewController{
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    var background : UIImage? = UIImage(named: "Background.png")
    
    var starTO : UIImageView = UIImageView(image: UIImage(named: "StarTO.png"))
    var starTG : UIImageView = UIImageView(image: UIImage(named: "StarTG.png"))
    var starTM : UIImageView = UIImageView(image: UIImage(named: "StarTM.png"))
    
    var textStarTO = UILabel()
    var textStarTG = UILabel()
    var textStarTM = UILabel()
    
    var musica : AVAudioPlayer!
    
    override public func loadView(){
        let view = UIView()
        play()
        if let bg = background as UIImage? {
            view.backgroundColor = UIColor(patternImage: bg)
        }
        
        starTO.frame = CGRect(x: screenWidth/2 - 10, y: 5, width: starTO.frame.width/2, height: starTO.frame.height/2)
        view.addSubview(starTO)
        
        textStarTO.text = "Type O: the hottest star type, with temperatures of more than 33,000°C on the surface"
        textStarTO.textColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        textStarTO.font = textStarTO.font.withSize(25)
        textStarTO.frame = CGRect(x: 30, y: 90, width: 400, height: 100)
        textStarTO.numberOfLines = 0
        textStarTO.lineBreakMode = .byWordWrapping
        textStarTO.preferredMaxLayoutWidth = 400
        textStarTO.isHidden = true
        view.addSubview(textStarTO)
        
        starTG.frame = CGRect(x: screenWidth - 600, y: (screenHeight/2) - (starTG.frame.height/2), width: starTG.frame.width/2, height: starTG.frame.height/2)
        view.addSubview(starTG)
        
        textStarTG.text = "Type G: the star type of our Sun, with temperatures between 5,500ºC and 6,000ºC"
        textStarTG.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        textStarTG.font = textStarTG.font.withSize(25)
        textStarTG.frame = CGRect(x: screenWidth - 450, y: (screenHeight/2) - 100, width: 400, height: 100)
        textStarTG.numberOfLines = 0
        textStarTG.lineBreakMode = .byWordWrapping
        textStarTG.preferredMaxLayoutWidth = 400
        textStarTG.isHidden = true
        view.addSubview(textStarTG)
        
        starTM.frame = CGRect(x: (screenWidth/2) - (starTM.frame.width/4), y: screenHeight - starTM.frame.height/2, width: starTM.frame.width/2, height: starTM.frame.height/2)
        view.addSubview(starTM)
        
        textStarTM.text = "Type M: the most common star type and with lowest temperatures, between 2,600ºC and 3,850ºC"
        textStarTM.textColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        textStarTM.font = textStarTM.font.withSize(25)
        textStarTM.frame = CGRect(x: 30, y: screenHeight - 400, width: screenWidth - 30, height: 100)
        textStarTM.numberOfLines = 0
        textStarTM.lineBreakMode = .byWordWrapping
        textStarTM.preferredMaxLayoutWidth = screenWidth - 30
        textStarTM.isHidden = true
        view.addSubview(textStarTM)
        
        self.view = view
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if starTO.frame.contains(touches.first!.location(in: view)){
            showDescription(starDescription: "starTO")
        }
        if starTG.frame.contains(touches.first!.location(in: view)){
            showDescription(starDescription: "starTG")
        }
        if starTM.frame.contains(touches.first!.location(in: view)){
            showDescription(starDescription: "starTM")
        }
    }
    
    public func showDescription(starDescription : String){
        switch starDescription {
        case "starTO":
            textStarTO.alpha = 0
            textStarTO.isHidden = false
            UIView.animate(withDuration: 2) {
                self.textStarTO.alpha = 1
            }
        case "starTG":
            textStarTG.alpha = 0
            textStarTG.isHidden = false
            UIView.animate(withDuration: 2) {
                self.textStarTG.alpha = 1
            }
        case "starTM":
            textStarTM.alpha = 0
            textStarTM.isHidden = false
            UIView.animate(withDuration: 2) {
                self.textStarTM.alpha = 1
            }
        default:
            print("ERROR_STAR_DESCRIPTION")
        }
    }
    
    @objc public func play(){
        let path = Bundle.main.path(forResource: "AudioUm.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            musica = try AVAudioPlayer(contentsOf: url)
            musica?.play()
        }catch{
            print("avplayer error")
        }
    }
}
