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
            setupMap()
        }
    }
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let mapView = self.mapView {
            mapView.delegate = self
            setupMap()


        }
        
    }
    
    func setupMap() {
        
        if let safeRestaurant = restaurant {
            let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees(safeRestaurant.latitude), longitude: CLLocationDegrees(safeRestaurant.longitude))
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = location
            dropPin.title = safeRestaurant.name
            mapView.addAnnotation(dropPin)
            self.mapView?.setRegion(MKCoordinateRegionMakeWithDistance(location, 500, 500), animated: true)

            print("\n mapview annoation is", dropPin.coordinate, dropPin.title)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
