//
//  Restaurants.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 24/12/21.
//

import SwiftUI

struct RestaurantsPage: View {
    
    @ObservedObject var array = DataModel()
    let BackgroundColor = Color(red: 27/255, green: 31/255, blue: 34/255)

    
    var body: some View {
        
        ZStack {
            BackgroundColor.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                ForEach(array.list1){ item in
                    
                    NavigationLink {
                        Menu(ResName : item.id)
                    } label: {
                        VStack() {
                            Text(item.id)
                        }
                    }
                    
                }
                
            }.navigationTitle("Restaurant")
        }
        
    }
    
    init(){
        array.getData()
    }
}

struct RestaurantsPage_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsPage()
    }
}
