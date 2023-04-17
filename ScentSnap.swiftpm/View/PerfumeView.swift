//
//  PerfumeView.swift
//  
//
//  Created by 박리라 on 2023/04/15.
//

import SwiftUI

struct PerfumeView: View {
    var scentdata: ScentData
    @State public var isImageView: Bool = false
    var body: some View {
        VStack{
            Button(action: {
                isImageView.toggle()
            }) {
                Image("perfume")
                    .overlay(CardView(scentdata: scentdata).offset(y: 97)
                        .overlay(LabelView(scentdata: scentdata).offset(y:95))
                    )
            }
            .fullScreenCover(isPresented: $isImageView) {
                ImageView(scentdata: scentdata)
            }
            
        }
    }
    
    struct PerfumeView_Previews: PreviewProvider {
        static var previews: some View {
            let scentdata = ScentData(name: "John", description: "hello", location: "dd", slider1: 1.0, slider2: 0.0, slider3: 0.0)
            PerfumeView(scentdata: scentdata)
        }
    }
}

//
//    var body: some View {
//        VStack {
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 50) {
//                    NavigationLink(destination: ImageView(scentdata: scentdata)) {
//                        ForEach(scents) { scentdata in
//                            PerfumeView(scentdata: scentdata)
//                        }
//                    }
//                }
//                .padding()
//            }
//
