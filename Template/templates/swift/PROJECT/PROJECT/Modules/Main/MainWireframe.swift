//
//  MainWireframe.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2019 ORGANISATION. All rights reserved.
//

class MainWireframe {
    
    static func makeViewController() -> MainViewController {
        return UIStoryboard(name: MainViewController.self.identifier, bundle: nil).instantiate(viewController: MainViewController.self)
    }
    
    static func prepare(_ viewController: MainViewController, with  actions: MainActionable, and parameters: MainParameterable) {
    	let presenter =  MainPresenter(actionable: actions, parameterable: parameters, viewable: viewController)
        viewController.presenter = presenter
    }
    
}
