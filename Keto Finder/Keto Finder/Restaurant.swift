//
//  Restaurant.swift
//  Keto Finder
//
//  Created by Benjamin Bernstein on 3/26/17.
//  Copyright © 2017 Burning Flowers. All rights reserved.
//

import Foundation

struct Restaurant {
    var name: String
    var categories: [[String:Any]]
    var id: String
    var rating: Int
    var reviewCount: Int
    
    var firstCategory: String {
        return categories[0]["title"] as? String ?? "No First Category"
    }
    
    init(dictionary: [String:Any]) {
        self.name = dictionary["name"] as? String ?? "No Name"
        self.categories = dictionary["categories"] as? [[String:Any]] ?? [[:]]
        self.id = dictionary["id"] as? String ?? "No Id"
        self.rating = dictionary["rating"] as? Int ?? 0
        self.reviewCount = dictionary["review_count"] as? Int ?? 0
    }
    
    
}
