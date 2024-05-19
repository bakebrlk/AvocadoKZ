//
//  ProductModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 13.05.2024.
//

import SwiftUI

struct ProductModel: Codable {
    let imgURL: String
    let title: String
    let whole: String
    let price: Int
}

final class ProductView {
    
    func product(_ product: ProductModel) -> some View {
  
        LazyVStack{
            
            AsyncImage(url: product.imgURL, placeholder: {AText.shared.justText(text: "Loading...")})
                .cornerRadius(8, corners: [.topLeft, .topRight])
            
            LazyVStack{
                AText.shared.text(text: product.title, size: 14, font: .regular, lineLimit: 2)
                AText.shared.text(text: product.whole, size: 14, font: .light)
                    .padding(.top, 1)

                AText.shared.text(text: "\(product.price) ₸", size: 22, font: .medium)
                    .padding(.top, 1)
                    .padding(.bottom, 0)
                }
                
                Button(action: {}, label: {
                    AText.shared.justText(text: "Добавить +")
                        .frame(maxWidth: .infinity,minHeight: 50)
                        .background(
                            CurveRectangle()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color(.secondarySystemBackground))
                                .padding(.top, 5)
                        )
                        .foregroundColor(.green)
                        .padding([.leading, .trailing])
                        
                })
                .frame(maxWidth: .infinity)
                .padding(.bottom,25)
            }
            .background(
                BottomCurveRectangle()
                    .foregroundColor(Color(.systemBackground))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
            .padding(10)
            
    }

}

#Preview {
    ProductView()
}
