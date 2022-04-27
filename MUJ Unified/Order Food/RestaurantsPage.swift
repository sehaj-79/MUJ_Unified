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
    let Color2 = Color(red: 40/255, green: 40/255, blue: 40/255)

    
    var body: some View {
        
        ZStack {
            BackgroundColor.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(array.list1){ item in
                        
                        NavigationLink {
                            Menu(ResName : item.id)
                            
                        } label: {
                            ZStack(alignment: .leading) {
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color2)
                                
                                HStack {
                                    Text(item.id)
                                        .foregroundColor(Color.white)
                                        .padding()
                                    Spacer()
                                    Text(">")
                                        .foregroundColor(Color.white)
                                        .padding(.trailing, 25)
                                }
                            }.padding(.horizontal)
                        }.buttonStyle(.plain)
                        
                    }
                    
                }.navigationTitle("Restaurant")
            }
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
