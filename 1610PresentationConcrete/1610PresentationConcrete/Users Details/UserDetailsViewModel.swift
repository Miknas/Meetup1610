//
//  UserDetailsViewModel.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 10/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class UserDetailsViewModel: ObservableObject {
    @Published var avatar: UIImage = UIImage()
    @Published var email: String = ""
    @Published var fullName: String = ""
    var id: Int64
    
    init(id: Int64){
        self.id = id
    }
    
    private var userCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        userCancellable?.cancel()
    }

    func getUser() {
        
    }
    
    func fetchImage(for url: String) {
        let request = URLRequest(url: URL(string: url)!)
        _ = URLSession.shared.dataTaskPublisher(for: request)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] image in
                self?.avatar = image!
            })
    }
}
