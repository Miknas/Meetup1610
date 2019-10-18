//
//  UserDetails.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 10/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

struct UserDetails: View {
    @ObservedObject var viewModel : UserDetailsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.fullName)
            Text(viewModel.email)
            Image(uiImage: viewModel.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
            Spacer()
        }.onAppear {
            self.viewModel.getUser()
        }
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserDetails(viewModel: UserDetailsViewModel(id: 1))
    }
}
