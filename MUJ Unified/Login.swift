//
//  Login.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 18/12/21.
//

import SwiftUI

struct Login: View {
    
    @State var email:String = ""
    @State var password:String = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("MUJ\nUNIFIED")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack{
                Text("Sign In")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.leading, 25.0)
                    .padding(.bottom, 25.0)
                Spacer()
            }.padding(.bottom)

            
            VStack(){
                HStack{
                    Text("Email")
                        .padding(.leading, 25.0)
                    Spacer()
                }
                
                TextField("example@muj.manipal.edu", text: $email)
                    .padding(.horizontal, 25.0)
                    .textFieldStyle(PlainTextFieldStyle())
                
                Rectangle()
                    .offset(y:-4)
                    .frame(height: 0.5)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 25)
            }
            
            
            VStack{
                HStack{
                    Text("Password")
                        .padding(.leading, 25.0)
                    Spacer()
                }
                
                SecureField("********", text: $password)
                    .padding(.horizontal, 25.0)
                    .textFieldStyle(PlainTextFieldStyle())
                
                Rectangle()
                    .offset(y:-4)
                    .frame(height: 0.5)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 25)
            }.padding(.top,25)
            
           
            Spacer()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Login()
                
        }
    }
}
