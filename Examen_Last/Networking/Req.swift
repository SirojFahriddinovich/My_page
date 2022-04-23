//
//  Req.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class Req {
    
    static let shared = Req()
    
    func getApiDetelies(base_url : URL, method : HTTPMethod ,compleation : @escaping (JSON?) -> () ) {
//        
//        let baseUrl = "https://catfact.ninja/fact"
//        let url = URL(string: baseUrl+path.rawValue)!
        
        AF.request(base_url, method: method).response { response in
            if let data = response.data {
                let json = JSON(data)
                compleation(json)
            } else {
                compleation(nil)
            }
        }
        
    }
    
   
    
    
}
