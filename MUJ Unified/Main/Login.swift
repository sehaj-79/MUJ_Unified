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
        ZStack {
            
            Color(red: 27/255, green: 31/255, blue: 34/255)
            
            VStack {
                Spacer()
                Image("MUJ Unified")
                Spacer()
                
                HStack {
                    Image("Log In").padding(.leading, 20)
                    Spacer()
                }.padding()
                
                
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
                            .textInputAutocapitalization(.never)
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
                
                
                Spacer()
                
                Button {
                    
                    if (email.isEmpty || password.isEmpty){
                        self.allDetails = true
                    }
                    
                    else{
                        LoginUser(email: email,password: password)
                    }
                    
                } label: {
                    ZStack {
                        Image("Button BG")
                        Text("LOG IN")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 216/255, green: 165/255, blue: 148/255))
                            .font(.title2)
                    }
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
                Spacer()
                
            }.alert(isPresented: $allDetails, content: {
                Alert(title: Text("Error"),message: Text("Please Fill Email & Password"),
                      dismissButton: .default(Text("OK")))
            })
            
            NavigationLink(destination: Register(),isActive : $SignUpIntent) {
                EmptyView()
            }
            
            NavigationLink(destination: HomeNavBar(),isActive : $HomePageIntent) {
                EmptyView()
            }
            
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .onAppear{
                if Auth.auth().currentUser != nil {
                    // User is signed in.
                    HomePageIntent = true
                    let user = Auth.auth().currentUser
                    print("User Logged In As - \(String(describing: user))")
                } else {
                    // No user is signed in.
                    print("User Not Logged In")
                }
            }
        
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
            Login().previewDevice("iPhone 13 Pro")
        }
    }
}
