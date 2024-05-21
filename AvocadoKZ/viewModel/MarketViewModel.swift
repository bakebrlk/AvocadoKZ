//
//  MarketViewModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

final class MarketViewModel: ObservableObject {
    @Published public var scrollOffset: CGFloat = 0
    
    @Published public var height: CGFloat = AppData.shared.size.height * 0.1
    
    @State public var searchQuery = ""

}
