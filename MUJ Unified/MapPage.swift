//
//  MapPage.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 18/12/21.
//

import SwiftUI
import CoreLocation
import MapKit


struct MapPage: View {
    
    @State var dispLatitude : CLLocationDegrees = 0
    @State var dispLongitude : CLLocationDegrees = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text("Latitude \(dispLatitude)")
            Text("Longitude \(dispLongitude)")
            Spacer()
            Button {
                dispLocation()
            } label: {
                Text("Refresh")
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    
            }
            Spacer()
        }.onAppear(perform: dispLocation)
    }
    
    init(){
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
    }
    
    func dispLocation(){
        let latitude = CLLocationManager().location?.coordinate.latitude
        let longitude = CLLocationManager().location?.coordinate.longitude
        
        let coordinate1 = CLLocation(latitude: 28.5398, longitude: 77.2490)
        let coordinate2 = CLLocation(latitude: 28.5583, longitude: 77.2531)

        var distanceInMeters = coordinate1.distance(from: coordinate2)
        distanceInMeters/=1000
        let dimString: String = String(format: "%.2f", distanceInMeters)
        print("\nDistance - \(dimString)km")
        
//        print("Latitude - \(latitude ?? 0)")
//        print("Longitude - \(longitude ?? 0)\n")
        dispLatitude = latitude!
        dispLongitude = longitude!
    }
}



//struct MapPage_Previews: PreviewProvider {
//    static var previews: some View {
//        MapPage()
//    }
//}

