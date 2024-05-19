
import SwiftUI

struct BottomCurveRectangle: Shape {
    
    func path(in r: CGRect) -> Path {
        
        let radius: CGFloat = 8
        
        let percentOfHight = 0.93
        
        let tl = CGPoint(x: r.minX + radius, y: r.minY)
        let tlc = CGPoint(x: r.minX + radius, y: r.minY + radius)
        
        let tr = CGPoint(x: r.maxX, y: r.minY + radius)
        let trc = CGPoint(x: r.maxX - radius, y: r.minY + radius)
        
        let br = CGPoint(x: r.maxX - radius, y: r.maxY * percentOfHight)
        let brc = CGPoint(x: r.maxX - radius, y: r.maxY * percentOfHight - radius)
        
        let bl = CGPoint(x: r.minX, y: r.maxY * percentOfHight - radius)
        let blc = CGPoint(x: r.minX + radius, y: r.maxY * percentOfHight - radius)
        
        var path = Path()
        
        path.move(to: tlc)
        
        path.addRelativeArc(center: tlc, radius: radius, startAngle: Angle(degrees: 270), delta: Angle(degrees: -90))
        
        path.addLine(to: bl)
        
        path.addRelativeArc(center: blc, radius: radius, startAngle: Angle(degrees: 180), delta: Angle(degrees: -90))
        
        path.addQuadCurve(to: br, control: CGPoint(x: r.midX, y: r.maxY))

        path.addRelativeArc(center: brc, radius: radius, startAngle: Angle(degrees: 90), delta: Angle(degrees: -90))
     
        path.addLine(to: tr)

        path.addRelativeArc(center: trc, radius: radius, startAngle: Angle(degrees: 360), delta: Angle(degrees: -90))
        
        path.addLine(to: tl)
        
        return path
    }
}
