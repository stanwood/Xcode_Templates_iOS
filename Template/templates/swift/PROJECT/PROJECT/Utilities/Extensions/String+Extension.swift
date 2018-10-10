//
//  String+Extension.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © TODAYS_YEAR ORGANISATION. All rights reserved.eserved.
//

import Foundation

extension String {
    
    /// Transformed a String into an array seperated by ,
    var toArray: [String] {
        return components(separatedBy: ", ")
    }
}
