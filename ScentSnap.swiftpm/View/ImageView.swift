//
//  ImageView.swift
//
//
//  Created by 박리라 on 2023/04/16.
//

import SwiftUI

struct ImageView: View {
    var scentdata: ScentData
    @Environment(\.presentationMode) var presentationMode
    
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
        .overlay(ParticleEffect(scentdata:scentdata))
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
            }
        )
        .navigationTitle(scentdata.name)
    }
}
