//
//  LoginInteractor.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 09/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput: class {
    func loginResult(model : LoginModel?, error: Error?)
}

class LoginInteractor: BaseServiceOutput {
    weak var output : LoginInteractorOutput?
    var service = LoginService()
    
    init() {
        service.output = self
    }
    
    func logUserIn(username: String, password: String) {
        service.logUserIn(username: username, password: password)
    }
    
    func objectFor(value: [String : AnyObject]?, error: Error?) {
        if let error = error {
            output?.loginResult(model: nil, error: error)
        }
        else {
            let model = LoginModel(JSON: value!)
            UserDefaults.standard.set(model!.token, forKey: "token")
            output?.loginResult(model: model, error: nil)
        }
    }
    
}
