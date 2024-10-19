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
        // Do any additional setup after loading the view.
    }
    class func HomeVC()-> HomeVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    }
    
    @IBAction func btnPressedFrom(_ sender : Any){
        let vc = ForgetVC.ForgetVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
