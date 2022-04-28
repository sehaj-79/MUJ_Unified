//
//  NavigateTo.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 28/04/22.
//

import SwiftUI

struct NavigateTo: View {
    
    @ObservedObject var array = DataModel()
    let BackgroundColor = Color(red: 27/255, green: 31/255, blue: 34/255)
    let Color2 = Color(red: 40/255, green: 40/255, blue: 40/255)
    let ColorWhite = Color(red: 233/255, green: 233/255, blue: 233/255)
    @State var search : String = ""
    
    
    var body: some View {
        ZStack {
            BackgroundColor.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Navigate To")
                    .font(.title3)
                    .foregroundColor(ColorWhite)
                    .padding(.horizontal)
                
                
                ZStack(alignment:.leading) {
                    Text(search.isEmpty ? "Search..." : "")
                        .foregroundColor(Color.gray)
                        .padding(.horizontal, 35)
                    TextField("", text: $search)
                        .foregroundColor(ColorWhite)
                        .colorMultiply(Color.white)
                        .frame(height: 40)
                        .padding(.horizontal)
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.horizontal)
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(array.listPlaces){ item in
                            
                            if search.isEmpty  {
                                NavigationLink {
                                    ARGuidance()
                                    
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
                            
                            else if item.id.contains(search){
                                NavigationLink {
                                    ARGuidance()
                                    
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
                            
                            
                            
                        }
                        
                    }.navigationTitle("Maps")
                }
            }
        }
    }
}

struct NavigateTo_Previews: PreviewProvider {
    static var previews: some View {
        NavigateTo().previewDevice("iPhone 13 Pro")
    }
}
