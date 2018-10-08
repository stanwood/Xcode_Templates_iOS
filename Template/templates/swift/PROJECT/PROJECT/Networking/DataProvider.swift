//
//  DataProvider.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2018 ORGANISATION. All rights reserved.
//

import Foundation

class DataProvider {
    
    private let appData: AppData
    private let networkManager: Networking
    
    init(appData: AppData, networkManager: Networking) {
        self.appData = appData
        self.networkManager = networkManager
    }
    
}
