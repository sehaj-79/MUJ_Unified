//
//  LoginFuncs.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 22/12/21.
//

import Foundation
import Firebase

func CreateAccount(email:String, password:String){
    Auth.auth().createUser(withEmail: email, password: password) { Result, Error in
        if let Error = Error {
            print("Failed To Create Account", Error)
            return
        }
        print("Successfully Create Account")
    }
}
