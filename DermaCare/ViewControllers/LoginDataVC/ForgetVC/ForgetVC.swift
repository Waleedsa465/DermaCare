//
//  ForgetVC.swift
//  DermaCare
//
//  Created by MacBook Pro on 19/10/2024.
//

import UIKit

class ForgetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        topNameOfNavigationController(title: "Forget Password", fontSize: 25)
    }
    
//   MARK: Class Function
    class func ForgetVC()-> ForgetVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgetVC") as! ForgetVC
    }
    //   MARK:  Functions
    
    
    //   MARK:  Button Actions

}
