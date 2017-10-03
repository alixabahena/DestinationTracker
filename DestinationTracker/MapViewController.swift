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
    var data = location()
    
    var locationsPassed = [location]()
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create and Add MapView to our main view
        
        createMapView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gatherPassedData()
    }
    

    
    func createMapView(){
        mapView.mapType = MKMapType.standard
    }
    
    func gatherPassedData(){
        for (index, _) in locationsPassed.enumerated(){
            
            let location = CLLocationCoordinate2DMake(CLLocationDegrees(locationsPassed[index].latitude), CLLocationDegrees(locationsPassed[index].longitude))
            let span = MKCoordinateSpanMake(10, 10)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
            // Drop a pin
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = location
            dropPin.title = locationsPassed[index].name
            dropPin.subtitle = locationsPassed[index].desc
            mapView.addAnnotation(dropPin)
        }
       
    }
}
