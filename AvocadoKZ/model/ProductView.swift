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
                        withAnimation {
                            vm.isLike.toggle()
                        }
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
                
                addBasket
            }
            .background(
                BottomCurveRectangle()
                    .foregroundColor(Color(.systemBackground))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
            .padding(10)
            
    }

    private var addBasket: some View {
        Group {
            
            if vm.addBasket {
                
                HStack{
                    image(systemName: "trash", size: 18)
                        .foregroundColor(.white)
                        .onTapGesture {
                            withAnimation {
                                vm.count = 0
                                vm.addBasket.toggle()
                            }
                        }
                    
                    AText.shared.justText(text: "\(vm.count)шт")
                        .foregroundColor(.white)
                        .padding([.top, .bottom])
                    
                    image(systemName: "plus", size: 15)
                        .foregroundColor(.white)
                        .onTapGesture {
                            vm.count += 1
                        }
                }
                .padding([.leading, .trailing])
                
            }else {
                Button(action: {
                    withAnimation {
                        vm.addBasket.toggle()
                        vm.count = 1
                    }
                }, label: {
                    AText.shared.justText(text: "Добавить +")
                        .frame(maxWidth: .infinity,minHeight: 50)
                        .foregroundColor(.green)
                    
                })
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            CurveRectangle()
                .frame(maxWidth: .infinity)
                .foregroundColor(vm.addBasket ? Color.green : Color(.secondarySystemBackground))
                .padding(.top, 5)
        )
        .padding([.leading, .trailing])
        .padding(.bottom,25)
        
    }
}
