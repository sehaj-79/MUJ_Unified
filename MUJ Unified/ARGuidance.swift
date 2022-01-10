//
//  ARGuidance.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 02/01/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ARGuidance: View {
    
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer().edgesIgnoringSafeArea(.all)
            
            
            HStack{
                Button {
                    print("checkmark pressed")
                } label: {
                    Text("Place")
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                        .padding(20)
                        .opacity(0.75)
                }

            }
        }
    }
}

struct ARViewContainer : UIViewRepresentable{
    
    func makeUIView(context: Context) -> some UIView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        
        return arView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        let modelEntity = try! ModelEntity.loadModel(named: "arrow.usdz")
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(modelEntity)
        
        uiView.scene.addAnchor(anchorEntity)
        
        
    }
}

struct ARGuidance_Previews: PreviewProvider {
    static var previews: some View {
        ARGuidance()
    }
}
