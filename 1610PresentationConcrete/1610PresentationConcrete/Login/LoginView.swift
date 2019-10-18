//
//  Login.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 09/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        if($viewModel.currentState.wrappedValue == 0){
            return AnyView(VStack {
                Text("Hello SwiftUI world, universe and everything")
                TextField("Username", text: $viewModel.username)
                SecureField("Password", text: $viewModel.password)
                Spacer()
                Button("Login") {
                    self.viewModel.logUserIn()
                }
            }.padding(20))
        }
        else {
            return AnyView(UsersListView())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
