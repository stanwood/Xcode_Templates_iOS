//
//  MainWireframe.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2018 ORGANISATION. All rights reserved.
//

class MainWireframe {
    
    static func makeViewController() -> MainViewController {
        return UIStoryboard().instantiate(viewController: MainViewController.self)
    }
    
    static func prepare(_ viewController: MainViewController, with  actions: MainActionable, and parameters: MainParameterable) {
    	let presenter =  MainPresenter(actionable: actions, parameterable: parameters, viewable: viewController)
        viewController.presenter = presenter
    }
    
}
