//
//  Location.swift
//  Internly-AMAC
//
//  Created by Alexander T. Manov on 5/6/26.
//
import SwiftUI
import CoreLocation
internal import Combine

//NSObject is apples basic gps locaiton framework
//obserableObject makes it so you can have real time location changes
//the manager delegete states how you have the functions ready for when the location changes
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    //Creates an instance of the clLocationManager
    private let manager = CLLocationManager()
    //This holds the acual gps data
    @Published var location: CLLocation?
    //this tracts the useres permission state
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    //runs instantly once locationManager is created
    override init() {
        //since you created an NSobject you have to inalize it first
        super.init()
        //says, once you get a change in anyting make it equal to self
        manager.delegate = self
        //makes a accurate lcoation area, to the meter
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //asks for the users locaiton
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }
    //starts updataing the location, tracts the phone
    func startUpdating() {
        manager.startUpdatingLocation()
    }
    //this method is never called used in the background, and when you get a new location it updates it
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last
    }
    //knows if you location isn't allowed state that in settings.
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.authorizationStatus = manager.authorizationStatus
    }
}
