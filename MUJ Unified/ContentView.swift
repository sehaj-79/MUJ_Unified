//
//  ContentView.swift
//  MUJ Unified
//
//  Created by sehejbir bhasin on 16/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var option:Int = 0
    let options: [String] = ["Order Food Online","View Map","Option 3","Option 4"]
    
    var body: some View {
        VStack {
            
            ForEach((0...3), id: \.self) {option in
                Button {
                    
                } label: {
                    Text(options[option]).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(50.0)
                        .padding()
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
