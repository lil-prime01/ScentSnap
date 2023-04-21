//
//  PerfumeView.swift
//
//
//  Created by 박리라 on 2023/04/15.
//

import SwiftUI
import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
var perfumeWidth = screenWidth*0.5
var perfumeHeight = perfumeWidth * 1.77

var space = screenWidth * 0.2

var cardWidth = perfumeWidth * 0.88
var cardHeight = cardWidth * 0.978

var labelWidth = perfumeWidth * 0.5
var labelHeight = labelWidth * 1.0

struct PerfumeView: View {
    var scentdata: ScentData
    @State public var isImageView: Bool = false
    var body: some View {
        ZStack {
            BlobView(scentdata: scentdata)
            VStack{
                Button(action: {
                    isImageView.toggle()
                }) {
                    Image("perfume")
                        .resizable()
                        .frame(width: perfumeWidth, height: perfumeHeight)
                        .overlay(
                            CardView(scentdata: scentdata)
                                .offset(y: perfumeHeight*0.108)
                                .overlay(
                                    LabelView(scentdata: scentdata)
                                        .offset(y: perfumeHeight*0.11)
                                )
                        )
                }
                .fullScreenCover(isPresented: $isImageView) {
                    ImageView(scentdata: scentdata)
                }
                
            }
             
        }
    }
}

struct PerfumeView_Previews: PreviewProvider {
    static var previews: some View {
        let scentdata = ScentData(name: "John", description: "hello", date: date, location: "dd", slider1: 0.1, slider2: 0.9, slider3: 0.3)
        PerfumeView(scentdata: scentdata)
    }
}
