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
            
            Spacer(minLength: 150)
            
            Text("MUJ\nUNIFIED")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 150)
            
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
                
                HStack {
                    SecureField("********", text: $password)
                        .padding(.horizontal, 25.0)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Forgot Pasword")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                    }.padding(.trailing,25)
                }
                
                Rectangle()
                    .offset(y:-4)
                    .frame(height: 0.5)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 25)
            }.padding(.top,25)
            

            Spacer()
            
            Button {
                
            } label: {
                Text("Sign In")
                    .font(.title3)
                    .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(20.0)
                    .padding(25)
            }

           
            HStack {
                Text("Don't have an Account?")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        .bold()
                }
            }
        
            
            //Spacer()
            
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
