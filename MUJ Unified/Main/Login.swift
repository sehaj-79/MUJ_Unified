//
//  Login.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 18/12/21.
//

import SwiftUI
import Firebase

struct Login: View {
    
    @State var email:String = ""
    @State var password:String = ""
    @State var SignUpIntent:Bool = false
    @State var HomePageIntent:Bool = false
    @State var allDetails:Bool = false
    
    var body: some View {
            VStack {
                Spacer()
                
                Text("MUJ\nUNIFIED")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .offset(y: -20)
                
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
                    }.alert(isPresented: $allDetails, content: {
                        Alert(title: Text("Error"),message: Text("Please Fill Email & Password"),
                              dismissButton: .default(Text("OK")))
                    })
                    
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
               
                Button {
                    
                    if (email.isEmpty || password.isEmpty){
                        self.allDetails = true
                    }
                    
                    else{
                        LoginUser(email: email,password: password)
                    }
                    
                } label: {
                    Text("Sign In")
                        .font(.title3)
                        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(20.0)
                        .padding(30)
                }

               
                HStack {
                    Text("Don't have an Account?")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    
                    Button {
                        self.SignUpIntent = true
                    } label: {
                        Text("Sign Up")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                            .bold()
                    }
                }
                
                NavigationLink(destination: Register(),isActive : $SignUpIntent) {
                    EmptyView()
                }
                
                NavigationLink(destination: ContentView(),isActive : $HomePageIntent) {
                    EmptyView()
                }
                
        }.navigationBarBackButtonHidden(true)
    }
    
    func LoginUser(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { Result, Error in
            if let Error = Error {
                print("Failed to login user:", Error)
                return
            }
            print("Successfully logged in as user: \(Result?.user.uid ?? "")")
            self.HomePageIntent = true
            
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
