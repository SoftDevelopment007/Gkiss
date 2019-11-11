//
//  Global.swift
//  Amoureuse
//
//  Created by LEE on 3/30/17.
//  Copyright © 2017 LEE. All rights reserved.
//

import Foundation
import UIKit

struct Profile_Info {
    var id:          String
    var email:       String
    var username:    String
    var avatar:      String
    var status:      String
    var thumbnail:  [String]
    
    var distance:    String
}
var g_Profile: Profile_Info = Profile_Info(id: "", email: "", username: "", avatar: "", status: "", thumbnail: [], distance: "")


var g_Favorites_Array: Array<Profile_Info> = Array<Profile_Info>()


// ==============================================================================================================
import Foundation
import UIKit
import APAddressBook
import PhoneNumberKit

class Global{
    static func loadingContactList(completion : @escaping(_ contacts : [APContact]?, _ error : Error?)->Void ){
        
        
        let addressBook = APAddressBook()
        addressBook.fieldsMask = .all
        addressBook.loadContacts({ (contacts: [APContact]?, error: Error?) in
                completion(contacts, error)
        })
    }

    static func getAscii(str : String)->Int{
        let s = str.unicodeScalars
        let ascii = Int(s[s.startIndex].value)
        return ascii
    }


    static func getPhoneNumberE164(number : String)->String{
        
        var numberE164 = number
        numberE164 = numberE164.replacingOccurrences(of: "(", with: "")
        
        //print("remove all spec chars : \(numberE164)")
        numberE164 = numberE164.replacingOccurrences(of: ")", with: "")
        numberE164 = numberE164.replacingOccurrences(of: "-", with: "")
        
        // ascii 48~57   : 0 - 9  + : 43
        var tmpNumber = String(numberE164);
        
        for char in numberE164.characters{
            //print(char.description)
            let ascii1 = getAscii(str: String(char))
            let ascii2 = getAscii(str: " ")
            //print(ascii1)
            //print(ascii2)
            //print(" ".hashValue)
            
            if (ascii1 > 57 || ascii1 < 48) && ascii1 != 43{
                tmpNumber = tmpNumber.replacingOccurrences(of: String(char), with: "")
            }
        }
        
        //print(tmpNumber)
        numberE164 = tmpNumber
        
        if numberE164.characters.first != "+" {
            let phoneNumberKit = PhoneNumberKit()
            var phoneNumberParsed : PhoneNumber?
            do {
                phoneNumberParsed = try phoneNumberKit.parse(numberE164, withRegion: (Locale.current.regionCode)!, ignoreType: true)
            }
            catch {
                //print("Generic parser error")
            }
            
            if phoneNumberParsed == nil {
                return numberE164
            }
            
            numberE164 = phoneNumberKit.format(phoneNumberParsed!, toType: .e164)
            //print("Parsed by phonenumberkit : \(numberE164)")

        }
        return numberE164
    }
}


