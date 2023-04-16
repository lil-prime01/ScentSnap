//
//  PerfumeView.swift
//  
//
//  Created by 박리라 on 2023/04/15.
//

import SwiftUI

struct PerfumeView: View {
    var scentdata: ScentData
    var body: some View {
        Image("perfume")
            .overlay(CardView(scentdata: scentdata).offset(y: 51)
                .overlay(LabelView(scentdata: scentdata).offset(y:45)
                        )
            )
    }
}

struct PerfumeView_Previews: PreviewProvider {
    static var previews: some View {
        let scentdata = ScentData(name: "John", description: "hello", location: "dd", slider1: 1.0, slider2: 1.0, slider3: 1.0)
        PerfumeView(scentdata: scentdata)
    }
}
