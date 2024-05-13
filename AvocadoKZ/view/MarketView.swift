//
//  MarketView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 13.05.2024.
//

import SwiftUI

struct MarketView: View {
    var body: some View {
        
        VStack{
            CurveRectangle()
               
//                .stroke(lineWidth: 2)
                .frame(maxWidth: 320, maxHeight: 100)
                .foregroundColor(.mint)
 
            //                .cornerRadius(28, corners: .bottomLeft)
                .padding()
        }
    }
}

#Preview {
    MarketView()
}

