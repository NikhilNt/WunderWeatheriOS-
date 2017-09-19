//
//  WebservicesOperation.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import Foundation

import Foundation
import UIKit

enum WebserviceResults {
    case success([String : AnyObject])
    case error(NSError)
}

class WebservicesOperation {
    
    lazy var config: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.config)
    let weatherUrl: URL
    var errorMsg: String?
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> String
    
    init(url: URL) {
        self.weatherUrl = url
    }
    
    func gettingDataFromJson(_ completion: @escaping (_ result: WebserviceResults) -> Void) -> Void {
        
        let request: URLRequest = URLRequest(url: weatherUrl)
        let dataTask = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200 :
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                        completion(WebserviceResults.success(json))
                    } catch let error {
                        print("In Valid Json / JSONSerialization. Error: \(error)")
                    }
                default:
                    print("GET request was able to load.  HTTP status code: \(httpResponse.statusCode)")
                }
            } else {
                completion(WebserviceResults.error(error! as NSError))
            }
        })
        
        dataTask.resume()
        
    }
    
}
