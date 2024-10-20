//
//  HomeVC.swift
//  DermaCare
//
//  Created by MacBook Pro on 19/10/2024.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home")
        topNameOfNavigationController(title: "Home", color: .init(named: "LightColor")!, fontSize: 25, fontWeight: .medium)
        // Do any additional setup after loading the view.
    }
    class func HomeVC()-> HomeVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    }
    
    @IBAction func btnPressedFrom(_ sender : Any){
        let vc = SignUpVC.SignUpVC()
        changeTextStringOnNavigationItem(text: "Sign Up")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
