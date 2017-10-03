//
//  ViewController.swift
//  DestinationTracker
//
//  Created by Ali on 9/26/17.
//  Copyright © 2017 AlixaBahena. All rights reserved.
//

import UIKit

struct location {
    var name: String?
    var desc: String?
    var latitude: Double
    var longitude: Double
    init() //gives default values of Houston
    {
        name = "Test"
        desc = "testing"
        latitude = 29
        longitude = -95
    }
    init(name: String, desc: String, latitude: Double, longitude: Double) {
        self.name = name
        self.desc = desc
        self.latitude = latitude
        self.longitude = longitude
    }
}

class ViewController: UIViewController {
    @IBAction func addDestinationButtonClicked(addDestination: UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mapViewControl = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        let data = location(name: destinationNameTextField.text!, desc: destinationDescriptionTextField.text!, latitude: Double(destinationLatitudeTextField.text!)!, longitude: Double(destinationLongitudeTextField.text!)!)
        
        mapViewControl.locationsPassed.append(data)
        
        let barViewControllers = self.tabBarController?.viewControllers
        let svc = barViewControllers![1] as! MapViewController
        svc.data = self.data
        svc.locationsPassed.append(data)
        tabBarController?.selectedIndex = 1
    }
    @IBOutlet var destinationNameTextField: UITextField!
    @IBOutlet var destinationDescriptionTextField: UITextField!
    @IBOutlet var destinationLatitudeTextField: UITextField!
    @IBOutlet var destinationLongitudeTextField: UITextField!
    @IBOutlet var addDestinationButton: UIButton!
    
    var data = location()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //clears text of all fields and sets focus to name field
    override func viewDidAppear(_ animated: Bool) {
        destinationNameTextField.becomeFirstResponder()
        destinationNameTextField.text = ""
        destinationDescriptionTextField.text = ""
        destinationLatitudeTextField.text = ""
        destinationLongitudeTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

