//: [Previous](@previous)

/*:
    Click on each star to see your respective types and infos
 
 
     Stars vary in size, temperature and brightness.
     
     Stars burn at different temperatures. In astronomy the stars are grouped into classes called spectral types.
 */

import UIKit
import PlaygroundSupport
import Foundation

let window = UIWindow(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
window.rootViewController = StarsTypesViewController()
window.makeKeyAndVisible()
//Comando para o Playground mostrar a view no LiveView
PlaygroundPage.current.liveView = window

//: [Next](@next)
