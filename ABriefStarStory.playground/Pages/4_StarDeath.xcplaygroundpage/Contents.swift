//: [Previous](@previous)

/*:
    Click on the star to increase it size and create a Red Gigante star
 
    The next step is a Supernova II and a neutron star at the end
 
    Thank you!
 
    All assets were created by Edgar Sgroi (Me)

     During the lifetime of a star, as the hydrogen in the nucleus ends, the star begins to use helium as fuel and swell, becoming Red Giants.
 
     The stars die in several ways, one of the most spectacular is the Supernova. It occurs when a star no longer has the fuel to keep nuclear fusion at its core. It suffers a sudden collapse due to the force of gravity and incredible temperatures are generated in a big explosion that reach 100 billion ºC!
 
     After a Supernova, the star's nucleus can become a Neutron Star, which is one of the densest bodies in the universe. An amount equivalent to one teaspoon of neutron star can weigh more than 1 million tons.
    Thanks for playing!
 */
import UIKit
import PlaygroundSupport
import Foundation

let window = UIWindow(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
window.rootViewController = StarDeathViewController()
window.makeKeyAndVisible()
//Comando para o Playground mostrar a view no LiveView
PlaygroundPage.current.liveView = window
