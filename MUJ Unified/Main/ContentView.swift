//
//  ContentView.swift
//  MUJ Unified
//
//  Created by sehejbir bhasin on 16/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var intentRestaurants = false
    @State var intentAltitude = false
    @State var intentAR = false
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: Restaurants(), isActive: $intentRestaurants){EmptyView()}
            
            NavigationLink(destination: ARGuidance(), isActive: $intentAR){EmptyView()}
            
            NavigationLink(destination: Altitude(), isActive: $intentAltitude){EmptyView()}
            
            Button {
                self.intentRestaurants = true
            } label: {
                Text("Order Food Online").frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(50.0)
                    .padding(.vertical)
            }
            
            Button {
                self.intentAR = true
            } label: {
                Text("View AR Guidance").frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(50.0)
                    .padding(.vertical)
            }
            
            Button {
                self.intentAltitude = true
            } label: {
                Text("View Altitude Page").frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(50.0)
                    .padding(.vertical)
            }
            
            
        }.navigationBarHidden(true)
    
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
