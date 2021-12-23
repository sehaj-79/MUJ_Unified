//
//  LoginFuncs.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 22/12/21.
//

import Foundation
import Firebase

func CreateAccount(name:String, email:String, password:String){
    Auth.auth().createUser(withEmail: email, password: password) { Result, Error in
        if let Error = Error {
            print("Failed To Create Account", Error)
            return
        }
        print("Successfully Create Account")
    }
}

func LoginUser(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { Result, Error in
            if let Error = Error {
                print("Failed to login user:", Error)
                return
            }
            print("Successfully logged in as user: \(Result?.user.uid ?? "")")
        }
    }
