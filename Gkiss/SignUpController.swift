//
//  SignUpController.swift
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

import DatePickerDialog

class SignUpController: UIViewController {
    
    @IBOutlet weak var view_email: UIView!
    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var view_nickname: UIView!
    @IBOutlet weak var txt_nickname: UITextField!
    
    @IBOutlet weak var view_dob: UIView!
    @IBOutlet weak var txt_dob: UITextField!
    
    @IBOutlet weak var view_password: UIView!
    @IBOutlet weak var txt_password: UITextField!
    @IBOutlet weak var img_eye1: UIImageView!
    
    @IBOutlet weak var view_confirmpassword: UIView!
    @IBOutlet weak var txt_confirmpassword: UITextField!
    @IBOutlet weak var img_eye2: UIImageView!
    
    @IBOutlet weak var btn_signup: UIButton!
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
        
        view_nickname.layer.cornerRadius = view_nickname.bounds.size.height / 2.0
        view_nickname.layer.borderColor = UIColor.darkGray.cgColor
        view_nickname.layer.borderWidth = 1
        
        view_dob.layer.cornerRadius = view_dob.bounds.size.height / 2.0
        view_dob.layer.borderColor = UIColor.darkGray.cgColor
        view_dob.layer.borderWidth = 1
        
        view_password.layer.cornerRadius = view_password.bounds.size.height / 2.0
        view_password.layer.borderColor = UIColor.darkGray.cgColor
        view_password.layer.borderWidth = 1
        
        view_confirmpassword.layer.cornerRadius = view_confirmpassword.bounds.size.height / 2.0
        view_confirmpassword.layer.borderColor = UIColor.darkGray.cgColor
        view_confirmpassword.layer.borderWidth = 1
        
        btn_signup.layer.cornerRadius = btn_signup.bounds.size.height / 2.0
        btn_facebook.layer.cornerRadius = btn_facebook.bounds.size.height / 2.0
        
        txt_email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txt_nickname.attributedPlaceholder = NSAttributedString(string: "Nick Name",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txt_dob.attributedPlaceholder = NSAttributedString(string: "Date of Birth",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txt_password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txt_confirmpassword.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        txt_password.isSecureTextEntry = true
        img_eye1.image = UIImage(named: "1_sign_eye_show")
        txt_confirmpassword.isSecureTextEntry = true
        img_eye2.image = UIImage(named: "1_sign_eye_show")
        
    }
    
    @IBAction func onTappedEye1(_ sender: Any) {
        if txt_password.isSecureTextEntry == true {
            txt_password.isSecureTextEntry = false
            img_eye1.image = UIImage(named: "1_sign_eye_hide")
        } else {
            txt_password.isSecureTextEntry = true
            img_eye1.image = UIImage(named: "1_sign_eye_show")
        }
    }
    
    @IBAction func onTappedEye2(_ sender: Any) {
        if txt_confirmpassword.isSecureTextEntry == true {
            txt_confirmpassword.isSecureTextEntry = false
            img_eye2.image = UIImage(named: "1_sign_eye_hide")
        } else {
            txt_confirmpassword.isSecureTextEntry = true
            img_eye2.image = UIImage(named: "1_sign_eye_show")
        }
    }
    
    @IBAction func onTappedBack(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func onTappedDob(_ sender: Any) {
        DatePickerDialog().show("Select Date of Birth", doneButtonTitle: "Select", cancelButtonTitle: "Cancel", minimumDate: nil, maximumDate: nil, datePickerMode: .date) { (date) in
            if date != nil {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd, yyyy"
                var strDate = dateFormatter.string(from: date!)
                self.txt_dob.text = strDate
            }
        }
    }
    
    @IBAction func onTappedSignUp(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabBarViewController") as? MainTabBarViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
}
