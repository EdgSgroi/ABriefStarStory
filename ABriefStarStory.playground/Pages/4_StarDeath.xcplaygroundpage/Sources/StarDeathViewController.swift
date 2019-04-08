import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class StarDeathViewController : UIViewController{
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    var background : UIImage? = UIImage(named: "Background.png")
    
    var redGigant : UIImageView = UIImageView(image: UIImage(named: "RedGigant1"))
    var redGigantSize : Int = 1
    var redGigantText = UILabel()
    
    var supernova : UIImageView = UIImageView(image: UIImage(named: "Supernova1.png"))
    var supernovaTimer : Timer?
    var dwarf : UIImageView = UIImageView(image: UIImage(named: "Dwarf1.png"))
    var count : Int = 1
    
    var musica : AVAudioPlayer!
    
    override public func loadView(){
        let view = UIView()
        play()
        if let bg = background as UIImage? {
            view.backgroundColor = UIColor(patternImage: bg)
        }
        
        redGigantText.text = "A star, during your life will grow..."
        redGigantText.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        redGigantText.textAlignment = NSTextAlignment.center
        redGigantText.font = redGigantText.font.withSize(15)
        redGigantText.frame = CGRect(x: 30, y: 30, width: screenWidth - 60, height: 100)
        redGigantText.numberOfLines = 0
        redGigantText.lineBreakMode = .byWordWrapping
        redGigantText.preferredMaxLayoutWidth = screenWidth - 60
        redGigantText.isHidden = false
        view.addSubview(redGigantText)
        
        redGigant.frame = CGRect(x: (screenWidth/2) - (redGigant.frame.width/4), y: (screenHeight/2) - (redGigant.frame.height/4), width: redGigant.frame.width/2, height: redGigant.frame.height/2)
        view.addSubview(redGigant)
        
        supernova.frame = CGRect(x: (screenWidth/2) - (redGigant.frame.width/2), y: (screenHeight/2) - (redGigant.frame.height/2), width: redGigant.frame.width, height: redGigant.frame.height)
        view.addSubview(supernova)
        supernova.isHidden = true
        
        dwarf.frame = CGRect(x: (screenWidth/2) - (redGigant.frame.width/2), y: (screenHeight/2) - (redGigant.frame.height/2), width: redGigant.frame.width, height: redGigant.frame.height)
        view.addSubview(dwarf)
        dwarf.isHidden = true
        
        self.view = view
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if redGigant.frame.contains(touches.first!.location(in: view)){
            increaseRedGigantSize()
        }
    }
    
    public func increaseRedGigantSize(){
        redGigantSize += 1
        switch redGigantSize {
        case 2:
            redGigant.image = UIImage(named: "RedGigant2")
            redGigantText.text = "A star, during your life will grow...grow..."
            redGigantText.textColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            redGigantText.font = redGigantText.font.withSize(20)
        case 3:
            redGigant.image = UIImage(named: "RedGigant3")
            redGigantText.text = "A star, during your life will grow...grow...grow..."
            redGigantText.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            redGigantText.font = redGigantText.font.withSize(25)
        case 4:
            redGigant.image = UIImage(named: "RedGigant4")
            redGigantText.text = "A star, during your life will grow...grow...grow...grow..."
            redGigantText.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            redGigantText.font = redGigantText.font.withSize(30)
        case 5:
            redGigant.image = UIImage(named: "RedGigant4")
            redGigantText.text = "Until it explodes!"
            redGigantText.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            redGigantText.font = redGigantText.font.withSize(40)
            redGigantText.textAlignment = NSTextAlignment.center
            supernovaNow()
        default:
//            print("ERROR_RED_GIGANT_IMAGE_NOT_FOUND")
            print("")
        }
    }
    
    public func supernovaNow(){
        redGigant.isHidden = true
        supernova.isHidden = false
        supernovaTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(supernovaAnimation), userInfo: nil, repeats: true)
    }
    
    @objc public func supernovaAnimation(){
        count += 1
        switch count {
        case 2:
            supernova.image = UIImage(named: "Supernova2.png")
        case 3:
            supernova.image = UIImage(named: "Supernova3.png")
        case 4:
            supernova.image = UIImage(named: "Supernova4.png")
        case 5:
            supernova.image = UIImage(named: "Supernova5.png")
        case 6:
            supernova.image = UIImage(named: "Supernova6.png")
        case 7:
            supernova.image = UIImage(named: "Supernova7.png")
        case 8:
            supernova.image = UIImage(named: "Supernova8.png")
        case 9:
            supernova.image = UIImage(named: "Supernova9.png")
        case 10:
            supernova.image = UIImage(named: "Supernova10.png")
        case 11:
            supernova.image = UIImage(named: "Supernova11.png")
        case 12:
            supernovaTimer?.invalidate()
            supernovaTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(dwarfAnimation), userInfo: nil, repeats: true)
            count = 1
            supernova.isHidden = true
            redGigantText.isHidden = true
            dwarf.isHidden = false
        default:
            print("ERROR_SUPERNOVA_COUNT_WRONG_NUMBER")
        }
    }
    
    @objc public func dwarfAnimation(){
        count += 1
        switch count {
        case 2:
            dwarf.image = UIImage(named: "Dwarf2.png")
        case 3:
            dwarf.image = UIImage(named: "Dwarf3.png")
        case 4:
            dwarf.image = UIImage(named: "Dwarf4.png")
        case 5:
            dwarf.image = UIImage(named: "Dwarf5.png")
        case 6:
            dwarf.image = UIImage(named: "Dwarf6.png")
        case 7:
            supernovaTimer?.invalidate()
        default:
            print("ERROR_DWARF_COUNT_WRONG_NUMBER")
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
