//
//  LogInVC.swift
//  DermaCare
//
//  Created by MacBook Pro on 19/10/2024.
//

import UIKit
import FirebaseAuth
import Firebase

class LogInVC: UIViewController {

    //   MARK: Outlets
    @IBOutlet weak var emailTxt : UITextField!
    @IBOutlet weak var passWordTxt : UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    //   MARK: Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Login")
        
    }
    class func LogInVC()-> LogInVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
    }
    //   MARK: Functions
    func goToHomeScreen(){
        userDefaults.set(true, forKey: strLoginData)
        let vc = HomeVC.HomeVC()
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
    
    
    //   MARK: Button Actions
    @IBAction func loginBtnPressed(_ sender : Any){
        guard let email = emailTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            DispatchQueue.main.async {[weak self] in
                guard let self else{return}
                Toast(text: "Please Input Email Address").show()
            }
            return
        }

        guard let password = passWordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines), !password.isEmpty else {
            DispatchQueue.main.async {[weak self] in
                guard let self else{return}
                Toast(text: "Please Input Password").show()
            }
            return
        }
        showLoader(controller: self)
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                Toast(text:  "Failed to login: \(error.localizedDescription)").show()
                return
            }
            switch result {
            case .none:
                print("Login failed: no result returned.")
                Toast(text:  "Login failed. Please try again.").show()
                hideLoader()
                
            case .some(let authResult):
                print("User signed in successfully. User ID: \(authResult.user.uid)")
                hideLoader()
                goToHomeScreen()
            }
        }
    }
    
    @IBAction func signUpBtnPressed(_ sender : Any){
        let vc = SignUpVC.SignUpVC()
        changeTextStringOnNavigationItem(text: "")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgetPassBtnPressed(_ sender : Any){
        let vc = ForgetVC.ForgetVC()
        changeTextStringOnNavigationItem(text: "")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
