//
//  Login.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 18/12/21.
//

import SwiftUI
import Firebase


struct Login: View {
    
    @State var email : String = ""
    @State var password : String = ""
    
    
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
                    }.animation(.default)
                        
                    Image("line")
                }.padding(.top, 25)
                
                
                VStack {
                    ZStack(alignment: .leading) {
                        Text("Password")
                            .padding(.leading, 35)
                            .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                            .offset(x:$password.wrappedValue.isEmpty ? 0 : +11, y: $password.wrappedValue.isEmpty ? 0 : -25)
                            .scaleEffect($password.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
                        TextField("", text: $password)
                            .padding(.leading, 35)
                    }.animation(.default)
                        
                    Image("line")
                }.padding(.top, 25)
                
                
                Spacer()
                Spacer()
            }
            
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        
    }
}


struct Login2: View {
    
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
