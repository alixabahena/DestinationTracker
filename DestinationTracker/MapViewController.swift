//
//  MapViewController.swift
//  DestinationTracker
//
//  Created by Ali on 9/26/17.
//  Copyright © 2017 AlixaBahena. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,  MKMapViewDelegate {
    
    var destinationName: String = ""
    var destinationDescription: String = ""
    var destinationLatitude: Double = 0
    var destinationLongitude: Double = 0
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create and Add MapView to our main view
        print("mapview called")
        createMapView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("mapView did appear called")
        gatherPassedData()
    }
    

    
    func createMapView(){
        mapView.mapType = MKMapType.standard
    }
    
    func gatherPassedData(){
        print(destinationName,destinationDescription,destinationLongitude,destinationLatitude)
        let location = CLLocationCoordinate2DMake(CLLocationDegrees(destinationLatitude), CLLocationDegrees(destinationLongitude))
        let span = MKCoordinateSpanMake(10, 10)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        // Drop a pin
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        dropPin.title = destinationName
        dropPin.subtitle = destinationDescription
        mapView.addAnnotation(dropPin)
    }
}
