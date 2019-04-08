import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class StarBorningViewController : UIViewController {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    let button = UIButton()
    var nebulaBaseView : UIImageView!
    var background : UIImage? = UIImage(named: "Background.png")
    var nebulaBase : UIImage? = UIImage(named: "NebulaBase.png")
    var nebulaFPiece : Piece = Piece(imageName: "NebulaFPiece.png")
    var nebulaSPiece : Piece = Piece(imageName: "NebulaSPiece.png")
    var nebulaTPiece : Piece = Piece(imageName: "NebulaTPiece.png")
    var nebulaPiecesCount : Int = 0
    
    var temperatureLabel = UILabel()
    var sliderTemperature = UISlider()
    var pressureLabel = UILabel()
    var sliderPressure = UISlider()
    
    var protostarContainer = [UIView]()
    var protostarPiece1 : Piece = Piece(imageName: "ProtoStar1.png")
    var protostarPiece2 : Piece = Piece(imageName: "ProtoStar2.png")
    var protostarPiece3 : Piece = Piece(imageName: "ProtoStar3.png")
    var protostarPiece4 : Piece = Piece(imageName: "ProtoStar4.png")
    var protostarPieceA : Piece = Piece(imageName: "ProtoStarA_1.png")
    var protostarPieceB : Piece = Piece(imageName: "ProtoStarB_1.png")
    var protostarSliderTemperatureMax : Bool = false
    var protostarSliderPressureMax : Bool = false

    var nuclearFusion : Piece = Piece(imageName: "FusaoNuclear1.png")
    var timer : Timer?
    var nuclearFusionCounter : Int = 0
    var nuclearFusionSlidersCount : Int = 0
    
    var textNebula = UILabel()
    var textProtostar = UILabel()
    var textNuclearFusion = UILabel()
    
    var musica : AVAudioPlayer!
    
    override public func loadView() {
        let view = UIView()
        if let bg = background as UIImage? {
            view.backgroundColor = UIColor(patternImage: bg)
        }
        play()
        nebulaBaseView = UIImageView(image: nebulaBase)
        nebulaBaseView.frame = CGRect(x: 20, y: 20, width: nebulaBaseView.frame.width/2, height: nebulaBaseView.frame.height/2)
        view.addSubview(nebulaBaseView)
        
        nebulaFPiece.pieceImageView.frame = CGRect(x: 450, y: 20, width: nebulaFPiece.pieceImageView.frame.width/2, height: nebulaFPiece.pieceImageView.frame.height/2)
        view.addSubview(nebulaFPiece.pieceImageView)
        
        nebulaSPiece.pieceImageView.frame = CGRect(x: 550, y: screenHeight/5, width: nebulaFPiece.pieceImageView.frame.width/1.7, height: nebulaFPiece.pieceImageView.frame.height/1.7)
        view.addSubview(nebulaSPiece.pieceImageView)
        
        nebulaTPiece.pieceImageView.frame = CGRect(x: 700, y: 100, width: nebulaTPiece.pieceImageView.frame.width/2.2, height: nebulaTPiece.pieceImageView.frame.height/2.2)
        view.addSubview(nebulaTPiece.pieceImageView)
        
        textNebula.text = "Nebulas are basicaly made of dust and Hydrogen"
        textNebula.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textNebula.font = temperatureLabel.font.withSize(25)
        textNebula.frame = CGRect(x: 350, y: 150, width: 400, height: 100)
        textNebula.numberOfLines = 0
        textNebula.lineBreakMode = .byWordWrapping
        textNebula.preferredMaxLayoutWidth = 300
        textNebula.isHidden = true
        view.addSubview(textNebula)
        
        textProtostar.text = "Protostars are large clusters of hot, compact and very dense matter"
        textProtostar.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textProtostar.font = temperatureLabel.font.withSize(25)
        textProtostar.frame = CGRect(x: 30, y: 400, width: 400, height: 100)
        textProtostar.numberOfLines = 0
        textProtostar.lineBreakMode = .byWordWrapping
        textProtostar.preferredMaxLayoutWidth = 300
        textProtostar.isHidden = true
        view.addSubview(textProtostar)
        
        textNuclearFusion.text = "Hydrogen is gradually converted to helium by the nuclear fusion process"
        textNuclearFusion.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textNuclearFusion.font = temperatureLabel.font.withSize(25)
        textNuclearFusion.frame = CGRect(x: 60, y: screenHeight - 100, width: screenWidth - 30, height: 100)
        textNuclearFusion.numberOfLines = 0
        textNuclearFusion.lineBreakMode = .byWordWrapping
        textNuclearFusion.preferredMaxLayoutWidth = screenWidth - 30
        textNuclearFusion.isHidden = true
        view.addSubview(textNuclearFusion)
        
        temperatureLabel.text = "Temperature"
        temperatureLabel.frame = CGRect(x: 30, y: 350, width: 300, height: 50)
        temperatureLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        temperatureLabel.font = temperatureLabel.font.withSize(30)
        temperatureLabel.isHidden = true
        protostarContainer.append(temperatureLabel)
        view.addSubview(temperatureLabel)
        
        sliderTemperature.frame = CGRect(x: 30, y:400, width: 300, height: 50)
        
        sliderTemperature.addTarget((self), action: #selector(increaseTemperature), for: .valueChanged)
        sliderTemperature.minimumValue = 0
        sliderTemperature.maximumValue = 3
        sliderTemperature.minimumTrackTintColor = .red
        sliderTemperature.isHidden = true
        protostarContainer.append(sliderTemperature)
        view.addSubview(sliderTemperature)
        
        pressureLabel.text = "Pressure"
        pressureLabel.frame = CGRect(x: 30, y: 450, width: 300, height: 50)
        pressureLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pressureLabel.font = pressureLabel.font.withSize(30)
        pressureLabel.isHidden = true
        protostarContainer.append(pressureLabel)
        view.addSubview(pressureLabel)
        
        sliderPressure.frame = CGRect(x: 30, y:500, width: 300, height: 50)
        
        sliderPressure.addTarget((self), action: #selector(increasePressure), for: .valueChanged)
        sliderPressure.minimumValue = 0
        sliderPressure.maximumValue = 5
        sliderPressure.minimumTrackTintColor = .red
        sliderPressure.isHidden = true
        protostarContainer.append(sliderPressure)
        view.addSubview(sliderPressure)
        
        protostarPieceB.pieceImageView.frame = CGRect(x: 560, y: 480, width: protostarPieceB.pieceImageView.frame.width/2, height: protostarPieceB.pieceImageView.frame.height/2)
        protostarPieceB.pieceImageView.isHidden = true
        view.addSubview(protostarPieceB.pieceImageView)
        
        protostarPiece4.pieceImageView.frame = CGRect(x: 450, y: 400, width: protostarPiece4.pieceImageView.frame.width/2, height: protostarPiece4.pieceImageView.frame.height/2)
        protostarPiece4.pieceImageView.isHidden = true
        view.addSubview(protostarPiece4.pieceImageView)
        
        protostarPiece3.pieceImageView.frame = CGRect(x: 480, y: 430, width: protostarPiece3.pieceImageView.frame.width/2, height: protostarPiece3.pieceImageView.frame.height/2)
        protostarPiece3.pieceImageView.isHidden = true
        view.addSubview(protostarPiece3.pieceImageView)
        
        protostarPiece2.pieceImageView.frame = CGRect(x: 510, y: 443, width: protostarPiece2.pieceImageView.frame.width/2, height: protostarPiece2.pieceImageView.frame.height/2)
        protostarPiece2.pieceImageView.isHidden = true
        view.addSubview(protostarPiece2.pieceImageView)
        
        protostarPiece1.pieceImageView.frame = CGRect(x: 545, y: 465, width: protostarPiece1.pieceImageView.frame.width/2, height: protostarPiece1.pieceImageView.frame.height/2)
        protostarPiece1.pieceImageView.isHidden = true
        protostarContainer.append(protostarPiece1.pieceImageView)
        view.addSubview(protostarPiece1.pieceImageView)
        
        protostarPieceA.pieceImageView.frame = CGRect(x: 395, y: 280, width: protostarPieceA.pieceImageView.frame.width/2, height: protostarPieceA.pieceImageView.frame.height/2)
        protostarPieceA.pieceImageView.isHidden = true
        view.addSubview(protostarPieceA.pieceImageView)

        nuclearFusion.pieceImageView.frame = CGRect(x: 384 - nuclearFusion.pieceImageView.frame.width/4, y: 600, width: nuclearFusion.pieceImageView.frame.width/2, height: nuclearFusion.pieceImageView.frame.height/2)
        nuclearFusion.pieceImageView.isHidden = true
        view.addSubview(nuclearFusion.pieceImageView)
        
        //768/1024
        
        self.view = view
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if nebulaFPiece.pieceImageView.frame.contains(touches.first!.location(in: view)) && nebulaFPiece.canMove{
            nebulaFPiece.isHeld = true
        }
        if nebulaSPiece.pieceImageView.frame.contains(touches.first!.location(in: view)) && nebulaSPiece.canMove{
            nebulaSPiece.isHeld = true
        }
        if nebulaTPiece.pieceImageView.frame.contains(touches.first!.location(in: view)) && nebulaTPiece.canMove{
            nebulaTPiece.isHeld = true
        }
        if nuclearFusion.pieceImageView.frame.contains(touches.first!.location(in: view)){
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(increaseNuclearFusion), userInfo: nil, repeats: true)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if nebulaFPiece.isHeld {
            nebulaFPiece.pieceImageView.frame = CGRect(x: touches.first!.location(in: view).x - (nebulaFPiece.pieceImageView.frame.width/2), y: touches.first!.location(in: view).y - (nebulaFPiece.pieceImageView.frame.height/2), width: nebulaFPiece.pieceImageView.frame.width, height: nebulaFPiece.pieceImageView.frame.height)
        }
        if nebulaSPiece.isHeld {
            nebulaSPiece.pieceImageView.frame = CGRect(x: touches.first!.location(in: view).x - (nebulaSPiece.pieceImageView.frame.width/2), y: touches.first!.location(in: view).y - (nebulaSPiece.pieceImageView.frame.height/2), width: nebulaSPiece.pieceImageView.frame.width, height: nebulaSPiece.pieceImageView.frame.height)
        }
        if nebulaTPiece.isHeld {
            nebulaTPiece.pieceImageView.frame = CGRect(x: touches.first!.location(in: view).x - (nebulaTPiece.pieceImageView.frame.width/2), y: touches.first!.location(in: view).y - (nebulaTPiece.pieceImageView.frame.height/2), width: nebulaTPiece.pieceImageView.frame.width, height: nebulaTPiece.pieceImageView.frame.height)
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if nebulaBaseView.frame.contains(touches.first!.location(in: view)) && nebulaFPiece.isHeld{
            nebulaFPiece.pieceImageView.frame = CGRect(x: nebulaBaseView.frame.minX + 45, y: nebulaBaseView.frame.minY + 45, width: nebulaFPiece.pieceImageView.frame.width, height: nebulaFPiece.pieceImageView.frame.height)
            nebulaFPiece.canMove = false
            nebulaPiecesCount += 1
            if(nebulaPiecesCount >= 3){
                showText(textName: "nebula")
            }
        }
        nebulaFPiece.isHeld = false
        
        if nebulaBaseView.frame.contains(touches.first!.location(in: view)) && nebulaSPiece.isHeld{
            nebulaSPiece.pieceImageView.frame = CGRect(x: nebulaBaseView.frame.minX + 80, y: nebulaBaseView.frame.minY + 80, width: nebulaSPiece.pieceImageView.frame.width, height: nebulaSPiece.pieceImageView.frame.height)
            nebulaSPiece.canMove = false
            nebulaPiecesCount += 1
            if(nebulaPiecesCount >= 3){
                showText(textName: "nebula")
            }
        }
        nebulaSPiece.isHeld = false
        
        if nebulaBaseView.frame.contains(touches.first!.location(in: view)) && nebulaTPiece.isHeld{
            nebulaTPiece.pieceImageView.frame = CGRect(x: nebulaBaseView.frame.minX + 110, y: nebulaBaseView.frame.minY + 105, width: nebulaTPiece.pieceImageView.frame.width, height: nebulaTPiece.pieceImageView.frame.height)
            nebulaTPiece.canMove = false
            nebulaPiecesCount += 1
            if(nebulaPiecesCount >= 3){
                showText(textName: "nebula")
            }
        }
        nebulaTPiece.isHeld = false
        
        if nuclearFusion.pieceImageView.frame.contains(touches.first!.location(in: view)){
            timer?.invalidate()
            if(nuclearFusionCounter < 4){
                nuclearFusionCounter = 0
                nuclearFusion.pieceImageView.image = UIImage(named: "FusaoNuclear1.png")
            }
        }
    }
    
    @objc public func increaseTemperature(){
        if(sliderTemperature.value >= 1){
            protostarPiece2.pieceImageView.isHidden = false
        }else{
            protostarPiece2.pieceImageView.isHidden = true
        }
        if(sliderTemperature.value >= 2){
            protostarPiece3.pieceImageView.isHidden = false
        }else{
            protostarPiece3.pieceImageView.isHidden = true
        }
        if(sliderTemperature.value >= 3){
            protostarPiece4.pieceImageView.isHidden = false
            sliderTemperature.isEnabled = false
            protostarSliderTemperatureMax = true
        }else{
            protostarPiece4.pieceImageView.isHidden = true
        }
        if(protostarSliderTemperatureMax && protostarSliderPressureMax){
            showText(textName: "nuclearFusion")
        }
    }
    
    @objc public func increasePressure(){
        if(sliderPressure.value >= 1){
            protostarPieceA.pieceImageView.isHidden = false
            protostarPieceB.pieceImageView.isHidden = false
        }
        if(sliderPressure.value >= 2){
            protostarPieceA.pieceImageView.image = UIImage(named: "ProtoStarA_2")
            protostarPieceB.pieceImageView.image = UIImage(named: "ProtoStarB_2")
        }
        if(sliderPressure.value >= 3){
            protostarPieceA.pieceImageView.image = UIImage(named: "ProtoStarA_3")
            protostarPieceB.pieceImageView.image = UIImage(named: "ProtoStarB_3")
        }
        if(sliderPressure.value >= 4){
            protostarPieceA.pieceImageView.image = UIImage(named: "ProtoStarA_4")
            protostarPieceB.pieceImageView.image = UIImage(named: "ProtoStarB_4")
        }
        if(sliderPressure.value >= 5){
            protostarPieceA.pieceImageView.image = UIImage(named: "ProtoStarA")
            protostarPieceB.pieceImageView.image = UIImage(named: "ProtoStarB")
            sliderPressure.isEnabled = false
            protostarSliderPressureMax = true
        }
        
        if(protostarSliderTemperatureMax && protostarSliderPressureMax){
            showText(textName: "nuclearFusion")
        }
    }
    
    @objc public func increaseNuclearFusion(){
        nuclearFusionCounter += 1
        if(nuclearFusionCounter == 1){
            nuclearFusion.pieceImageView.image = UIImage(named: "FusaoNuclear2.png")
        }else if(nuclearFusionCounter == 2){
            nuclearFusion.pieceImageView.image = UIImage(named: "FusaoNuclear3.png")
        }else if(nuclearFusionCounter == 3){
            nuclearFusion.pieceImageView.image = UIImage(named: "FusaoNuclear4.png")
        }else if(nuclearFusionCounter == 4){
            nuclearFusion.pieceImageView.image = UIImage(named: "FusaoNuclear5.png")
            textNuclearFusion.isHidden = false
        }else{
            
        }
    }
    
    public func showText(textName: String){
        switch textName {
        case "nebula":
            textNebula.isHidden = false
            for t in protostarContainer{
                t.isHidden = false
            }
        case "nuclearFusion":
            temperatureLabel.isHidden = true
            pressureLabel.isHidden = true
            sliderPressure.isHidden = true
            sliderTemperature.isHidden = true
            textProtostar.isHidden = false
            nuclearFusion.pieceImageView.isHidden = false
        default:
            print("ERROR_NEXT_TEXT")
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
