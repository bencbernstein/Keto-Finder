//
//  RestaurantCell.swift
//  Keto Finder
//
//  Created by Benjamin Bernstein on 3/26/17.
//  Copyright © 2017 Burning Flowers. All rights reserved.
//

import UIKit
import MapKit

class RestaurantCell: UITableViewCell, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var restaurant: Restaurant? {
        didSet {
            if let restaurant = restaurant {
                setupCell(restaurant)
            }
        }
    }
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceAndRatingsField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            if let mapView = self.mapView {
            mapView.delegate = self
        }
        
    }
    
    func setupCell(_ restaurant: Restaurant) {
        nameField.text = restaurant.name
        categoryField.text = restaurant.firstCategory
        restaurantImage.image = restaurant.image
        priceAndRatingsField.text = String(restaurant.rating) + " " + restaurant.price
        setupMap(restaurant: restaurant)
     
    }
    
    func setupMap(restaurant: Restaurant) {

            let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees(restaurant.latitude), longitude: CLLocationDegrees(restaurant.longitude))
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = location
            dropPin.title = restaurant.name
        
            mapView.addAnnotation(dropPin)
            self.mapView?.setRegion(MKCoordinateRegionMakeWithDistance(location, 500, 500), animated: false)

    }

}
