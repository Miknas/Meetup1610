//
//  UsersListViewModel.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 10/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation
import Combine

class UsersListViewModel: ObservableObject {
    @Published var items: [UsersListItem] = [UsersListItem]()
    
    private var listCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        listCancellable?.cancel()
    }

    func getUsers() {
        let urlComponents = URLComponents(string: "https://reqres.in/api/users")!

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        listCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: UsersListModel.self, decoder: JSONDecoder())
            .map { $0.data }
            .sink(receiveCompletion: { (test) in
                print(test)
            }, receiveValue: { (response) in
                DispatchQueue.main.async {
                    self.items = response.map({UsersListItem (id: $0.id, fullName: $0.first_name + " " + $0.last_name, email: $0.email)})
                }
            })
    }
}

struct UsersListItem: Identifiable {
    var id: Int64
    var fullName: String
    var email: String
}
