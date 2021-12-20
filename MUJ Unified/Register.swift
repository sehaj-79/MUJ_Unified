//
//  Register.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 20/12/21.
//

import SwiftUI

struct Register: View {
    
    @State var name:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var cpassword:String = ""
    
    var body: some View {
        VStack {
            
            
            Spacer()
            
            HStack{
                Text("Create Account")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.leading, 25.0)
                    .padding(.bottom, 25.0)
                Spacer()
            }.padding(.bottom)

            
            
            VStack(){
                HStack{
                    Text("Name")
                        .padding(.leading, 25.0)
                    Spacer()
                }
                
                TextField("Your Name", text: $name)
                    .padding(.horizontal, 25.0)
                    .textFieldStyle(PlainTextFieldStyle())
                
                Rectangle()
                    .offset(y:-4)
                    .frame(height: 0.5)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 25)
            }
            
            
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
            }.padding(.top,25)
            
            
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
            
            VStack{
                HStack{
                    Text("Re-enter Password")
                        .padding(.leading, 25.0)
                    Spacer()
                }
                
                SecureField("********", text: $cpassword)
                    .padding(.horizontal, 25.0)
                    .textFieldStyle(PlainTextFieldStyle())
                                
                Rectangle()
                    .offset(y:-4)
                    .frame(height: 0.5)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 25)
            }.padding(.top,25)
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .font(.title3)
                    .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(20.0)
                    .padding(30)
            }

           
            HStack {
                Text("Already have an Account?")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                
                Button {
                    
                } label: {
                    Text("Sign In")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        .bold()
                }
            }
            
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
