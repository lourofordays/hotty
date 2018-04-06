//
//  HomeViewController.swift
//  hotty
//
//  Created by Louis Régis on 28/03/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import GoogleMaps

extension GMSMapView {
    func mapStyle(withFilename name: String, andType type: String) {
        do {
            if let styleURL = Bundle.main.url(forResource: name, withExtension: type) {
                self.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
    }
}

class MapVC: UIViewController {
    
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let lat = -23.562573
    let long = -46.654952
    let zoom: Float = 13
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createMapView()
        addMarker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createMapView() {
        let camera = GMSCameraPosition.camera(withLatitude:lat,
                                              longitude: long, zoom: zoom)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
    }
    
    func addMarker() {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(lat, long)
        marker.title = "Av. Paulista"
        marker.snippet = "São Paulo"
        marker.map = mapView
    }
    
}



