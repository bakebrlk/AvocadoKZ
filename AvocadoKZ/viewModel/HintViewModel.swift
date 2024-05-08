//
//  HintViewModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 09.05.2024.
//

import SwiftUI
import Combine

final class HintViewModel: ObservableObject {
    
    @Published public var page: Int = 0
    
    public func nextPage() {
        page += 1
    }
}
