//
//  FilteredPhotoView.swift
//  PhotoCard
//
//  Created by Doyoung Chung on 2022/06/05.
//

import Foundation
import SwiftUI
import GPUImage

struct FilteredPhotoView: UIViewRepresentable {
    
    let operation: ImageProcessingOperation
     
    init(operaion: ImageProcessingOperation) {
        self.operation = operaion
    }
    
    func makeUIView(context: Self.Context) -> UIView {
        let testImage = UIImage(named:"photo")!
        let inversionFilter = ColorInversion()
       // let inversionFilter = operation
        let filteredImage = testImage.filterWithOperation(inversionFilter)
        // We then take the image and assign it to a view returned via UIViewRepresentable
        let imageView = UIImageView(image: filteredImage)
        return imageView
    }

    func updateUIView(_ uiView: UIView, context: Self.Context) {
        
    }
}
