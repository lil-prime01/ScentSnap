//
//  BlobView.swift
//
//
//  Created by 박리라 on 2023/04/18.
//

import SwiftUI


struct BlobView: View {
    @State var appear = false
    var scentdata: ScentData
    
    var body: some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 20)
            let x = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 5) * 10)
            let x2 = cos(angle2.radians)
            let angle3 = Angle.degrees(now.remainder(dividingBy: 2) * 20)
            let x3 = cos(angle3.radians)
            
            Canvas { context, size in context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, x2: x2, x3: x3), with: .linearGradient(Gradient(colors: [scentdata.color1, scentdata.color2, scentdata.color3]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 800, y: 800)))
            }
            .frame(width: 800, height: 800)
            .rotationEffect(.degrees(appear ? 360 : 0))
        }
        .blur(radius: 10)
        .opacity(0.2)
        .onAppear {
            withAnimation(.linear(duration: 30).repeatForever()) {
                appear = true
            }
        }
    }
    
    func path(in rect: CGRect, x: Double, x2: Double, x3: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.85458*width, y: 0.24105*height*x3))
        path.addCurve(to: CGPoint(x: 0.40923*width*x, y: 0.02554*height), control1: CGPoint(x: 0.85458*width, y: 0.09865*height*x), control2: CGPoint(x: 0.61718*width*x, y: -0.06304*height*x2))
        path.addCurve(to: CGPoint(x: 0.07954*width*x2, y: 0.34292*height*x), control1: CGPoint(x: 0.21554*width*x, y: 0.10804*height*x2), control2: CGPoint(x: 0.15301*width*x, y: 0.20288*height*x2))
        path.addCurve(to: CGPoint(x: 0.04432*width*x, y: 0.8074*height*x2), control1: CGPoint(x: 0.00482*width*x, y: 0.48536*height), control2: CGPoint(x: -0.03609*width*x, y: 0.70683*height*x2))
        path.addCurve(to: CGPoint(x: 0.69156*width*x2, y: 0.99237*height*x2), control1: CGPoint(x: 0.14481*width*x, y: 0.93306*height), control2: CGPoint(x: 0.54705*width*x3, y: 1.02698*height*x2))
        path.addCurve(to: CGPoint(x: 0.99362*width*x2, y: 0.73517*height*x2), control1: CGPoint(x: 0.88646*width*x2, y: 0.94568*height*x2), control2: CGPoint(x: 0.96961*width*x2, y: 0.88285*height))
        path.addCurve(to: CGPoint(x: 0.85458*width, y: 0.24105*height*x3), control1: CGPoint(x: 1.0343*width*x2, y: 0.48503*height*x), control2: CGPoint(x: 0.85458*width*x2, y: 0.46565*height*x3))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        let scentdata = ScentData(name: "John", description: "hello", date: date, location: "dd", slider1: 0.0, slider2: 0.0, slider3: 0.0)
        return BlobView(scentdata: scentdata)
        
    }
}

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.85458*width, y: 0.24105*height))
        path.addCurve(to: CGPoint(x: 0.40923*width, y: 0.02554*height), control1: CGPoint(x: 0.85458*width, y: 0.09865*height), control2: CGPoint(x: 0.61718*width, y: -0.06304*height))
        path.addCurve(to: CGPoint(x: 0.07954*width, y: 0.34292*height), control1: CGPoint(x: 0.21554*width, y: 0.10804*height), control2: CGPoint(x: 0.15301*width, y: 0.20288*height))
        path.addCurve(to: CGPoint(x: 0.04432*width, y: 0.8074*height), control1: CGPoint(x: 0.00482*width, y: 0.48536*height), control2: CGPoint(x: -0.03609*width, y: 0.70683*height))
        path.addCurve(to: CGPoint(x: 0.69156*width, y: 0.99237*height), control1: CGPoint(x: 0.14481*width, y: 0.93306*height), control2: CGPoint(x: 0.54705*width, y: 1.02698*height))
        path.addCurve(to: CGPoint(x: 0.99362*width, y: 0.73517*height), control1: CGPoint(x: 0.88646*width, y: 0.94568*height), control2: CGPoint(x: 0.96961*width, y: 0.88285*height))
        path.addCurve(to: CGPoint(x: 0.85458*width, y: 0.24105*height), control1: CGPoint(x: 1.0343*width, y: 0.48503*height), control2: CGPoint(x: 0.85458*width, y: 0.46565*height))
        path.closeSubpath()
        return path
    }
}
