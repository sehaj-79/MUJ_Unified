//
//  ARGuidance.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 02/01/22.
//

import SwiftUI
import RealityKit

struct ARGuidance: View {
    
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer : UIViewRepresentable{
    
    func makeUIView(context: Context) -> some UIView {
        let arView = ARView(frame: .zero)
        return arView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct ARGuidance_Previews: PreviewProvider {
    static var previews: some View {
        ARGuidance()
    }
}
