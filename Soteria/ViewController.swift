//
//  ViewController.swift
//  Soteria
//
//  Created by Scholar on 7/19/22.
//

//map kit for map
import MapKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet private var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //location points
        let initialLocation = CLLocation(latitude: 38.9072, longitude: -77.0369)
        
        //
        mapView.centerToLocation(initialLocation)
        
        //
        let oahuCenter = CLLocation(latitude: 38.9072, longitude: -77.0369)
        let region = MKCoordinateRegion(
          center: oahuCenter.coordinate,
          latitudinalMeters: 50000,
          longitudinalMeters: 60000)
        mapView.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)

        
        
    }


}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

