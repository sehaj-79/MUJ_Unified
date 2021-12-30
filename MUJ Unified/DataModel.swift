//
//  DataModel.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 27/12/21.
//

import Foundation
import Firebase

class DataModel : ObservableObject{
    
    @Published var list1 = [Restaurant]()
    @Published var list2 = [Categories]()
    @Published var list3 = [Items]()
    
    
    func getData(){
        let db = Firestore.firestore()
        db.collection("Restaurants").getDocuments { snapshot, error in
            if error == nil{
                //No Errors
                if let snapshot = snapshot{
                    
                    //Update List Property in Main Thread
                    DispatchQueue.main.async {
                        
                        self.list1 = snapshot.documents.map { d in
                            //Creates a Restaurant item for each document returned
                            Restaurant(id: d.documentID, Contact: d["Contact"] as! Int)
                        }
                    }
                }
            }
            else{
                //Handle Errors
            }
        }
    }
    

    func getMenuData(doc : String){
        let db = Firestore.firestore()
        db.collection("Restaurants").document(doc).collection("Menu").getDocuments { snapshot, error in
            if error == nil{
                //No Errors
                if let snapshot = snapshot{
                    
                    //Update List Property in Main Thread
                    DispatchQueue.main.async {
                        self.list2 = snapshot.documents.map { d in
                            //Creates a Categories item for each document returned
                            Categories(id: d.documentID)
                        }
                    }
                }
            }
            else{
                //Handle Errors
            }
        }
    }
    
    func getItemData(doc1 : String, doc2 : String){
        let db = Firestore.firestore()
        db.collection("Restaurants").document(doc1).collection("Menu").document(doc2).collection("Collection").getDocuments { snapshot, error in
            if error == nil{
                //No Errors
                if let snapshot = snapshot{
                    
                    //Update List Property in Main Thread
                    DispatchQueue.main.async {
                        self.list3 = snapshot.documents.map { d in
                            //Creates a Categories item for each document returned
                            Items(id: d["Name"] as! String, Amount: d["Amount"] as! Int)
                        }
                    }
                }
            }
            else{
                //Handle Errors
            }
        }
    }
}
