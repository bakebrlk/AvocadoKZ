//
//  image.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 20.05.2024.
//

import SwiftUI

func image(systemName: String, size: CGFloat) -> some View {
    Image(systemName: systemName)
        .resizable()
        .scaledToFit()
        .frame(width: size, height: size)
}
