//
//  ProductViewModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 20.05.2024.
//

import SwiftUI

final class ProductViewModel: ObservableObject{
    
    static let shared = ProductViewModel()
    
    @Published public var isLike: Bool = false
    @Published public var haveBasket: Bool = false
    @Published public var count: Int = 1
    @Published public var openDetails: Bool = false
    
    public func plus() {
        withAnimation{
            count += 1
        }
    }
    
    public func minus(){
        withAnimation{
            if count == 1 {
                haveBasket.toggle()
            }else {
                count -= 1
            }
        }
    }
    
    public func addBasket(_ product: ProductModel) {
        if !haveBasket{
            withAnimation{
                haveBasket.toggle()
                count = 1
            }
            AppData.shared.basket.append(product)
        }
    }
    
    public func like() {
        withAnimation{
            isLike.toggle()
        }
    }
}
