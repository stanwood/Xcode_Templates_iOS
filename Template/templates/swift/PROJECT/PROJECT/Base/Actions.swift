//
//  Actions.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2019 ORGANISATION. All rights reserved.
//

import Foundation

protocol Actionable {
    var appData: AppData { get }
    var dataProvider: DataProvider { get }
    var coordinator: Coordinator { get }
    var parameters: Parameters { get }
}

class Actions: Actionable {
    
    let appData: AppData
    let dataProvider: DataProvider
    let coordinator: Coordinator
    let parameters: Parameters
    
    init(appData: AppData, dataProvider: DataProvider, coordinator: Coordinator, parameters: Parameters) {
        self.appData = appData
        self.dataProvider = dataProvider
        self.coordinator = coordinator
        self.parameters = parameters
    }
    
    func fetchRemoteConfig(_ completion: @escaping CompletionBlock) {
        Configurations.fetchRemoteConfig(completion)
    }
}
