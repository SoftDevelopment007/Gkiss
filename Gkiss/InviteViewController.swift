//
//  InviteViewController.swift
//  Voyaga
//
//  Created by Pedro on 11/3/19.
//  Copyright © 2019 Voyaga. All rights reserved.
//

import UIKit
import APAddressBook
import SVProgressHUD
import MessageUI
import Kingfisher


class InviteTableCell: UITableViewCell {

    
    @IBOutlet weak var view_avatar: UIView!
    @IBOutlet weak var img_avatar: UIImageView!
    
    //from Mobile
    
    @IBOutlet weak var btn_invite: UIButton!
    @IBOutlet weak var lbl_username: UILabel!
    @IBOutlet weak var lbl_phone: UILabel!
}


class InviteViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate {
    
    
    
    @IBOutlet weak var view_RoundSeach: UIView!
    @IBOutlet weak var txt_Search: UITextField!
    @IBOutlet weak var btn_search: UIButton!
    @IBOutlet weak var btn_cancel: UIButton!
    
    
    @IBOutlet weak var tbl_InviteTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        view_RoundSeach.layer.cornerRadius = 8.0
        view_RoundSeach.layer.borderColor = UIColor.lightGray.cgColor
        view_RoundSeach.layer.borderWidth = 1
        
        txt_Search.delegate = self
        btn_cancel.isHidden = true
        
        
        SVProgressHUD.show()
        loadingContactList(completion: { result in
            if result == true {
                print("true")
                SVProgressHUD.dismiss()
                self.filter(Key: "")
            }
        })
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func onTappedBackButtonMethod(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func onTappedCancelButtonMethod(_ sender: Any) {
        txt_Search.text = ""
        btn_cancel.isHidden = true
        
        self.filtered.removeAll()
        filtered = g_InviteData_Array
        self.tbl_InviteTable.reloadData()
    }
    
    // MARK : SearchBar Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let nsString = textField.text as NSString?
        let newString = nsString?.replacingCharacters(in: range, with: string)
        print("newString : \(newString!)")
        btn_cancel.isHidden = newString?.isEmpty == true
        print("btncancel ishidden : \(btn_cancel.isHidden)")
        
        if newString == "" {
            self.filtered.removeAll()
            self.filtered = g_InviteData_Array
            self.tbl_InviteTable.reloadData()
            
        } else {
            self.filtered.removeAll()
            for i in 0 ... g_InviteData_Array.count - 1 {
                if g_InviteData_Array[i].name.lowercased().range(of: (newString!.lowercased())) != nil  {
                    filtered.append(g_InviteData_Array[i])
                }
            }
            self.tbl_InviteTable.reloadData()
        }
        
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if textField.text == "" {
            self.filtered.removeAll()
            self.filtered = g_InviteData_Array
            self.tbl_InviteTable.reloadData()
            
        } else {
            self.filtered.removeAll()
            for i in 0 ... g_InviteData_Array.count - 1 {
                if g_InviteData_Array[i].name.lowercased().range(of: (textField.text!.lowercased())) != nil  {
                    filtered.append(g_InviteData_Array[i])
                }
            }
            self.tbl_InviteTable.reloadData()
        }
        
        
        
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text == "" {
            self.filtered.removeAll()
            self.filtered = g_InviteData_Array
            self.tbl_InviteTable.reloadData()
            
        } else {
            self.filtered.removeAll()
            for i in 0 ... g_InviteData_Array.count - 1 {
                if g_InviteData_Array[i].name.lowercased().range(of: (textField.text!.lowercased())) != nil  {
                    filtered.append(g_InviteData_Array[i])
                }
            }
            self.tbl_InviteTable.reloadData()
        }
    }
    
    
    var selectedContactList : [APContact] = []
    var selectedIndexList : [Int : APContact] = [:]
    var phoneLblList : [String] = []
    var contactList : [APContact] = []
    var allContactList : [APContact] = []
    
