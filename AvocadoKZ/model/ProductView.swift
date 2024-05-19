//
//  ProductView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 20.05.2024.
//

import SwiftUI

struct ProductView: View {
    
    private let product: ProductModel
    
    @ObservedObject private var vm = ProductViewModel()
    
    init(_ product: ProductModel){
        self.product = product
    }
    
    var body: some View {
        productView()
            .frame(maxWidth: AppData.shared.size.width/2, maxHeight: AppData.shared.size.height/3)
       
    }
    
    private func productView() -> some View {
  
        LazyVStack{
            
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: product.imgURL, placeholder: {
                    Text("Loading...")
                })
                .cornerRadius(8, corners: [.topLeft, .topRight])
                
                Image(systemName: vm.isLike ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
                    .padding()
                    .onTapGesture {
                        vm.isLike.toggle()
                    }
            
            }
                        
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
