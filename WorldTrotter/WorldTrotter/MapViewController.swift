//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Anna Chan on 6/19/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var mapView: MKMapView!
    var locationManager: CLLocationManager

    
    override func viewDidLoad() {
        mapView = MKMapView()
        
        view = mapView
        mapViewWillStartLocatingUser(mapView)

        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        let zoomToLocationButton = UIButton(type: .system)
        zoomToLocationButton.setTitle("Location", for: .normal)
        zoomToLocationButton.addTarget(self, action: #selector(locationButtonTapped(_:)), for: .touchUpInside)
        
        zoomToLocationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zoomToLocationButton)
        
        let zoomTopConstraint = zoomToLocationButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let zoomLeadingConstraint = zoomToLocationButton.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
        zoomTopConstraint.isActive = true
        zoomLeadingConstraint.isActive = true
        
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLLocationAccuracyKilometer;
        // showing user location with the blue dot
//        [mapView setShowsUserLocation:YES];
//        
//        mapView.delegate = self;
//        
//        // getting user coordinates
//        CLLocation *location = [_locationManager location];
//        CLLocationCoordinate2D  coordinate = [location coordinate];
//        
//        
//        // showing them in the mapView
//        _mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 250, 250);
//        
//        [self.locationManager startUpdatingLocation];
        
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        print("NOW TRACKING...")
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("Did Update: \(userLocation.coordinate)")
    }
    
    func locationButtonTapped(_ sender: UIButton) {
        let currentLocation = mapView.userLocation
        print(currentLocation.coordinate)
        let viewReigon = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 0, 0)
        mapView.setRegion(viewReigon, animated: false)
    }
   
}
