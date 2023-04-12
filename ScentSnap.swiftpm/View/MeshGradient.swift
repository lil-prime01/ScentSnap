//
//  SwiftUIView.swift
//  
//
//  Created by 박리라 on 2023/04/11.
//

import SwiftUI

struct MeshGradient: View {
    @State var redPosition: CGPoint = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
    @State var bluePosition: CGPoint = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
    @State var purplePosition: CGPoint = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))

    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .position(redPosition)
                .onAppear {
                    self.moveCircle(for: .red)
                }
            
            Circle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .position(bluePosition)
                .onAppear {
                    self.moveCircle(for: .blue)
                }
            
            Circle()
                .fill(Color.purple)
                .frame(width: 200, height: 200)
                .position(purplePosition)
                .onAppear {
                    self.moveCircle(for: .purple)
                }
        }
        .blur(radius: 120.0)
    }
    
    func moveCircle(for color: UIColor) {
        let randomX = CGFloat.random(in: -50...300)
        let randomY = CGFloat.random(in: -50...450)
        let newPosition = CGPoint(x: randomX, y: randomY)
        withAnimation(.linear(duration: 3.0)) {
            switch color {
            case .red:
                self.redPosition = newPosition
            case .blue:
                self.bluePosition = newPosition
            case .purple:
                self.purplePosition = newPosition
            default:
                break
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.moveCircle(for: color)
        }
    }
}

struct MeshGradient_Previews: PreviewProvider {
    static var previews: some View {
        MeshGradient()
    }
}

