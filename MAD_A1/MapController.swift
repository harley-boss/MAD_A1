//
//  MapController.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-12-07.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import MapKit

/*
 Class: MapController
 Description: Loads a map and centers the location on Conestoga College Waterloo campus
 */
class MapController : UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
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
