//
//  SignUpVC.swift
//  DermaCare
//
//  Created by MacBook Pro on 19/10/2024.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        topNameOfNavigationController(title: "Sign Up", fontSize: 25)
        // Do any additional setup after loading the view.
    }
    
    class func SignUpVC()-> SignUpVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
    }
    //   MARK:  Functions
    
    
    //   MARK:  Button Actions
    
}
