//
//  LabelView.swift
//  
//
//  Created by 박리라 on 2023/04/15.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 250, height: 350)
            .border(.black, width: 10)
            .overlay(
                VStack{
                    Text("Hello, World!")
                        .font(.largeTitle)
                        .padding()
                    Text("Whrite a short description of the scent.")
                        .padding()
                        .font(.body)
                }
            )
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView()
    }
}
