//
//  MarketViewModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI
import Combine

final class MarketViewModel: ObservableObject {
//    @Published public var scrollOffset: CGFloat = 0
    
    @Published public var height: CGFloat
    @State public var searchQuery = ""

        init() {
            self.height = AppData.shared.size.height * 0.1
        }
    
    public func minusHeight() {
        height -= 10
    }
    
    public func plusHeight(){
        height = 80
    }
}
