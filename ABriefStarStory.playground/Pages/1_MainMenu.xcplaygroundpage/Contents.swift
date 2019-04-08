/*:
 This code is meant to be used in resolution 1024 x 768. So for a optimal performace please use those settings

*/

import UIKit
import PlaygroundSupport
import Foundation

public var screenWidth = UIScreen.main.bounds.width
public var screenHeight = UIScreen.main.bounds.height

let window = UIWindow(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
window.rootViewController = MainMenuViewController()
//This is a convenience method to show the current window and position it in front of all other windows at the same level or lower.
window.makeKeyAndVisible()
PlaygroundPage.current.liveView = window
//: [Next](@next)
