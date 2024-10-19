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
        
    }
    
//   MARK: Class Function
    class func ForgetVC()-> ForgetVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgetVC") as! ForgetVC
    }
    
}
