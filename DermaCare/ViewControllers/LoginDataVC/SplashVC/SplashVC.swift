//
//  SplashVC.swift
//  DermaCare
//
//  Created by MacBook Pro on 19/10/2024.
//

import UIKit

class SplashVC: UIViewController {

    
    class func SplashVC()-> SplashVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Splash")
        userDefaults.set(true, forKey: strLoginData)
        checkIfAlreadySignIn()
    }
    func checkIfAlreadySignIn(){
        DispatchQueue.main.async {
            if isFoundUserLoginData(){
                print("HomeFrom Splash")
                let vc = HomeVC.HomeVC()
                let nav = UINavigationController(rootViewController: vc)
                nav.isNavigationBarHidden = true
                self.view.window?.rootViewController = nav

            }else{
                print("Login From Splash")
                let vc = LogInVC.LogInVC()
                let nav = UINavigationController(rootViewController: vc)
                nav.isNavigationBarHidden = true
                self.view.window?.rootViewController = nav
            }
        }
    }
}
