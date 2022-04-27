//
//  Home.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 28/03/22.
//

import SwiftUI
import Firebase

struct HomeNavBar: View {
    
    @State var TabSelected = 1
    @State var CentreTab = false
    @State var userName = ""
    let ColorNotSelected = Color(red: 178/255, green: 178/255, blue: 178/255)
    let ColorSelected = Color(red: 209/255, green: 138/255, blue: 114/255)
    let BackgroundColor = Color(red: 27/255, green: 31/255, blue: 34/255)
    var TextColor = Color(red: 178/255, green: 178/255, blue: 178/255)
    
    
    var body: some View {
        
        ZStack {
            BackgroundColor.ignoresSafeArea()
            VStack {
                
                HStack {
                    
                    Image("MUJ Logo")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(.leading)
                        
                    VStack(alignment: .leading){
                        Text("Hello!")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 168/255, green: 168/255, blue: 168/255, opacity: 1.0))
                        
                        Text(userName)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: 1.0))
                            
                    }
                    
                    Spacer()
                    Text("MUJ\nUNIFIED")
                        .foregroundColor(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: 1.0))
                    
                        .offset(x: 0, y: 0)
                        .multilineTextAlignment(.trailing)
                        .font(.custom("Copperplate", size: 25))
                        .padding(.trailing)
                }
                .offset(x: 0, y: 60)
                    
                
                Spacer()
                
                if TabSelected == 1{
                    
                    Text("Home")
                        .foregroundColor(ColorSelected)
                        .font(.title)
                        .bold()
                    
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
                    .offset(y: -10)
            }.ignoresSafeArea()
                .navigationBarHidden(true)
                .onAppear(perform: getName)
                
        }
    }
    
    
    func getName(){
        let user = Auth.auth().currentUser?.uid
        print("User logged in as \(String(describing: user))")
        let db = Firestore.firestore()
        let docRef = db.collection("Users").document(user!)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                userName = "\(document["Name"]!)"
                print("UserName is \(userName)")
            } else {
                print("Document does not exist")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavBar()
    }
}
