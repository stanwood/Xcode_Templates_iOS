//
//  Coordinator.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2018 ORGANISATION. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinating {
    var window: UIWindow { get }
    var parameters: Parameters! { get set }
    var actions: Actions! { get set }
}

class Coordinator: Coordinating {
    
    let window: UIWindow
    var parameters: Parameters!
    var actions: Actions!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func configureRootView() {
        // TODO:
        // 1. Configure a TabBarController
        // 2. Configure a NavigationController if needed
        
        let viewController = MainWireframe.makeViewController()
        MainWireframe.prepare(viewController, with: actions, and: parameters)
        
        window.rootViewController = viewController
    }
}
