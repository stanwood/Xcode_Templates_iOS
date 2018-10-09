//
//  Constants.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2018 ORGANISATION. All rights reserved.
//

import Foundation

class Constants {
    
    struct FirebaseConfig {
        private init () {}
        
        #if DEBUG
        static let defaults = "Firebase-Default-Values-Debug"
        #elseif STAGE
        static let defaults = "Firebase-Default-Values-Stage"
        #else
        static let defaults = "Firebase-Default-Values"
        #endif
    }
}