    var dictPhoneContName : [String : String] = [:]
    var dictAvatarContName : [String : UIImage] = [:]
    var phoneList : [String] = []
    
    
    func loadingContactList(completion: @escaping (Bool) -> Void) {
        
        g_InviteData_Contact_Array.removeAll()
        
        let addressBook = APAddressBook()
        addressBook.fieldsMask = .all
        
        self.selectedIndexList.removeAll()
        self.contactList.removeAll()
        self.phoneLblList.removeAll()
        
        if self.allContactList.count == 0 {
            addressBook.loadContacts(
                { (contacts: [APContact]?, error: Error?) in
                    
                    self.allContactList.append(contentsOf: (contacts?.sorted(by: { (a, b) -> Bool in
                        return (a.name?.compositeName ?? "") < (b.name?.compositeName ?? "")
                    })) ?? [])
                    
                    for contact in contacts! {
                        var  first = ""
                        var  last = ""
                        var  composite = ""
                        
                        if contact.name != nil {
                            first = contact.name?.firstName ?? ""
                            last = contact.name?.lastName ?? ""
                            composite = contact.name?.compositeName ?? ""
                        }
                        var contname = ""
                        if composite.isEmpty == false {  contname = composite
                        } else if first.isEmpty == false || last.isEmpty == false{ contname = "\(first) \(last)"
                        } else { contname = "" }
                        
                        if let phones = contact.phones {
                            if phones.count > 0 {
                                for phone in phones{
                                    if phone.number?.isEmpty == true { continue }
                                    //print("original label \(String(describing: phone.originalLabel))")
                                    //print("localizedLabel label \(String(describing: phone.localizedLabel))")
                                    //print("number label \(String(describing: phone.number))")
                                    var numberE164 = (phone.number)!
                                    print("old : \(numberE164)")
                                    //numberE164 = Global.getPhoneNumberE164(number: numberE164)
                                    print("converted : \(numberE164)")
                                    //ParseUtil.phoneContactNameDict[numberE164] = contname
                                    self.dictPhoneContName[numberE164] = contname
                                    self.phoneList.append(numberE164)
                                    if contact.thumbnail != nil {
                                        self.dictAvatarContName[numberE164] = contact.thumbnail
                                    }
                                    break
                                }
                            }
                        }
                    }
                    
                    for i in 0..<self.phoneList.count {
                        
                        var temp: Invite_Data_Info = Invite_Data_Info(name: "", avatar: "", phone: "", image: UIImage(named: "profile_none.png")!)

                        temp.name = self.dictPhoneContName[self.phoneList[i]]!
                        if self.dictAvatarContName[self.phoneList[i]] != nil {
                            temp.image = self.dictAvatarContName[self.phoneList[i]]!
                        }
                        temp.phone = self.phoneList[i]
                        g_InviteData_Contact_Array.append(temp)
                    }
                    g_InviteData_Contact_Array.sort(by: { $0.name < $1.name })
                    
                    completion(true)
                    
            })
        } else {
            completion(true)
        }
        
    }
    
    
    var filtered: Array<Invite_Data_Info> = Array<Invite_Data_Info>()
    func filter(Key: String) {
        
        g_InviteData_Array.removeAll()
        self.filtered.removeAll()

        g_InviteData_Array = g_InviteData_Contact_Array
        
        if Key == "" {
            filtered = g_InviteData_Array
        } else {
            for i in 0 ... g_InviteData_Array.count - 1 {
                
                if g_InviteData_Array[i].name.lowercased().range(of: (Key.lowercased())) != nil  {
                    filtered.append(g_InviteData_Array[i])
                }
            }
        }
        
        self.tbl_InviteTable.reloadData()
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
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InviteTableCell") as? InviteTableCell
        
        self.tbl_InviteTable.rowHeight = 90
        cell?.view_avatar.layer.cornerRadius = (cell?.view_avatar.bounds.size.height)! / 2.0
        cell?.view_avatar.layer.borderColor = UIColor.lightGray.cgColor
        cell?.view_avatar.layer.borderWidth = 1
        
        cell?.btn_invite.layer.cornerRadius = (cell?.btn_invite.bounds.size.height)! / 2.0
        cell?.btn_invite.layer.borderColor = UIColor.init(red: 255.0/255.0, green: 141.0/255.0, blue: 61.0/255.0, alpha: 1.0).cgColor
        cell?.btn_invite.layer.borderWidth = 1

        if filtered[indexPath.row].image != nil {
            cell?.img_avatar.image = filtered[indexPath.row].image
        }
        
        cell?.lbl_phone.text = filtered[indexPath.row].phone
        cell?.lbl_username.text = filtered[indexPath.row].name
        
        cell?.btn_invite.tag = indexPath.row
        cell?.btn_invite.addTarget(self, action: #selector(goInvite), for: .touchUpInside)
    
        
        return cell!
    }
    
    @objc func goInvite(sd:UIButton)  {
        let index = (sd as! UIButton).tag
        let AppLink = "https://itunes.apple.com/us/app/Gkiss/"
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let userAction = UIAlertAction(title: "Invite by message", style: .default) { (action) in
            
            if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController()
                controller.body = "Hey! Try the Gkiss app. It's amazing Dating App! \(AppLink)"
                controller.recipients = [self.filtered[index].phone]
                controller.messageComposeDelegate = self
                self.present(controller, animated: true, completion: nil)
            }else{
                //UIViewController.showAlertView(title: "", message: "Your device can not open sms app.", OkBlock: {
                //})
            }
        }
        alert.addAction(userAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //show(alert, sender: nil)
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
}
