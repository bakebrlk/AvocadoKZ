//
//  CurveRectangle.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 13.05.2024.
//

import SwiftUI

struct CurveRectangle: Shape {
    
    func path(in r: CGRect) -> Path {
        
        let radius: CGFloat = 8
        
        let tl = CGPoint(x: r.minX + radius, y: r.minY)
        let tlc = CGPoint(x: r.minX + radius, y: r.minY + radius)
        
        let tr = CGPoint(x: r.maxX, y: r.minY + radius)
        let trc = CGPoint(x: r.maxX - radius, y: r.minY + radius)
        
        let br = CGPoint(x: r.maxX - radius, y: r.maxY * 0.75)
        let brc = CGPoint(x: r.maxX - radius, y: r.maxY * 0.75 - radius)
        
        let bl = CGPoint(x: r.minX, y: r.maxY * 0.75 - radius)
        let blc = CGPoint(x: r.minX + radius, y: r.maxY * 0.75 - radius)
        
        var path = Path()
        
        path.move(to: tlc)
        
        path.addRelativeArc(center: tlc, radius: radius, startAngle: Angle(degrees: 270), delta: Angle(degrees: -90))
        
        path.addLine(to: bl)
        
        path.addRelativeArc(center: blc, radius: radius, startAngle: Angle(degrees: 180), delta: Angle(degrees: -90))
        
        path.addQuadCurve(to: br, control: CGPoint(x: r.midX, y: r.maxY))

        path.addRelativeArc(center: brc, radius: radius, startAngle: Angle(degrees: 90), delta: Angle(degrees: -90))
     
        path.addLine(to: tr)

        path.addRelativeArc(center: trc, radius: radius, startAngle: Angle(degrees: 360), delta: Angle(degrees: -90))
        
        path.addQuadCurve(to: tl, control: CGPoint(x: r.midX, y: r.midY/2) )
        
        return path
    }
}
