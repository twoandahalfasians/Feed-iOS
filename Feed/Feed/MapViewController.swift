//
//  MapViewController.swift
//  Feed
//
//  Created by Brian Wang on 9/26/15.
//  Copyright © 2015 TAAHA. All rights reserved.
//

import UIKit
import GoogleMaps
import MobileCoreServices

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initMap()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initMap() {
        if CLLocationManager.locationServicesEnabled() {
            if (locationManager == nil){
                locationManager = CLLocationManager.init()
                if let locationManager = locationManager {
                    locationManager.delegate = self;
                    locationManager.distanceFilter = kCLDistanceFilterNone
                    locationManager.desiredAccuracy = kCLLocationAccuracyBest
                    if (locationManager.respondsToSelector(Selector("requestWhenInUseAuthorization"))) {
                        locationManager.requestWhenInUseAuthorization()
                    }
                }
            }
        }
    
        var camera = GMSCameraPosition.cameraWithLatitude(locationManager!.location!.coordinate.latitude, longitude: locationManager!.location!.coordinate.longitude, zoom: 14)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
