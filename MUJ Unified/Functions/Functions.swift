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

func AddToCart(RName : String, item : String, amount : Int){
    let db = Firestore.firestore()
    var quantity : Int = 0
    var check : Bool = false
    db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").getDocuments { snapshot, error in
        for doc in snapshot!.documents{
            if doc["Item Name"] as! String == item{
                quantity = doc["Quantity"] as! Int
                quantity+=1
                db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").document(doc.documentID).setData(["Quantity" : quantity], merge: true)
                check = true
                break
            }
        }
        if check==false{
            db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").document().setData(["Item Name" : item, "Quantity":1, "Amount": amount])
        }
    }
}
    
func QuantityIncrease(RName : String, item : String){
    let db = Firestore.firestore()
    var quantity : Int = 1
    db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").getDocuments { snapshot, error in
        for doc in snapshot!.documents{
            if doc["Item Name"] as! String == item{
                quantity = doc["Quantity"] as! Int
                quantity+=1
                db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").document(doc.documentID).setData(["Quantity" : quantity], merge: true)
                break
            }
        }
    }
}

func QuantityDecrease(RName : String, item : String){
    let db = Firestore.firestore()
    var quantity : Int = 1
    db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").getDocuments { snapshot, error in
        for doc in snapshot!.documents{
            if doc["Item Name"] as! String == item{
                quantity = doc["Quantity"] as! Int
                quantity-=1
                if quantity==0{
                    showAlertGlobal = true
                }
                else{
                    db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").document(doc.documentID).setData(["Quantity" : quantity], merge: true)
                }
                break
            }
        }
    }
}

func QuantityRemove(RName : String, item : String){
    let db = Firestore.firestore()
    db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").getDocuments { snapshot, error in
        for doc in snapshot!.documents{
            if doc["Item Name"] as! String == item{
                db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").document(doc.documentID).delete()
                showAlertGlobal = false
                break
            }
        }
    }
}

func CalcBill(RName : String){
    let db = Firestore.firestore()
    var bill : Int = 0
    db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").getDocuments { snapshot, error in
        for doc in snapshot!.documents{
            let amount : Int = doc["Amount"] as! Int
            let quantity : Int = doc["Quantity"] as! Int
            bill = bill + (amount*quantity)
            billAmount = bill
        }
    }
}

func PlaceOrder(RName : String){
    let db = Firestore.firestore()
    db.collection("Cart & Orders").document(RName).collection(myUserID).document("Cart").collection("Collection").getDocuments { snapshot, error in
        for doc in snapshot!.documents{
            db.collection("Cart & Orders").document(RName).collection(myUserID).document("Orders").collection("Collection").document(doc.documentID).setData(["Item Name" : doc["Item Name"], "Quantity": doc["Quantity"], "Amount":doc["Amount"]])
        }
    }
}
