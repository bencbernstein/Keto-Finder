//
//  MainTableViewController.swift
//  Keto Finder
//
//  Created by Benjamin Bernstein on 3/26/17.
//  Copyright © 2017 Burning Flowers. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var restaurants = [Restaurant]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.getNearby { (restaurants) in
            print("completed")
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
        return 150
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantCell
        cell.nameField.text = restaurants[indexPath.row].name
        cell.categoryField.text = restaurants[indexPath.row].firstCategory
        return cell
    }

}
