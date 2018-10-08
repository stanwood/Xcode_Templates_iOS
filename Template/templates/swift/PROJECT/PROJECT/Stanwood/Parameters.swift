//
//  Parameters.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2018 ORGANISATION. All rights reserved.
//

import Foundation

protocol Parameterable {
    var appData: AppData { get }
}

class Parameters: Parameterable {
    
    let appData: AppData
    
    init(appData: AppData) {
        self.appData = appData
    }
}
