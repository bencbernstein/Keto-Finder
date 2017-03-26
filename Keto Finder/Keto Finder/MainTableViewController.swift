//
//  MainTableViewController.swift
//  Keto Finder
//
//  Created by Benjamin Bernstein on 3/26/17.
//  Copyright © 2017 Burning Flowers. All rights reserved.
//

import UIKit
import MapKit

class MainTableViewController: UITableViewController {
    
    var restaurants = [Restaurant]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.getNearby { (restaurants) in
            self.restaurants = restaurants
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantCell
        cell.nameField.text = restaurants[indexPath.row].name
        cell.categoryField.text = restaurants[indexPath.row].firstCategory
        cell.restaurantImage.image = restaurants[indexPath.row].image
        cell.restaurant = restaurants[indexPath.row]
        
        return cell
    }

}
