//
//  MainPresenter.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © 2019 ORGANISATION. All rights reserved.
//

protocol MainViewable: class {
    
}

class MainPresenter {//: Presentable {
    
    // MARK:- Properties
    
    unowned var viewable: MainViewable
    var actionable: MainActionable
    var parameterable: MainParameterable
    
    // MARK:- Typealias
    
    typealias Actionable = MainActionable
    typealias Parameterable = MainParameterable
    typealias Viewable = MainViewable
    
    
    required init(actionable: MainActionable, parameterable: MainParameterable, viewable: MainViewable) {
        self.viewable = viewable
        self.actionable = actionable
        self.parameterable = parameterable
    }
    
    func viewDidLoad() {
    
    }
}
