//
//  SwiftUIView.swift
//  
//
//  Created by 박리라 on 2023/04/12.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        
        VStack{
            MeshGradient()
                .cornerRadius(15)
                .frame(width: 425, height: 550,alignment: .center)
        }

    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
