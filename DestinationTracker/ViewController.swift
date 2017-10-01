//
//  ViewController.swift
//  DestinationTracker
//
//  Created by Ali on 9/26/17.
//  Copyright © 2017 AlixaBahena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var destinationNameTextField: UITextField!
    @IBOutlet var destinationDescriptionTextField: UITextField!
    @IBOutlet var destinationLatitudeTextField: UITextField!
    @IBOutlet var destinationLongitudeTextField: UITextField!
    @IBOutlet var addDestinationButton: UIButton!
    
    var destinationName: String = ""
    var destinationDescription: String = ""
    var destinationLatitude: Double = 0
    var destinationLongitude: Double = 0
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addDestinationButtonClicked(addDestination: UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mapViewControl = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        destinationName = destinationNameTextField.text!
        destinationDescription = destinationDescriptionTextField.text!
        destinationLatitude = Double(destinationLatitudeTextField.text!)!
        destinationLongitude = Double(destinationLongitudeTextField.text!)!
        print(destinationName,destinationDescription,destinationLongitude,destinationLatitude)
        
        mapViewControl.destinationName = destinationName
        mapViewControl.destinationDescription = destinationDescription
        mapViewControl.destinationLatitude = destinationLatitude
        mapViewControl.destinationLongitude = destinationLongitude
        //this creates a modal view not good
        tabBarController?.present(mapViewControl, animated: true, completion: nil)
        

    }

}

