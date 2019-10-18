//
//  LoginModel.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 09/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginModel : Mappable {
    var token : String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        token <- map["QpwL5tke4Pnpja7X4"]
    }
}
