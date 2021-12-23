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
        
        let db = Firestore.firestore()
        let collection = db.collection("Users")
        let userID = Result?.user.uid
        collection.document(userID!).setData(["ID":userID!,"Name":name,"Email":email,"Password":password])
        
        print("Successfully Create Account")
    }
}
