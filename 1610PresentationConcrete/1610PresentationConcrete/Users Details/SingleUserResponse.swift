//
//  SingleUserResponse.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 11/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation

struct SingleUserResponse: Decodable {
    var data: SingleUserItem
}

struct SingleUserItem : Decodable {
    var id: Int64
    var first_name: String
    var last_name: String
    var email: String
    var avatar: String
}
