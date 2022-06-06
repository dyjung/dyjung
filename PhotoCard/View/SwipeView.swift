//
//  SwipeView.swift
//  PhotoCard
//
//  Created by Doyoung Chung on 2022/06/04.
//

import SwiftUI
import GPUImage

struct SwipeView: View {
    private let colors: [SwiftUI.Color] = [.red, .blue, .green]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TabView {
                    ForEach(filterOperations, id: \.self.listName) { operation in
                        ZStack {
                            FilteredVideoPreviewView(operaion: operation.filter)
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        }
                    }
                }.tabViewStyle(.page)
            }
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
