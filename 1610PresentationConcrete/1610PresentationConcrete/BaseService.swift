//
//  BaseService.swift
//  1610PresentationConcrete
//
//  Created by Namik Catibusic on 09/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import Foundation

protocol BaseServiceOutput {
    func objectFor(value: [String: AnyObject]?, error: Error?)
}

class BaseService {
    static var BASE_URL = "https://reqres.in/api/"
    var output : BaseServiceOutput?
}
