//
//  MessagesViewController.swift
//  Gkiss
//
//  Created by Pedro on 11/10/19.
//  Copyright © 2019 Gkiss. All rights reserved.
//

import UIKit
//import APAddressBook
import SVProgressHUD
import Kingfisher

//import Firebase
//import FirebaseAuth

class Messages_TableCell: UITableViewCell {
    
    @IBOutlet weak var img_avatar: UIImageView!
    @IBOutlet weak var btn_avatar: UIButton!
    
    @IBOutlet weak var lbl_username: UILabel!
    
    @IBOutlet weak var lbl_ago: UILabel!
    
    @IBOutlet weak var view_text_message: UIView!
    @IBOutlet weak var lbl_message: UILabel!
    
    @IBOutlet weak var view_data_message: UIView!
    
}


class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var img_profile: UIImageView!
    @IBOutlet weak var tbl_MessagesTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.setupViews()
        
        tbl_MessagesTable.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupViews() {
        img_profile.layer.cornerRadius = img_profile.bounds.size.height / 2.0
        
        
    }
    
    @IBAction func onTappedProfileButton(_ sender: Any) {
        
    }
    
    @IBAction func onTappedFilterButton(_ sender: Any) {
        
    }
    
    //================================================================================
    //
    // table delegate
    //
    //================================================================================
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6 //g_Favorites_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Messages_TableCell") as? Messages_TableCell
        
        self.tbl_MessagesTable.rowHeight = 90
        cell?.img_avatar.layer.cornerRadius = (cell?.img_avatar.bounds.size.height)! / 2.0
        
        /*if g_Favorites_Array[indexPath.row].avatar == "" {
         cell!.img_avatar.image = UIImage(named: "profile_none.png")
         } else {
         cell!.img_avatar.kf.indicatorType = .activity
         (cell!.img_avatar.kf.indicator?.view as? UIActivityIndicatorView)?.color = .gray
         var link = URL.init(string: g_Favorites_Array[indexPath.row].avatar)
         KingfisherManager.shared.retrieveImage(with: link!, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
         if image == nil {
         cell!.img_avatar.image = UIImage(named: "profile_none.png")
         } else {
         cell!.img_avatar.image = image
         }
         })
         }*/
        
        cell?.view_text_message.isHidden = false
        cell?.view_data_message.isHidden = true
        
        cell?.img_avatar.image = UIImage(named: "15_profile_avatar.png")
        cell?.lbl_username.text = "Simon" //g_Favorites_Array[indexPath.row].username
        cell?.lbl_ago.text = "23h ago" //g_Favorites_Array[indexPath.row].distance
        
        cell?.btn_avatar.tag = indexPath.row
        cell?.btn_avatar.addTarget(self, action: #selector(GoOtherProfile), for: .touchUpInside)
        return cell!
    }
    
    @objc func GoOtherProfile(sd:UIButton)  {
        let index = (sd as! UIButton).tag
        
    }
}
