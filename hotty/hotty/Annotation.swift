//
//  Annotation.swift
//  hotty
//
//  Created by Louis Régis on 02/04/2018.
//  Copyright © 2018 Louro. All rights reserved.
//

import MapKit

class Annotation: NSObjectProtocol, MKAnnotation{
    var title: string?
    var Subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D)
    
    self.title = title
    self.subtitle = Subtitle
    self.coordinate = coordinate
    
    
    
    
    
}
