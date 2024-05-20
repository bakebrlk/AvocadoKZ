//
//  ProductViewModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 20.05.2024.
//

import SwiftUI

final class ProductViewModel: ObservableObject{
    
    @Published public var isLike: Bool = false
    @Published public var haveBasket: Bool = false
    @Published public var count: Int = 0
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
    
    public func addBasket() {
        withAnimation{
            haveBasket.toggle()
            count = 1
        }
    }
    
    public func like() {
        withAnimation{
            isLike.toggle()
        }
    }
}
