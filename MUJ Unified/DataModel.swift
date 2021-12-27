//
//  DataModel.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 27/12/21.
//

import Foundation
import Firebase

class DataModel : ObservableObject{
    
    @Published var list = [Restaurant]()
    
    func getData(){
        let db = Firestore.firestore()
        db.collection("Restaurants").getDocuments { snapshot, error in
            if error == nil{
                //No Errors
                if let snapshot = snapshot{
                    
                    //Update List Property in Main Thread
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            //Creates a Restaurant item for each document returned
                            return Restaurant(id: d.documentID, Contact: d["Contact"] as! Int)
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
