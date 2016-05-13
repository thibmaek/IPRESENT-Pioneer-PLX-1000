//
//  Store.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 12/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import UIKit
import MapKit

class Store: NSObject, MKAnnotation {
  
  var coordinate: CLLocationCoordinate2D
  var title: String?
  var subtitle: String?
  
  init(coordinate:CLLocationCoordinate2D, title: String, subtitle: String) {
    self.coordinate = coordinate
    self.title = title
    self.subtitle = subtitle
  }
  
}
