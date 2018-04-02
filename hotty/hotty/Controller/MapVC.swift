//
//  HomeViewController.swift
//  hotty
//
//  Created by Louis Régis on 28/03/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var eggAnnotationPin = MKPointAnnotation()
    
    
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius: Double = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        mapView.showsUserLocation = true
        
        let eggAnnotationCoordinates = CLLocationCoordinate2DMake(46.5606,6.6825)
        eggAnnotationPin.coordinate = eggAnnotationCoordinates
        eggAnnotationPin.title = "EasterEgg"
        mapView.addAnnotation(eggAnnotationPin)
        
        print("Egg")
    
        
        view.backgroundColor = .white
        mapView.delegate = self
        locationManager.delegate = self
        mapView.showsUserLocation = true
        configureLocationServices()
        
    }
    
    func mapView(_mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation) {
            print("NOT REGISTERED AS MKPOINT ANNOTATION")
            return nil
            
            
        
        }
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "EggIdentifier")
        if annotationView == nil {
            annotationView!.canShowCallout = true
            
        }
        else {
            annotationView!.annotation = annotation
            
        }
        annotationView!.image = UIImage(named: "easter-egg (1)")
        
        return annotationView
        
    
    }
    
    
}

    extension MapVC: MKMapViewDelegate {
        func centerMapOnUserLocation() {
            guard let coordinate = locationManager.location?.coordinate else { return }
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
    }
    
    extension MapVC: CLLocationManagerDelegate {
        func configureLocationServices() {
            if authorizationStatus == .notDetermined {
                locationManager.requestAlwaysAuthorization()
            } else {
                return
            }
        }
        
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            centerMapOnUserLocation()
        }
}
