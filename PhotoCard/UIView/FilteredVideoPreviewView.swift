//
//  CameraView.swift
//  PhotoCard
//
//  Created by Doyoung Chung on 2022/06/06.
//

import Foundation
import SwiftUI
import GPUImage

struct FilteredVideoPreviewView: UIViewControllerRepresentable {
    var operation: ImageProcessingOperation
     
    init(operaion: ImageProcessingOperation) {
        self.operation = operaion
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<FilteredVideoPreviewView>) -> UIViewController {
        let controller = CameraViewController()
        controller.operation = self.operation as? BasicOperation
        return controller
    }
    
    // No values change so no need to return anything
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<FilteredVideoPreviewView>) {

    }
}

class CameraViewController : UIViewController {
    
    // GPUImage3 returns video output to a RenderView. Have tried different ways of doing this, but setting up as an IBOutlet works
    
   @IBOutlet weak var renderView: RenderView!
    
    // GPUImage3 camera values
    var camera:Camera!
    var operation:BasicOperation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCamera()
    }
    
    func loadCamera() {
        // Set frame for the video preview to display, as a RenderView
        let finalView = RenderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        // Standard GPUImage3 methods. GPUImage2 APIs still work, so we use the documentation to come up with the following
        do {
           // operation = GaussianBlur()
    
            camera = try Camera(sessionPreset: .vga640x480)
            camera.runBenchmark = true
            // Note that this would USUALLY be --> RenderView, but we can't return it to SwiftUI. Therefore we are returning to finalView
//            camera --> operation --> finalView
//            camera.startCapture()
//            
            DispatchQueue.global().async {
                // Note that this would USUALLY be --> RenderView, but we can't return it to SwiftUI. Therefore we are returning to finalView
                self.camera --> self.operation --> finalView
                self.camera.startCapture()
            }
        } catch {
            fatalError("Could not initialize rendering pipeline: \(error)")
        }
        // Attach camera preview video to view
        view.addSubview(finalView)
        
    }
}

