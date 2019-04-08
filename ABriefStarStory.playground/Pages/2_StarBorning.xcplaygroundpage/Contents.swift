//: [Previous](@previous)

/*:
        1 - Mount the Nebula with it peaces
 
        2 - Increase the temperature and pressure to create a Protostar
 
        3 - Click and hold the white circle to create a Nuclear Fusion

 
     Press the star to begin
 
 
     Nebulas are huge gas clouds made by dust and gas found in the whole Universe and ate made basically of Hydrogen. Some nebulas was stars that already concluded your life cycle.
 
     Sometimes there may be regions with a higher concentration of these gases. In these regions the gravitational force is greater, which results in the increase of temperature and pressure.
 
     As the pressure and temperature increase as a result of the gravitational force, the nebula contracts until it forms a hot, dense nucleus called the Protostar.
 
     The Protostar begins to implode and increase the temperature and the pressure even more from the beginning to the process of nuclear fusion. As Hydrogen begins to melt and form Helium, this process produces a giant amount of energy. From this protostar a star is formed!
*/

import UIKit
import PlaygroundSupport
import Foundation

let window = UIWindow(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
window.rootViewController = StarBorningViewController()
window.makeKeyAndVisible()
//Comando para o Playground mostrar a view no LiveView
PlaygroundPage.current.liveView = window 

//: [Next](@next)
