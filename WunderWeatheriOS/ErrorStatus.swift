//
//  ErrorStatus.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import Foundation


struct ErrorStatus {
    
    let errorType: String?
    let errorDescription: String?
    
    // Retrieve any error messages from the API in case of invalid ZIP code
    init(errorDictionary: [String: AnyObject]) {
        errorType = errorDictionary["error"]?["type"] as? String
        errorDescription = errorDictionary["error"]?["description"] as? String
    }
}
