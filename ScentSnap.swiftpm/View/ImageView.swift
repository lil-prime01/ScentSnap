//
//  SwiftUIView.swift
//  
//
//  Created by 박리라 on 2023/04/16.
//

import SwiftUI

struct ImageView: View {
    var scentdata: ScentData
    
    private var scentImage: UIImage? {
        guard let imageData = scentdata.imageData else { return nil }
        return UIImage(data: imageData)
    }
    
    var body: some View {
        VStack {
            if let image = scentImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("No image available")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle(scentdata.name)
    }
}
    struct ImageView_Previews: PreviewProvider {
        static var previews: some View {
            let scentdata = ScentData(name: "John", description: "hello", location: "dd", slider1: 1.0, slider2: 1.0, slider3: 1.0)
            return ImageView(scentdata: scentdata)
        }
    }
