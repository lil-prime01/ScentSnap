//
//  PerfumeView.swift
//  
//
//  Created by 박리라 on 2023/04/15.
//

import SwiftUI

struct PerfumeView: View {
    var body: some View {
        Image("perfume")
            .overlay(CardView().offset(y: 51)
                .overlay(LabelView().offset(y:45)
                        )
            )
    }
}

struct PerfumeView_Previews: PreviewProvider {
    static var previews: some View {
        PerfumeView()
    }
}
