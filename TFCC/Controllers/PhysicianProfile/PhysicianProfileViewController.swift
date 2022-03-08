//
//  PhysicianProfileViewController.swift
//  TFCC
//
//  Created by Asad Mehmood on 07/03/2022.
//

import UIKit
import GoogleMaps

class PhysicianProfileViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mapsView: GMSMapView!
    
    //MARK: - Variables
    var coordinator: MainCoordinator?
    private let locationManager = CLLocationManager()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationSetup()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if let obj = object as? UITableView,
           obj == self.tableView &&
            keyPath == "contentSize" {
            tableViewHeightConstraint.constant = tableView.contentSize.height
        }
    }

//MARK: - IBActions
    
    //MARK: - Selectors
    
    //MARK: - Private Methods
    private func setup() {
        mapsView.delegate = self
        if let styleURL = Bundle.main.url(forResource: "MapStyle", withExtension: "json") {
            do {
                mapsView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Unable to find MapStyle.json")
        }
        tableView.register(UINib(nibName: "PhysicianEducationTableCell", bundle: nil), forCellReuseIdentifier: "physicianEducationTableCell")
    }
    
    private func locationSetup() {
        locationManager.delegate = self
        
        switch(CLLocationManager.authorizationStatus()) {
            
        case .restricted, .denied:
            
            showOkCancelAlertWithOKCompletionHandler(title: "permissions", message: "Please enable location permission from Settings App", okTitle: "OK", okStyle: .default, cancelTitle: "Cancel", cancelStyle: .destructive) { _ in
                UIApplication.shared.open(NSURL(string:UIApplication.openSettingsURLString)! as URL)
            } cancelCompletion: { _ in }
            
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        default:
            break
        }
    }
}

//MARK: - UITableViewDelegate
extension PhysicianProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "physicianEducationTableCell", for: indexPath) as! PhysicianEducationTableCell
        return cell
    }
}

//MARK: - CLLocationManagerDelegate
extension PhysicianProfileViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
        mapsView.isMyLocationEnabled = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {
            return
        }
        
        mapsView.camera = GMSCameraPosition(target: location.coordinate, zoom: 17, bearing: 0, viewingAngle: 0)
//        currentLocation = location
//        marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        marker.isDraggable = true
//        marker.map = mapsView
//        marker.isDraggable = true
//        reverseGeocoding(marker: marker)
//        marker.map = mapsView
        
//        selectedLocation = CLLocationCoordinate2D(latitude: marker.position.latitude, longitude: marker.position.longitude)
        
        self.locationManager.stopUpdatingLocation()
    }
}

//MARK: - GMSMapViewDelegate
extension PhysicianProfileViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
//        print("Position of marker is = \(marker.position.latitude),\(marker.position.longitude)")
        reverseGeocoding(marker: marker)
//        print("Position of marker is = \(marker.position.latitude),\(marker.position.longitude)")
//        selectedLocation = CLLocationCoordinate2D(latitude: marker.position.latitude, longitude: marker.position.longitude)
    }
//    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
//        <#code#>
//    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            let locationOfMarker = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)

//            marker.position = locationOfMarker

//        self.reverseGeocoding(marker: marker)
//        selectedLocation = CLLocationCoordinate2D(latitude: marker.position.latitude, longitude: marker.position.longitude)
//            self.reverseGeocodeCoordinate(coordinate: coordinate, marker: marker)

//            marker.appearAnimation = kGMSMarkerAnimationPop
        }
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
//        print("didBeginDragging")
        reverseGeocoding(marker: marker)
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
//        print("didDrag")
        reverseGeocoding(marker: marker)
    }
    
    
    //Mark: Reverse GeoCoding
    func reverseGeocoding(marker: GMSMarker) {
        let geocoder = GMSGeocoder()
        let coordinate = CLLocationCoordinate2DMake(Double(marker.position.latitude),Double(marker.position.longitude))
        
        var currentAddress = String()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
            if let address = response?.firstResult() {
                let lines = address.lines! as [String]
                print("New Location is  = \(address)")
                print("New Location By Lines is = \(lines)")
//                self.setAddress(address: address)
                currentAddress = lines.joined(separator: "\n")
            }
//            self.searchTextField.placeholder = currentAddress
            marker.title = currentAddress
            marker.map = self.mapsView
        }
    }
}
