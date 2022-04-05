//
//  Home.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 28/03/22.
//

import SwiftUI

struct HomeNavBar: View {
    
    @State var TabSelected = 1
    @State var CentreTab = false
    let ColorNotSelected = Color(red: 178/255, green: 178/255, blue: 178/255)
    let ColorSelected = Color(red: 209/255, green: 138/255, blue: 114/255)
    let BackgroundColor = Color(red: 27/255, green: 31/255, blue: 34/255)
    var TextColor = Color(red: 178/255, green: 178/255, blue: 178/255)
    
    
    
    var body: some View {
        
        ZStack {
            BackgroundColor.ignoresSafeArea()
            VStack {
                
                Spacer()
                
                if TabSelected == 1{
                    
                    ZStack {
                        Text("Home")
                            .foregroundColor(ColorSelected)
                            .font(.title)
                            .bold()
                    }
                }
                
                if TabSelected == 2{
                    Text("Food")
                        .foregroundColor(ColorSelected)
                        .font(.title)
                        .bold()
                }
                
                if TabSelected == 3{
                    Text("Maps")
                        .foregroundColor(ColorSelected)
                        .font(.title)
                        .bold()
                }
                
                if TabSelected == 4{
                    Text("Profile")
                        .foregroundColor(ColorSelected)
                        .font(.title)
                        .bold()
                }
                
                
                
                
                Spacer()
                ZStack {            //Navigation Bar
                    
                    if CentreTab == true{
                        ZStack {
                            Image("Nav Bar Close")
                            Image("Nav Bar Close Button").onTapGesture {
                                self.CentreTab = false
                            }
                        }
                    }
                    
                    
                    if CentreTab == false{
                        Image("Nav BG").offset(y: -10)
                        HStack{
                            HStack {
                                Spacer()
                                VStack{
                                    Image(TabSelected==1 ? "Home Selected":"Home")
                                    Text("Home")
                                        .foregroundColor(TabSelected==1 ? ColorSelected:ColorNotSelected)
                                        .font(.caption)
                                }.onTapGesture {
                                    self.TabSelected = 1
                                }
                                Spacer()
                                VStack{
                                    Image(TabSelected==2 ? "Food Selected":"Food")
                                    Text("Food")
                                        .foregroundColor(TabSelected==2 ? ColorSelected:ColorNotSelected)
                                        .font(.caption)
                                }.onTapGesture {
                                    self.TabSelected = 2
                                }
                                Spacer()
                            }
                            
                            Image("Centre Button").offset(y: -5).scaleEffect(1.1)
                                .onTapGesture {
                                    self.CentreTab = true
                                }
                            
                            HStack {
                                Spacer()
                                VStack{
                                    Image(TabSelected==3 ? "Maps Selected":"Maps")
                                    Text("Maps")
                                        .foregroundColor(TabSelected==3 ? ColorSelected:ColorNotSelected)
                                        .font(.caption)
                                }.onTapGesture {
                                    self.TabSelected = 3
                                }
                                Spacer()
                                VStack{
                                    Image(TabSelected==4 ? "Profile Selected new":"Profile")
                                    Text("Profile")
                                        .foregroundColor(TabSelected==4 ? ColorSelected:ColorNotSelected)
                                        .font(.caption)
                                }.onTapGesture {
                                    self.TabSelected = 4
                                }
                                Spacer()
                            }
                        }
                    }
                    
                }.animation(.default)
            }.ignoresSafeArea()
                .navigationBarHidden(true)
                
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavBar()
    }
}
