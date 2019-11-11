//
//  ViewController.swift
//  Gkiss
//
//  Created by Pedro on 11/8/19.
//  Copyright © 2019 Gkiss. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

import FBSDKCoreKit
import FBSDKLoginKit

import GoogleSignIn

import CoreLocation
import SVProgressHUD

class SignInController: UIViewController {

    @IBOutlet weak var view_email: UIView!
    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var view_password: UIView!
    @IBOutlet weak var txt_password: UITextField!
    
    @IBOutlet weak var img_eye: UIImageView!
    
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_facebook: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.setupViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func setupViews() {
        view_email.layer.cornerRadius = view_email.bounds.size.height / 2.0
        view_email.layer.borderColor = UIColor.darkGray.cgColor
        view_email.layer.borderWidth = 1
        
        view_password.layer.cornerRadius = view_password.bounds.size.height / 2.0
        view_password.layer.borderColor = UIColor.darkGray.cgColor
        view_password.layer.borderWidth = 1
        
        btn_login.layer.cornerRadius = btn_login.bounds.size.height / 2.0
        btn_facebook.layer.cornerRadius = btn_facebook.bounds.size.height / 2.0
        
        txt_email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txt_password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        txt_password.isSecureTextEntry = true
        img_eye.image = UIImage(named: "1_sign_eye_show")
        
    }

    @IBAction func onTappedEye(_ sender: Any) {
        if txt_password.isSecureTextEntry == true {
            txt_password.isSecureTextEntry = false
            img_eye.image = UIImage(named: "1_sign_eye_hide")
        } else {
            txt_password.isSecureTextEntry = true
            img_eye.image = UIImage(named: "1_sign_eye_show")
        }
    }
    
    @IBAction func onTappedSignUp(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpController") as? SignUpController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func onTappedLogin(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabBarViewController") as? MainTabBarViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

