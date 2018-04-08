//
//  HomeViewController.swift
//  hotty
//
//  Created by Louis Régis on 28/03/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    
    let lat = -23.562573
    let long = -46.654952
    let zoom: Float = 13
    var geoFire: GeoFire!
    
    fileprivate var userArr = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createMapView()
        addMarker()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        
        
        userArr = [
            ["name" : "Keila Maney", "pro-image" : "pro-img-3",
             "items": [["content" : "image", "item" : "img-3"], ["content" : "video", "item" : "output"], ["content" : "video", "item" : "output2"]]],
            ["name" : "Gilberto", "pro-image" : "pro-img-1",
             "items": [["content" : "video", "item" : "output3"], ["content" : "image", "item" : "img-4"], ["content" : "image", "item" : "img-5"], ["content" : "video", "item" : "output"]]],
            ["name" : "Jonathan", "pro-image" : "pro-img-2",
             "items": [["content" : "image", "item" : "img-1"], ["content" : "video", "item" : "output2"]]],
            ["name" : "Delmer", "pro-image" : "pro-img-4",
             "items": [["content" : "image", "item" : "img-2"], ["content" : "video", "item" : "output"], ["content" : "image", "item" : "img-3"]]],
            ["name" : "Carolyne", "pro-image" : "pro-img-3",
             "items": [["content" : "video", "item" : "output"], ["content" : "image", "item" : "img-4"], ["content" : "video", "item" : "output3"], ["content" : "image", "item" : "img-3"]]],
            ["name" : "Sabine", "pro-image" : "pro-img-5",
             "items": [["content" : "video", "item" : "output2"], ["content" : "image", "item" : "img-5"], ["content" : "video", "item" : "output3"]]],
        ]
    }
    
    // MARK: - UICollectionViewDataSource
    //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return userArr.count
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! usersCollectionViewCell
        
        cell.imageView.image = UIImage(named: userArr[indexPath.row]["pro-image"] as! String)
        cell.userNameLbl.text = userArr[indexPath.row]["name"]! as? String
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    //1
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContentView") as! StoryContentVC
            vc.modalPresentationStyle = .overFullScreen
            vc.pages = self.userArr
            vc.currentIndex = indexPath.row
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func createMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.settings.myLocationButton = true
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



