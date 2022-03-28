//
//  Register.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 20/12/21.
//

import SwiftUI

struct Register: View  {
    
    @Environment(\.presentationMode) var presentationMode
    @State var name:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var cpassword:String = ""
    @State var SignInIntent:Bool = false
    @State var incorrectPass:Bool = false
    @State var allDetails:Bool = false
    
    
    var body: some View {
        ZStack {
            
            Color(red: 27/255, green: 31/255, blue: 34/255)
            
            VStack() {
                
                Spacer()
                
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                        //self.SignInIntent = true
                    } label: {
                        Image("Back")
                    }.padding()
                    
                    Image("MUJ Unified Small")
                    Spacer()
                }
                
                HStack {
                    Image("Create Account").padding(.leading, 20)
                    Spacer()
                }.padding()
                
                
                
                VStack {
                    VStack {
                        ZStack(alignment: .leading) {
                            Text("Name")
                                .padding(.leading, 35)
                                .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                                .offset(x:$name.wrappedValue.isEmpty ? 0 : +11, y: $name.wrappedValue.isEmpty ? 0 : -25)
                                .scaleEffect($name.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
                            TextField("", text: $name)
                                .padding(.leading, 35)
                                .foregroundColor(Color.white)
                                .disableAutocorrection(true)
                        }.animation(.default)
                        
                        Image("line")
                    }.padding(.top, 35)
                    
                    VStack {
                        ZStack(alignment: .leading) {
                            Text("Email")
                                .padding(.leading, 35)
                                .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                                .offset(x:$email.wrappedValue.isEmpty ? 0 : +11, y: $email.wrappedValue.isEmpty ? 0 : -25)
                                .scaleEffect($email.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
                            TextField("", text: $email)
                                .padding(.leading, 35)
                                .foregroundColor(Color.white)
                                .disableAutocorrection(true)
                        }.animation(.default)
                        
                        Image("line")
                    }.padding(.top, 35)
                    
                    
                    VStack {
                        ZStack(alignment: .leading) {
                            Text("Password")
                                .padding(.leading, 35)
                                .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                                .offset(x:$password.wrappedValue.isEmpty ? 0 : +11, y: $password.wrappedValue.isEmpty ? 0 : -25)
                                .scaleEffect($password.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
                            SecureField("", text: $password)
                                .padding(.leading, 35)
                                .foregroundColor(Color.white)
                        }.animation(.default)
                            
                        Image("line")
                    }.padding(.top, 35)
                    
                    VStack {
                        ZStack(alignment: .leading) {
                            Text("Confirm Password")
                                .padding(.leading, 35)
                                .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                                .offset(x:$cpassword.wrappedValue.isEmpty ? 0 : +11, y: $cpassword.wrappedValue.isEmpty ? 0 : -25)
                                .scaleEffect($cpassword.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
                            SecureField("", text: $cpassword)
                                .padding(.leading, 35)
                                .foregroundColor(Color.white)
                        }.animation(.default)
                            
                        Image("line")
                    }.padding(.top, 35)
                }
                
                
                
                
                
                
                Spacer()
                
                Button {
                    
                    
                    if(!(name.isEmpty || email.isEmpty || password.isEmpty || cpassword.isEmpty)){
                        
                        if (password == cpassword) {
                            CreateAccount(name: name, email: email, password: password)
                        }
                        else{
                            self.incorrectPass = true
                        }
                        
                    }
                    else{
                        self.allDetails = true
                    }
                   
                    
                } label: {
                    ZStack {
                        Image("Button BG")
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 216/255, green: 165/255, blue: 148/255))
                            .font(.title2)
                    }
                }
                
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                        //self.SignInIntent = true
                    } label: {
                        Text("Log In")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                            .bold()
                    }
                }
                
                Spacer()
                
                
            }.alert(isPresented: $allDetails, content: {
                Alert(title: Text("Error"),message: Text("Please Fill Email & Password"),
                      dismissButton: .default(Text("OK")))
            })
            
            
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        
    }
    
}
struct Register2: View {
    
    @State var name:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var cpassword:String = ""
    @State var SignInIntent:Bool = false
    @State var incorrectPass:Bool = false
    @State var allDetails:Bool = false
    
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
                }.alert(isPresented: $allDetails, content: {
                    Alert(title: Text("Error"),message: Text("Please Fill all Fields"),
                          dismissButton: .default(Text("OK")))
                })
                
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
                }.alert(isPresented: $incorrectPass, content: {
                    Alert(title: Text("Error"),message: Text("Please Check Password"),
                          dismissButton: .default(Text("OK")))
                })
                
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
                
                if(!(name.isEmpty || email.isEmpty || password.isEmpty || cpassword.isEmpty)){
                    
                    if (password == cpassword) {
                        CreateAccount(name: name, email: email, password: password)
                    }
                    else{
                        self.incorrectPass = true
                    }
                    
                }
                else{
                    self.allDetails = true
                }
                
                
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
                    self.SignInIntent = true
                } label: {
                    Text("Sign In")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        .bold()
                }
            }
            
            NavigationLink(destination: Login(),isActive : $SignInIntent) {
                EmptyView()
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register().previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
    }
}
