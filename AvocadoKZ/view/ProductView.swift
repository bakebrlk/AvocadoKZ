//
//  ProductView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 20.05.2024.
//

import SwiftUI
import UIKit


struct ProductView: View {
    
    private let product: ProductModel
    
    @ObservedObject private var vm = ProductViewModel.shared
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?

    init(_ product: ProductModel){
        self.product = product
    }
    
    var body: some View {
        productView()
            .onTapGesture {
                vm.openDetails.toggle()
                self.viewControllerHolder?.present(style: .pageSheet){
                    ProductDetailView(product: product, vm: _vm)
                }
            }
    }
    
    private func productView() -> some View {
  
        LazyVStack{
            
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: product.imgURL, placeholder: {
                    Text("Loading...")
                })
                .cornerRadius(8, corners: [.topLeft, .topRight, .bottomLeft])
                
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
                HStack{
                   
                    VStack(alignment: .leading){
                        
                        Spacer()
                        if product.fromTheFarm {
                            AText.shared.text(text: "С фермы", size: 14, font: .regular)
                                .foregroundColor(.white)
                                .background(Color.orange)
                                .cornerRadius(8, corners: product.discount == nil ? [.topRight, .bottomRight, .bottomLeft] : [.topRight, .bottomRight])
                        }
                        
                        if let discount = product.discount {
                            AText.shared.text(text: "\(discount)%", size: 14, font: .regular)
                                .foregroundColor(.white)
                                .background(Color(.darkGray))
                                .cornerRadius(8, corners: [.topRight, .bottomRight, .bottomLeft])
                                
                        }
                        
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(1)
            }
                        
            LazyVStack{
                
                   
                AText.shared.text(text: product.title, size: 14, font: .regular, lineLimit: 2)
                AText.shared.text(text: "\(product.whole) г", size: 14, font: .light)
                    .padding(.top, 1)

                AText.shared.text(text: "\(product.price) ₸", size: 22, font: .medium)
                    .padding(.top, 1)
                    .padding(.bottom, 0)
                }
                
                addBasketbtn
            }
        .frame(maxWidth: AppData.shared.size.width/2.1, maxHeight: AppData.shared.size.height/2.3)
            .background(
                BottomCurveRectangle()
                    .foregroundColor(Color(.systemBackground))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
//            .padding(10)
            
    }

    private var addBasketbtn: some View {
        Group {
            
            if vm.haveBasket {
                
                HStack{
                    image(systemName: "minus", size: 18)
                        .foregroundColor(.white)
                        .onTapGesture {
                            vm.minus()
                        }
                    
                    AText.shared.justText(text: "\(vm.count)шт")
                        .foregroundColor(.white)
                        .padding([.top, .bottom])
                    
                    image(systemName: "plus", size: 15)
                        .foregroundColor(.white)
                        .onTapGesture {
                            vm.plus()
                        }
                }
                .padding([.leading, .trailing])

              
                
            }else {
                Button(action: {
                    vm.addBasket()
                    
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
                .foregroundColor(vm.haveBasket ? Color.green : Color(.secondarySystemBackground))
                .padding(.top, 5)
        )
        .padding([.leading, .trailing])
        .padding(.bottom,25)
        
    }
}
