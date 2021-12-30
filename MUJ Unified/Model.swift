//
//  Model.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 27/12/21.
//

import Foundation

public var myUserID : String = ""

struct Restaurant : Identifiable {
    
    var id: String      //Name
    var Contact : Int
    
}

struct Categories  : Identifiable {
    var id : String     //Name
    //var Amount : Int
}

struct Items  : Identifiable {
    var id : String     //Name
    var Amount : Int
}



