//
//  MapsController.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-12-07.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import MapKit
import UIKit

class MapsController : UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        // set initial location in Waterloo
        let initialLocation = CLLocation(latitude: 43.479182, longitude: -80.518752)
        centerMapOnLocation(location: initialLocation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

