import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MainMenuViewController : UIViewController {
    
    var screenWidth : CGFloat = UIScreen.main.bounds.width
    var screenHeight : CGFloat = UIScreen.main.bounds.height
    
    var background : UIImage? = UIImage(named: "Background.png")
    var gameTitle : UIImage? = UIImage(named: "GameTitle.png")
    var gameTitleView : UIImageView!
    var menuObjects : UIImage? = UIImage(named: "MenuObjects")
    var starAnim : [UIImage?] = [UIImage(named: "StarAnim1"), UIImage(named: "StarAnim2"), UIImage(named: "StarAnim3"), UIImage(named: "StarAnim2")]
    var miniStars = [UIImageView]()
    var timer : Timer?
    var count : Int = 0
    var titleTimer : Timer?
    
    var musica : AVAudioPlayer!
    
    public override func loadView() {
        let view = UIView()
        if let bg = background as UIImage?{

            view.backgroundColor = UIColor(patternImage: bg)
        }
        
        gameTitleView = UIImageView(image: gameTitle)
        gameTitleView.frame = CGRect(x: (screenWidth/4) - 30, y: screenHeight/4, width: gameTitleView.frame.width/2, height: gameTitleView.frame.height/2)
        gameTitleView.alpha = 0
        view.addSubview(gameTitleView)
        
        let menuObjectsView = UIImageView(image: menuObjects)
        menuObjectsView.frame = CGRect(x: 0, y: screenHeight - (menuObjectsView.frame.height/2) + 5, width: menuObjectsView.frame.width/2, height: menuObjectsView.frame.height/2)
        view.addSubview(menuObjectsView)
        
        let starAnimView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        let starAnimView = UIImageView()
        starAnimView.animationImages = starAnim as? [UIImage]
        
        
        let playButton = UIButton(type: .custom)
        playButton.frame = CGRect(x: screenWidth/2, y: screenHeight/2 - 50, width: 50, height: 50)
        playButton.addTarget(self, action: #selector(playScene), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        playButton.addSubview(starAnimView)
        view.addSubview(playButton)
        
        starAnimView.animationDuration = 0.7
        starAnimView.adjustsImageSizeForAccessibilityContentSizeCategory = false
        starAnimView.startAnimating()
        
        miniStars.append(UIImageView(frame: CGRect(x: screenWidth/2, y: screenHeight/6, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: screenWidth/4, y: screenHeight/2, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: screenWidth/9, y: screenHeight/5, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: screenWidth/4.5, y: screenHeight/1.5, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: screenWidth/1.5, y: screenHeight/2, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: screenWidth - 100, y: 100, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: 200, y: 100, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: 100, y: screenHeight/2 - 100, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: screenWidth - 70, y: screenHeight/2 - 100, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: 400, y: screenHeight - 300, width: 30, height: 30)))
        miniStars.append(UIImageView(frame: CGRect(x: 420, y: 180, width: 30, height: 30)))
        for i in 0 ..< miniStars.count{
            miniStars[i].animationImages = starAnim as? [UIImage]
            miniStars[i].animationDuration = 0.7
            miniStars[i].isHidden = true
            view.addSubview(miniStars[i])
        }
        self.view = view
    }
    
    @objc public func playScene(){
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(showStars), userInfo: nil, repeats: true)
    }
    
    @objc public func showStars(){
        count += 1
        if(count >= miniStars.count){
            timer?.invalidate()
            UIView.animate(withDuration: 2) {
                self.gameTitleView.alpha = 1
            }
        }else{
            miniStars[count].isHidden = false
            miniStars[count].startAnimating()
        }
    }
    
    @objc public func play(){
//        var path = Boundle.main.path(ForResources: "A Brief Star Story.mp3", ofType:nil)!
        let path = Bundle.main.path(forResource: "ABriefStarStorySong.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do{
            musica = try AVAudioPlayer(contentsOf: url)
            musica?.play()
        }catch{
            print("avplayer error")
        }
    }
}
