//
//  SwiftUIView.swift
//
//
//  Created by 박리라 on 2023/04/12.
//

import SwiftUI

struct ParticleEffect: View {
    @State private var touchLocation: CGPoint?
    @State private var previousLocation: CGPoint?
    
    var body: some View {
        ZStack {
            Color.white
            
            if let location = touchLocation {
                ParticleView(location: location)
            }
            
            if let start = previousLocation, let end = touchLocation {
                TraceView(start: start, end: end)
            }
        }
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged { value in
                previousLocation = touchLocation
                touchLocation = value.location
            }
            .onEnded { _ in
                previousLocation = nil
                touchLocation = nil
            }
        )
    }
}

struct ParticleView: UIViewRepresentable {
    let location: CGPoint
    
    func makeUIView(context: Context) -> UIView {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: 0, y: 0)
        emitter.emitterShape = .point
        emitter.renderMode = .additive
        
        let cell = CAEmitterCell()
        cell.birthRate = 30 // decrease birth rate
        cell.lifetime = 5 // decrease lifetime
        cell.velocity = 50
        cell.velocityRange = 200
        cell.emissionRange = .pi / 4
        cell.spinRange = 5
        cell.contents = UIImage(named: "particle")?.cgImage
        
        // Add fade-out animation to alphaRange
        cell.alphaRange = 2
        cell.alphaSpeed = -2 / cell.lifetime
        
        emitter.emitterCells = [cell]
        
        let view = UIView()
        view.layer.addSublayer(emitter)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard let emitter = uiView.layer.sublayers?.first as? CAEmitterLayer else { return }
        
        emitter.emitterPosition = location
    }
}

struct TraceView: UIViewRepresentable {
    let start: CGPoint
    let end: CGPoint
    
    func makeUIView(context: Context) -> UIView {
        let layer = CAShapeLayer()
        layer.fillColor = nil
        layer.strokeColor = UIColor.white.cgColor
        layer.lineWidth = 5
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        layer.path = path.cgPath
        
        let view = UIView()
        view.layer.addSublayer(layer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}


struct ParticleEffect_Previews: PreviewProvider {
    static var previews: some View {
        ParticleEffect()
    }
}
