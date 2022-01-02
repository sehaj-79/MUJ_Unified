//
//  Restaurants.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 24/12/21.
//

import SwiftUI

struct Restaurants: View {
    
    @ObservedObject var array = DataModel()

    
    var body: some View {
        
        VStack {
            List(array.list1){ item in
                
                NavigationLink {
                    Menu(ResName : item.id)
                } label: {
                    Text(item.id)
                }
                
            }
            
        }.navigationTitle("Restaurant")
        
    }
    
    init(){
        array.getData()
    }
}

struct Restaurants_Previews: PreviewProvider {
    static var previews: some View {
        Restaurants()
    }
}
