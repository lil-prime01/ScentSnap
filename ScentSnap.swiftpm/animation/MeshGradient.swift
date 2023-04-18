//
//  SwiftUIView.swift
//
//
//  Created by 박리라 on 2023/04/11.
//




import SwiftUI

struct MeshGradient: View {
    var scentdata: ScentData
    
    @State var circle1Position: CGPoint = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
    @State var circle2Position: CGPoint = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
    @State var circle3Position: CGPoint = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))

    
    var body: some View {
        ZStack {
            Circle()
                .fill(scentdata.color1)
                .frame(width: 200, height: 200)
                .position(circle1Position)
                .onAppear {
                    self.moveCircle(for: 0) // Update the identifier
                }
            
            Circle()
                .fill(scentdata.color2)
                .frame(width: 200, height: 200)
                .position(circle2Position)
                .onAppear {
                    self.moveCircle(for: 1) // Update the identifier
                }
            
            Circle()
                .fill(scentdata.color3)
                .frame(width: 200, height: 200)
                .position(circle3Position)
                .onAppear {
                    self.moveCircle(for: 2) // Update the identifier
                }
        }
        .blur(radius: 120.0)
    }
    
    func moveCircle(for id: Int) { // Change the parameter type to Int
        let randomX = CGFloat.random(in: -50...475)
        let randomY = CGFloat.random(in: -50...600)
        let newPosition = CGPoint(x: randomX, y: randomY)
        withAnimation(.linear(duration: 3.0)) {
            switch id { // Update the switch statement to use the new identifiers
            case 0:
                self.circle1Position = newPosition
            case 1:
                self.circle2Position = newPosition
            case 2:
                self.circle3Position = newPosition
            default:
                break
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.moveCircle(for: id)
        }
    }
}

struct MeshGradient_Previews: PreviewProvider {
    static var previews: some View {
        let scentdata = ScentData(name: "John", description: "hello", date: date, location: "dd", slider1: 1.0, slider2: 1.0, slider3: 1.0)
        return MeshGradient(scentdata: scentdata)
    }
}

