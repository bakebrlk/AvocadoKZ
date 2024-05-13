//
//  ProductModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 13.05.2024.
//

import SwiftUI

struct ProductModel: Codable {
    let name: String
    let price: String
}

struct ProductView: View {
    
    var body: some View{
        product(ProductModel(name: "", price: ""))
    }
    
    func product(_ product: ProductModel) -> some View {
        VStack{
            
            Spacer()
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(.mint)
                .cornerRadius(20, corners: .allCorners)
                .padding()
                .visualEffect { view, proxy in
                    view
                        .offset(y: offset(proxy))
                        .offset(y: scale(proxy) * 15)
                }
            
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .background(Color.cyan)
        .cornerRadius(16, corners: .allCorners)
        .padding()
       
    }
}
