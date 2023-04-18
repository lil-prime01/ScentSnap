//
//  CardView.swift
//
//
//  Created by 박리라 on 2023/04/12.
//


import SwiftUI

struct InnerShadow: ViewModifier {
    var color: Color = .black
    var radius: CGFloat = 0.1
    var opacity: Double = 0.1
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(color.opacity(opacity), lineWidth: radius)
                    .blur(radius: radius)
                    .offset(x: radius, y: radius)
                    .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(gradient: Gradient(colors: [Color.black, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(color.opacity(opacity), lineWidth: radius)
                    .blur(radius: radius)
                    .offset(x: -radius, y: -radius)
                    .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(gradient: Gradient(colors: [Color.black, .clear]), startPoint: .bottomTrailing, endPoint: .topLeading)))
            )
    }
}
struct CardView: View {
    var scentdata: ScentData
    
    var body: some View {
        VStack {
            MeshGradient(scentdata: scentdata)
                .cornerRadius(15)
                .frame(width: cardWidth, height: cardHeight*1.29, alignment: .center)
                .modifier(InnerShadow(radius: 5.0, opacity: 0.05))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let scentdata = ScentData(name: "John", description: "hello",date: date, location: "dd", slider1: 1.0, slider2: 1.0, slider3: 1.0)
        return CardView(scentdata: scentdata)
    }
}
