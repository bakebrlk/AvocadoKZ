//
//  BusketProductCell.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

struct BasketProductCell: View {
    
    private let product: ProductModel
    @ObservedObject private var vm = ProductViewModel.shared
    
    init(product: ProductModel) {
        self.product = product
    }
    
    var body: some View {
        HStack{
           
            image
            
            information
            
            Spacer()
            
            price
        }
        .frame(maxWidth: .infinity, maxHeight: AppData.shared.size.height/8)
        .padding(.top)
    }
    
    private var price: some View {
        LazyVStack(alignment: .leading){
            AText.shared.text(text: "\(product.price - product.price * (product.discount ?? 0) / (-100)) ₸", size: 18, font: .bold, lineLimit: nil, alignment: .leading, padding: 0)
                .foregroundColor(.green)
            
            StrikethroughText(text: "\(product.price) ₸", color: .systemGray)
        }
        .frame(maxWidth: 60)
        .padding(.trailing)
    }
    
    
    private var information: some View {
        VStack(alignment: .leading){
            AText.shared.text(text: product.title, size: 14, font: .medium, lineLimit: 2, alignment: .leading, padding: 0)
            
            
            Spacer()
            
            HStack{
                
                Button(action: {
                    vm.minus()
                }, label: {
                    AvocadoKZ.image(systemName: "minus", size: 12)
                })
                .foregroundColor(.black)
                
                AText.shared.text(text: "\(product.whole * vm.count) г", size: 20, font: .regular)
                    .foregroundColor(Color(.systemGray6))
                
                Button(action: {
                    vm.plus()
                }, label: {
                    AvocadoKZ.image(systemName: "plus", size: 12)
                })
                .foregroundColor(.black)
                
            }
            .padding([.leading, .trailing])
            .background(Color.green)
            .clipShape(Capsule())
        }
        .padding([.top, .bottom])
    }
    
    private var image: some View {
        ZStack(alignment: .topTrailing){
            
            AsyncImage(url: product.imgURL, placeholder: {
                Text("Loading...")
            })
            .cornerRadius(8, corners: [.topLeft, .topRight, .bottomLeft])
            
            Image(systemName: vm.isLike ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.red)
                .padding(5)
                .onTapGesture {
                    withAnimation {
                        vm.isLike.toggle()
                    }
                }
        }
    }
}

#Preview {
    BasketProductCell(product: AppData.shared.product[0])
}
