import SwiftUI
import CoreImage.CIFilterBuiltins


struct ParticleEffect: View {
    @State private var touchLocation: CGPoint?
    @State private var previousLocation: CGPoint?
    var scentdata: ScentData

    var body: some View {
        
        ZStack {
            Color.white.opacity(0.001)
                .edgesIgnoringSafeArea(.all)
            
            if let location = touchLocation {
                ParticleView(location: location, scentdata: scentdata)
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

func circleImage(size: CGSize, color: UIColor, blurRadius: CGFloat = 10) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    let context = UIGraphicsGetCurrentContext()
    
    context?.setFillColor(color.cgColor)
    context?.fillEllipse(in: CGRect(origin: .zero, size: size))
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    guard let inputImage = CIImage(image: image!) else { return nil }
    let contextCI = CIContext(options: nil)
    let filter = CIFilter.gaussianBlur()
    filter.inputImage = inputImage
    filter.radius = Float(blurRadius)
    
    guard let outputImage = filter.outputImage else { return nil }
    guard let cgImage = contextCI.createCGImage(outputImage, from: inputImage.extent) else { return nil }
    
    return UIImage(cgImage: cgImage)
}



struct ParticleView: UIViewRepresentable {
    let location: CGPoint
    var scentdata: ScentData
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 30
        cell.lifetime = 5
        cell.velocity = 50
        cell.velocityRange = 200
        cell.emissionRange = .pi / 4
        cell.spinRange = 5
        if let cgImage = circleImage(size: CGSize(width: 10, height: 10), color: color)?.cgImage {
            cell.contents = cgImage
        }
        cell.alphaRange = 2
        cell.alphaSpeed = -2 / cell.lifetime
        return cell
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: 0, y: 0)
        emitter.emitterShape = .point
        emitter.renderMode = .additive
        
        let color1 = UIColor(scentdata.color1)
        let color2 = UIColor(scentdata.color2)
        let color3 = UIColor(scentdata.color3)

        let cell1 = makeEmitterCell(color: color1)
        let cell2 = makeEmitterCell(color: color2)
        let cell3 = makeEmitterCell(color: color3)
        
        emitter.emitterCells = [cell1, cell2, cell3]
        
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
        let scentdata = ScentData(name: "John", description: "hello", date: date, location: "dd", slider1: 0.1, slider2: 0.9, slider3: 0.3)

        return ParticleEffect(scentdata: scentdata)
    }
}
