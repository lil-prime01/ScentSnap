//
//  LabelView.swift
//  
//
//  Created by 박리라 on 2023/04/15.
//

import SwiftUI

struct LabelView: View {
    var scentdata: ScentData
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 250, height: 300)
            .border(.black, width: 10)
            .overlay(
                VStack{
                    Text(scentdata.name)
                        .font(.largeTitle.bold())
                        .padding()
                    Text(scentdata.description)
                        .padding()
                        .font(.body.bold())
                    Text(scentdata.location)
                        .padding()
                        .font(.caption.bold())
                }
            )
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        let scentdata = ScentData(name: "John", description: "hello", location: "dd", slider1: 1.0, slider2: 1.0, slider3: 1.0)
        return LabelView(scentdata: scentdata)
    }
}
