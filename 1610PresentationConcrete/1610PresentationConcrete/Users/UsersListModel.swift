//
//  UsersListModel.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 10/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation

struct UsersListModel: Decodable {
    var data: [UserListItemModel]
}

struct UserListItemModel: Identifiable, Hashable, Decodable {
    var id: Int64
    var first_name: String
    var last_name: String
    var email: String
}
