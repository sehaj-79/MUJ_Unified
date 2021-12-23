//
//  MUJ_UnifiedApp.swift
//  MUJ Unified
//
//  Created by sehejbir bhasin on 16/12/21.
//

import SwiftUI
import Firebase

@main
struct MUJ_UnifiedApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Main()
        }
    }
}
