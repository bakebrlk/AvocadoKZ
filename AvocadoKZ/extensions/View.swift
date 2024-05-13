//
//  View.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 08.05.2024.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func offset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        
        return progress > 0 ? progress * -30 : progress * 30
    }

    func scale(_ proxy: GeometryProxy) -> CGFloat {
        let progress = min(max(progress(proxy), -1), 1)
        
        return progress > 0 ? 1 + progress : 1 - progress
    }

    func progress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width
        let minX = (proxy.bounds(of: .scrollView)?.minX ?? 0)
        
        return minX / viewWidth
    }
    
}
