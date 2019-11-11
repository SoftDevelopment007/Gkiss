//
//  MainTabBarViewController.swift
//  EmijiChat
//
//  Created by LEE on 6/20/17.
//  Copyright © 2017 Meapp90. All rights reserved.
//

import UIKit
import SimpleTabBarController

class MainTabBarViewController: SimpleTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        selectTab(index: 1)
        self.tabBar.barTintColor = UIColor(red: 17.0/255.0, green: 17.0/255.0, blue: 17.0/255.0, alpha: 1.0)
        self.tabBar.backgroundColor = UIColor(red: 17.0/255.0, green: 17.0/255.0, blue: 17.0/255.0, alpha: 1.0)
        
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)

        self.tabBar.items![2].badgeValue = "2"
        //SimpleTabBarBadge.value(forKey: "1")
        
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = UIColor(red: 255.0/255.0, green: 141.0/255.0, blue: 61.0/255.0, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func selectTab(index: Int) {
        self.selectedIndex = index
    }
    
}
