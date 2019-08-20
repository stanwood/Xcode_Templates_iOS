//
//  APIError.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2019 ORGANISATION. All rights reserved.
//

import Foundation
protocol APIErrorable: Error {}

struct APIError: Error, Codable, APIErrorable {
    
    enum Predefind: Error, APIErrorable {
        case cannotAuthenticateConnectionError
    }
    
    let errorMessage: String
    let userInfo: String?
    
    var localizedDescription: String {
        return errorMessage
    }
    
    init(error: Error) {
        errorMessage = error.localizedDescription
        userInfo = "\((error as NSError).userInfo)"
    }
}
