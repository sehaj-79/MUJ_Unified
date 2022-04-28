//
//  Altitude.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 09/01/22.
//

import SwiftUI
import CoreMotion

struct Altitude: View {

    @State var absoluteAltitude: NSNumber = 0
    @State var altitude = 0
    let altimeter = CMAltimeter()
    
    func update(d: CMAltitudeData?, e: Error?){
        print("altitude \(altitude)")
        print("CMAltimeter \(altimeter)")
        print("absolute Altitude \(absoluteAltitude))")
        
    }
    
    
    var body: some View {
        VStack {
            Text("\(altimeter)")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
            Text("absolute - \(absoluteAltitude)")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
            Text("Altitude - \(altitude)")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
            Button(action: {
                print("START")
                self.startAltimeter()
            }, label: {
                Text("Start Altimeter")
                    .bold()
                    .foregroundColor(.green)
            })
                
        }
    }
    
    
    func startAltimeter() {
        
        if CMAltimeter.isAbsoluteAltitudeAvailable() {
            switch CMAltimeter.authorizationStatus() {
            case .notDetermined: // Handle state before user prompt
                print("bb")
                
                //fatalError("Awaiting user prompt...")
            case .restricted: // Handle system-wide restriction
                fatalError("Authorization restricted!")
            case .denied: // Handle user denied state
                fatalError("Authorization denied!")
            case .authorized: // Ready to go!
                let _ = print("Authorized!")
            @unknown default:
                fatalError("Unknown Authorization Status")
            }
            self.altimeter.startAbsoluteAltitudeUpdates(to: OperationQueue.main) {(data,error) in DispatchQueue.main.async {
                print("\(altitude)")
                print("\(absoluteAltitude)")
            }
                
            }
        }
    }
    
}



struct Altitude_Previews: PreviewProvider {
    static var previews: some View {
        Altitude()
    }
}
