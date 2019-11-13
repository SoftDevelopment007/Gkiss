//
//  DetailViewController.swift
//  Gkiss
//
//  Created by Pedro on 11/12/19.
//  Copyright © 2019 Gkiss. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var img_block: UIImageView!
    @IBOutlet weak var img_fav: UIImageView!
    
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

    @IBAction func onTappedBackButtonMethod(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    
    @IBAction func onTappedBlockButton(_ sender: Any) {
        if img_block.image == UIImage(named: "3_Block.png") {
            img_block.image = UIImage(named: "3_BlockSelected.png")
        } else {
            img_block.image = UIImage(named: "3_Block.png")
        }
    }
    
    @IBAction func onTappedFavButton(_ sender: Any) {
        if img_fav.image == UIImage(named: "3_Fav.png") {
            img_fav.image = UIImage(named: "3_FavSelected.png")
        } else {
            img_fav.image = UIImage(named: "3_Fav.png")
        }
    }
    
    
    
    
    
    
    
}
