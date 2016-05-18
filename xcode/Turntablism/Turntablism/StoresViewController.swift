//
//  StoresViewController.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 12/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation

class StoresViewController: UIViewController {

  @IBOutlet var mapview: MGLMapView!
  var locationMgr = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    // MARK: - Create & store pins
    let store1 = Store(coordinate: CLLocationCoordinate2DMake(51.226226, 4.413470),
                       title: "Bax-Shop", subtitle: "Stijfselrui 46,2000 Antwerpen")
    let store2 = Store(coordinate: CLLocationCoordinate2DMake(51.222861, 3.233385),
                       title: "KEYMUSIC Brugge", subtitle: "Fort Lapin 49,8000 Brugge")
    let store3 = Store(coordinate: CLLocationCoordinate2DMake(50.951825, 3.120522),
                       title: "KEYMUSIC Roeselare", subtitle: "Brugsesteenweg 29,8800 Roeselare")
    let store4 = Store(coordinate: CLLocationCoordinate2DMake(51.049158, 3.738597),
                       title: "KEYMUSIC Gent", subtitle: "Kasteellaan 1,9000 Gent")
    let store5 = Store(coordinate: CLLocationCoordinate2DMake(50.826687, 3.270127),
                       title: "Media Markt Kortrijk", subtitle: "Q-Park K in,Steenpoort 2,8500 Kortrijk")

    let stores = [store1, store2, store3, store4, store5]

    // MARK: - Show pins, setup map
    mapview.addAnnotations(stores)
  }

  override func viewWillAppear(animated: Bool) {
    // MARK: - Set navigation title for this tab
    super.viewWillAppear(animated)
    self.tabBarController?.navigationItem.title = "Pioneer Resellers"
    //
    // MARK:- Check if app is permitted to use user location
    if CLLocationManager.locationServicesEnabled() {
      if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
        mapview.showsUserLocation = true
      } else {
        locationMgr.requestWhenInUseAuthorization()
      }
    }
  }

}
