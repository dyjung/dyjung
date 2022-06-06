//
//  StillCameraView.swift
//  PhotoCard
//
//  Created by Doyoung Chung on 2022/06/04.
//

import SwiftUI

let blendImageName = "WID-small.jpg"
struct FilterDisplayView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                SwipeView().frame(minWidth: 0,
                                  maxWidth: .infinity,
                                  minHeight: 0,
                                  maxHeight: .infinity,
                                  alignment: .topLeading)
              //  Spacer().background(.green)
                Button(action: {print("button")}) {
                    Image("btn_shutter")
                        .resizable()
                        .frame(width: 70, height: 70)
                }.offset(y: -50)
            }

            HStack {
                Button(action: {print("button")}) {
                    Image("icon_filter")
                        .resizable()
                        .frame(width: 31, height: 31)
                }
                Spacer()
                Button(action: {print("button")}) {
                    Image("icon_bright")
                        .resizable()
                        .frame(width: 31, height: 31)
                }
                Spacer()
                Button(action: {print("button")}) {
                    Image("btn_shutter")
                        .resizable()
                        .frame(width: 52, height: 52)
                }
                Spacer()
                Button(action: {print("button")}) {
                    Image("icon_contrast")
                        .resizable()
                        .frame(width: 31, height: 31)
                }
                Spacer()
                Button(action: {print("button")}) {
                    Image("icon_library_basic")
                        .resizable()
                        .frame(width: 31, height: 31)
                }
            }.padding([.leading, .trailing], 20)
             .padding([.top, .bottom], 10)
             .background(Color.black)
            
          //  Spacer()
        }
    }
}

struct StillCameraView_Previews: PreviewProvider {
    static var previews: some View {
        FilterDisplayView()
    }
}
