//
//  SettingViewController.swift
//  Gkiss
//
//  Created by Pedro on 11/10/19.
//  Copyright © 2019 Gkiss. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var img_profile: UIImageView!
    

    
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
        img_profile.layer.cornerRadius = img_profile.bounds.size.height / 2.0        
    }
}




