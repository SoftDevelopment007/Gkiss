//
//  FavoritesViewController.swift
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

class Favorites_TableCell: UITableViewCell {
    
    @IBOutlet weak var img_avatar: UIImageView!
    @IBOutlet weak var btn_avatar: UIButton!
    
    @IBOutlet weak var lbl_username: UILabel!
    @IBOutlet weak var lbl_status: UILabel!
    @IBOutlet weak var lbl_distance: UILabel!
    
}


class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var img_profile: UIImageView!
    
    @IBOutlet weak var tbl_FavoriteTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.setupViews()
        
        tbl_FavoriteTable.reloadData()
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorites_TableCell") as? Favorites_TableCell
        
        self.tbl_FavoriteTable.rowHeight = 90
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
        cell?.img_avatar.image = UIImage(named: "15_profile_avatar.png")
        cell?.lbl_username.text = "Simon" //g_Favorites_Array[indexPath.row].username
        cell?.lbl_distance.text = "314m away" //g_Favorites_Array[indexPath.row].distance
        cell?.lbl_status.text = "Online now" //g_Favorites_Array[indexPath.row].status
        
        
        cell?.btn_avatar.tag = indexPath.row
        cell?.btn_avatar.addTarget(self, action: #selector(GoOtherProfile), for: .touchUpInside)
        return cell!
    }
    
    @objc func GoOtherProfile(sd:UIButton)  {
        let index = (sd as! UIButton).tag

    }
}
