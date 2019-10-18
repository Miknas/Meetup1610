//
//  LoginService.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 09/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation
import Alamofire

class LoginService: BaseService {
    func logUserIn(username: String, password: String) {
        let params = ["email": username, "password": password]
        Alamofire.request(Self.BASE_URL + "login", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if let error = response.error {
                self.output?.objectFor(value: nil, error: error)
            }
            else {
                self.output?.objectFor(value: (response.result.value as! [String : AnyObject]), error: nil)
            }
        }
    }    
}
