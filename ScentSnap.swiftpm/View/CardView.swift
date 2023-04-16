//
//  CardView.swift
//  
//
//  Created by 박리라 on 2023/04/12.
//

//HStack(spacing: 20) {
//    ForEach(contacts) { contact in
//        ContactCard(contact: contact)
//            .frame(width: 300)
//    }
//}

import SwiftUI

struct CardView: View {
    var scentdata:ScentData
    
    var body: some View {
        VStack{
            MeshGradient(scentdata: scentdata)
                .cornerRadius(15)
                .frame(width: 425, height: 550,alignment: .center)
            
        }

    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let scentdata = ScentData(name: "John", description: "hello", location: "dd", slider1: 1.0, slider2: 1.0, slider3: 1.0)
        return CardView(scentdata: scentdata)
    }
}
