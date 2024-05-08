//
//  AText.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 09.05.2024.
//

import SwiftUI

final class AText {
    
    private static let shared: AText = AText()
    
    public func justText(text: String) -> some View {
        Text(text)
            .font(.custom("LexendDeca-Regular", size: 14))
    }
}
