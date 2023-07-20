//
//  MapView.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/20/23.
//
import MapKit
import SwiftUI

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation:  true )
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServiceIsEnabled()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    enum mapDetails {
        static var startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
        static var defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    }
    var locationManager: CLLocationManager?
    @Published  var region = MKCoordinateRegion(center: mapDetails.startingLocation, span: mapDetails.defaultSpan)

    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager = CLLocationManager()
            self.locationManager!.delegate = self
            self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager!.allowsBackgroundLocationUpdates = true
            self.locationManager?.startUpdatingLocation()
           
            
            
        }else {
            print("show alert letting them know this off and to go turn it on")
        }
    }
    
    
  private  func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus  {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted")
        case .denied :
            print("You denied this app location permission, go info setting to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,span: mapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization();
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        checkLocationAuthorization()
        print("print hello tracking...")
//        if let location = locations.last {
//            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            region = MKCoordinateRegion(center: center, span: mapDetails.defaultSpan)
//            //        }
//        }
    }
    
    
    
}


