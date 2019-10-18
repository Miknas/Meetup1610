//
//  LoginViewViewModel.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 09/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation

class LoginViewViewModel: ObservableObject, LoginInteractorOutput {
    @Published var username = ""
    @Published var password = ""
    @Published var currentState : Int = 0
    
    init() {
        UserDefaults.standard.set(nil, forKey: "token")
    }
    
    func logUserIn() {
        let interactor = LoginInteractor()
        interactor.output = self
        interactor.logUserIn(username: username, password: password)
    }
    
    func loginResult(model: LoginModel?, error: Error?) {
        if let _ = error {
            currentState = 1
        }
        else {
            currentState = 2
        }
    }
}
