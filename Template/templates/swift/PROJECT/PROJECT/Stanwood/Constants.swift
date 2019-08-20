//
//  Constants.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2019 ORGANISATION. All rights reserved.
//

import Foundation

class Constants {
    
    struct FirebaseConfig {
        private init () {}
        
        static var defaults: String {
            #if DEBUG
            return "Firebase-Default-Values-DEBUG"
            #elseif STAGE
            return "Firebase-Default-Values-STAGE"
            #else
            return "Firebase-Default-Values"
            #endif
        }
    }
    
    struct Translations {
        private init () {}
        
        /// Add you translations here
        /// Note: Follow our convensions
    }
}
