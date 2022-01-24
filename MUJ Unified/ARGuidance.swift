//
//  ARGuidance.swift
//  MUJ Unified
//
//  Created by Shikhar Kumar on 02/01/22.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARGuidance: View {
    
    var body: some View {
        RealityKitView()
            .ignoresSafeArea()
    }
}

struct RealityKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let view = ARView()
        
        // Start AR session
        let session = view.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        // Add coaching overlay
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        view.addSubview(coachingOverlay)
        
        // Set debug options
//        #if DEBUG
//        view.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry]
//        #endif
        
        context.coordinator.view = view
        session.delegate = context.coordinator
        
        
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        return view
    }

    func updateUIView(_ view: ARView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, ARSessionDelegate {
        weak var view: ARView?
        var focusEntity: FocusEntity?

        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }
            debugPrint("Anchors added to the scene: ", anchors)
            self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
        }
        
        @objc func handleTap() {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }

            // Create a new anchor to add content to
            let anchor = AnchorEntity()
            view.scene.anchors.append(anchor)

            let diceEntity = try! ModelEntity.loadModel(named: "arrow")
            diceEntity.scale = [0.01, 0.01, 0.01]
            diceEntity.position = focusEntity.position

            anchor.addChild(diceEntity)
        }
        
        
    }
}

struct ARGuidance_Previews: PreviewProvider {
    static var previews: some View {
        ARGuidance()
    }
}
