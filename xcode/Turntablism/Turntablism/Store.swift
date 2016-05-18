//
//  Store.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 12/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import UIKit
import Mapbox

class Store: MGLPointAnnotation {
  init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
    super.init()
    
    self.coordinate = coordinate
    self.title = title
    self.subtitle = subtitle
  }
}
