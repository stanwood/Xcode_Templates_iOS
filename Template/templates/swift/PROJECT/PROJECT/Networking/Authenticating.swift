//
//  Authenticating.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2019 ORGANISATION. All rights reserved.
//

import Foundation

protocol Authenticating {
    var canAuthenticate: Bool { get }
    
    func authenticate(with completion: @escaping CompletionBlock)
    func authenticate(_ request: URLRequest, done: @escaping (URLRequest) -> Void)
}
