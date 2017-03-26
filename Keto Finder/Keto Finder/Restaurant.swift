//
//  Restaurant.swift
//  Keto Finder
//
//  Created by Benjamin Bernstein on 3/26/17.
//  Copyright © 2017 Burning Flowers. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    var name: String
    var categories: [[String:Any]]
    var id: String
    var reviewCount: Int
    var imageURL: String
    var image: UIImage?
    var longitude: CGFloat
    var latitude: CGFloat
    var price: String
    var rating: Double
    
    var firstCategory: String {
        return categories[0]["title"] as? String ?? "No First Category"
    }
    
    init(dictionary: [String:Any]) {
        self.name = dictionary["name"] as? String ?? "No Name"
        self.categories = dictionary["categories"] as? [[String:Any]] ?? [[:]]
        self.id = dictionary["id"] as? String ?? "No Id"
        self.rating = dictionary["rating"] as? Double ?? 0
        self.reviewCount = dictionary["review_count"] as? Int ?? 0
        self.imageURL = dictionary["image_url"] as? String ?? "No Image URL"
        self.price = dictionary["price"] as? String ?? "$?"
        
        let coordinates = dictionary["coordinates"] as? [String: Any] ?? [:]
        self.longitude = coordinates["longitude"] as? CGFloat ?? 0
        self.latitude = coordinates["latitude"] as? CGFloat ?? 0        
        
    }
    
    
}
