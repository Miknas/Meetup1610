//
//  SearchView.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 10/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

struct UsersListView: View {
    @ObservedObject var viewModel: UsersListViewModel = UsersListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.items) { item in
                NavigationLink(destination: UserDetails(viewModel: UserDetailsViewModel(id: item.id))) {
                    Text(item.fullName)
                }.navigationBarTitle(Text("List"))
            }.navigationBarTitle(Text("Users"))
            .navigationBarItems(trailing:
                NavigationLink(destination: LoginView()) {
                    Text("Log out")
                }
            )
        }.onAppear {
            self.viewModel.getUsers()
        }.onDisappear(){
            
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
