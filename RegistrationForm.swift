//
//  RegistrationForm.swift
//  funbuy
//
//  Created by romichama on 5/26/15.
//  Copyright (c) 2015 romichama. All rights reserved.
//

import UIKit

class RegistrationForm: NSObject, FXForm {
    
    var email: String?
    var password: String?
    var repeatPassword: String?
    
    var name: String?
    var gender = 0
    var age: UInt = 0
    var dateOfBirth: NSDate?
    var profilePhoto: UIImage?
    var phone: String?
    var country: String?
    var language: String?
    var interests: NSArray? //NOTE: [String] or [AnyObject] won't work
    var otherInterests = 0
    var about: String?
    
    var plan: Int = 0
    
    var notifications: String?
    
    var agreedToTerms = false
    
    var nproduct: String?
    var cproduct: String?
    var caproduct: String?
    var calproduct: String?
    var hproduct: String?
    var pproduct: String?
    
    //because we want to rearrange how this form
    //is displayed, we've implemented the fields array
    //which lets us dictate exactly which fields appear
    //and in what order they appear
    
    }
