//
//  APIManager.swift
//  Keto Finder
//
//  Created by Benjamin Bernstein on 3/26/17.
//  Copyright © 2017 Burning Flowers. All rights reserved.
//


import Foundation
import Alamofire

class APIManager {
    
    static private let headers: HTTPHeaders = [
        "Authorization": Secrets.authorizationValue
    ]
    
    static let baseURL = "https://api.yelp.com/v3/businesses/search?term=keto&radius=3000&latitude=40.7181420&longitude=-73.9492120&sort_by=distance"
    
    class func getNearby(completion: @escaping ([Restaurant]) -> Void ) {
        var restaurants = [Restaurant]()
        Alamofire.request(baseURL, headers: headers).responseJSON(completionHandler: { (response) in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                guard let all = JSON as? [String: Any] else { print("couldn't get all"); return }
                guard let businesses = all["businesses"] as? [Any] else { print("couldn't make businesess"); return }
                for business in businesses {
                    let business = business as? [String: Any] ?? [:]
                    let newRestaurant = Restaurant(dictionary: business)
                    restaurants.append(newRestaurant)
                }
                completion(restaurants)
            }
        })
    }
    
    
    

}