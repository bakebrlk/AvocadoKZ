//
//  ScrollOffsetPreferenceKey.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
         
    }
    
    typealias Value = CGFloat
    static var defaultValue: Value = 0
    static func reduce(value: inout Value, nextValue: Value) {
        value = nextValue
    }
}
