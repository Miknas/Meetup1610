//
//  ContentView.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 10/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var token = UserDefaults.standard.object(forKey: "token")
    
    var body: some View {
        if let _ = token as? String {
            return AnyView(UsersListView())
        }
        else {
            return AnyView(LoginView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
