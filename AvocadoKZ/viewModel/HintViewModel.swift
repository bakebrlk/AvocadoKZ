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
    
    public var title: String {
        AppData.shared.hints[page].title
    }
    
    public var description: String {
        AppData.shared.hints[page].description
    }
    
    public var imageURL: String {
        AppData.shared.hints[page].imgURL
    }
}
