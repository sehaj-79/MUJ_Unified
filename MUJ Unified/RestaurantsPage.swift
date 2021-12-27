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
        
        List(array.list){ item in
            Text(item.id+"\n\(item.Contact)\n")
        }
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
