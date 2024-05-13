//
//  EventScrollModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 12.05.2024.
//


import SwiftUI


struct EventScrollModel: View {
   
    let height: CGFloat = /*AppData.shared.size.height/4*/ 350
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let padding = (size.width - 70) / 2
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 35){
                    ForEach(1...8, id: \.self) {index in
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.mint)
                            .visualEffect { view, proxy in
                                view
                                    .offset(y: offset(proxy))
                                    .offset(y: scale(proxy) * 15)
                            }
                    }
                }
                .frame(height: size.height)
                .scrollTargetLayout()
            }
            .defaultScrollAnchor(.center)
            .safeAreaPadding(.horizontal, padding)
            .scrollTargetBehavior(.viewAligned)
            .frame(height: size.height)
        }
        .frame(height: height)
    }
    

}

