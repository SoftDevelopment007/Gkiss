//
//  GkissViewController.swift
//  Gkiss
//
//  Created by Pedro on 11/10/19.
//  Copyright © 2019 Gkiss. All rights reserved.
//

import UIKit

class UserCVCell: UICollectionViewCell {
    
    @IBOutlet weak var view_Round: UIView!
    @IBOutlet weak var img_avatar: UIImageView!
    
    @IBOutlet weak var lbl_username: UILabel!
    @IBOutlet weak var img_OnlineStatus: UIImageView!
    
    @IBOutlet weak var btn_action: UIButton!
}


class GkissViewController: UIViewController {
    
    @IBOutlet weak var Fresh_CollectionView: UICollectionView!
    @IBOutlet weak var Match_CollectionView: UICollectionView!
    @IBOutlet weak var Nearby_CollectionView: UICollectionView!
    
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
        //img_profile.layer.cornerRadius = img_profile.bounds.size.height / 2.0
    }
    
    @IBAction func onTappedProfileButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InviteViewController") as? InviteViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func actionAddUser(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InviteViewController") as? InviteViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func actionFilter(_ sender: Any) {
        
    }
    
}

extension GkissViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCVCell", for: indexPath) as? UserCVCell
            else { fatalError("unexpected cell in collection view") }
        
        
        //cell.view_Round.layer.borderColor = UIColor.darkGray.cgColor
        //cell.view_Round.layer.borderWidth = 1
        
        if collectionView == Fresh_CollectionView {
            cell.view_Round.layer.cornerRadius = 6.0
        }
        else if collectionView == Match_CollectionView {
            cell.view_Round.layer.cornerRadius = 6.0
        } else {
            cell.view_Round.layer.cornerRadius = 6.0
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1001:
            return CGSize(width: collectionView.frame.size.height * 8 / 10, height: collectionView.frame.size.height)
        case 1002:
            return CGSize(width: collectionView.frame.size.height * 115 / 175, height: collectionView.frame.size.height)
        case 1003:
            
            let ScreenSize = UIScreen.main.bounds
            let ScreenWidth = ScreenSize.width
            let newCellWidth = 105 * ScreenWidth / 375
            let newCellHeight = 130 * ScreenWidth / 375
            return CGSize(width: newCellWidth, height: newCellHeight)
        default:
            return CGSize.zero
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        let ScreenSize = UIScreen.main.bounds
        let ScreenWidth = ScreenSize.width
        return 10 * ScreenWidth / 375 - 1;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        let ScreenSize = UIScreen.main.bounds
        let ScreenWidth = ScreenSize.width
        return 10 * ScreenWidth / 375 - 1;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
}

