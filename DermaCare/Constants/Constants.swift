//
//  Constants.swift
//  DermaCare
//
//  Created by MacBook Pro on 19/10/2024.
//

import Foundation
import UIKit

let strLoginData = "strLoginData"
var hudContainer = UIView(frame: CGRect(x:0, y:0, width: 50, height: 50))
let userDefaults:UserDefaults = UserDefaults.standard
let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate




//MARK: Functions

func isFoundUserLoginData()->Bool{
    if userDefaults.bool(forKey: strLoginData) == true {
        print("life time Pro User")
        return true
    }
    return false
}
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
func showLoader(controller:UIViewController){
    for v in hudContainer.subviews{
       v.removeFromSuperview()
    }
    hudContainer.frame = controller.view.frame
    hudContainer.backgroundColor = hexStringToUIColor(hex: "FFFFFF").withAlphaComponent(0.5)
    hudContainer.isUserInteractionEnabled = true
    let animationView = LottieAnimationView()
    let animation = LottieAnimation.named("lottieLoder", animationCache: DefaultAnimationCache.sharedCache)
    animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100) //hudContainer.bounds
    animationView.center = hudContainer.center
    animationView.contentMode = .scaleAspectFit
    animationView.animation = animation
    animationView.loopMode = .loop
    animationView.animationSpeed = 1.0
    animationView.play()
    
    hudContainer.addSubview(animationView)
    controller.view.addSubview(hudContainer)
    controller.view.bringSubviewToFront(hudContainer)
}

func hideLoader(){
    hudContainer.removeFromSuperview()
}

extension UIViewController {
    func changeTextStringOnNavigationItem(text: String) {
        let backButton = UIBarButtonItem()
        backButton.title = text  // Your custom title here
        navigationItem.backBarButtonItem = backButton
    }
    func topNameOfNavigationController(title : String, color : UIColor = .systemBlue,fontSize : CGFloat = 20 , fontWeight : UIFont.Weight = .regular){
        self.navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: color,
            .font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        ]
    }
}
