//
//  AText.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 09.05.2024.
//

import SwiftUI

final class AText {
    
    public static let shared: AText = AText()
    
    public func justText(text: String) -> some View {
        Text(text)
            .font(.custom(AFont.regular.toString(), size: 17))
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .padding([.leading, .trailing])
    }
    
    public func text(text: String, size: CGFloat, font: AFont) -> some View {
        Text(text)
            .font(.custom(font.toString(), size: size))
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .padding([.leading, .trailing])
    }  
    
    public func text(text: String, size: CGFloat, font: AFont, padding: CGFloat) -> some View {
        Text(text)
            .font(.custom(font.toString(), size: size))
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .padding(padding)
    }
    
    public func text(text: String, size: CGFloat, font: AFont, lineLimit: Int) -> some View {
        Text(text)
            .font(.custom(font.toString(), size: size))
            .lineLimit(lineLimit)
            .multilineTextAlignment(.center)
            .padding([.leading, .trailing])
    }
     
    public func text(text: String, size: CGFloat, font: AFont, lineLimit: Int?, alignment: TextAlignment) -> some View {
        Text(text)
            .font(.custom(font.toString(), size: size))
            .lineLimit(lineLimit)
            .multilineTextAlignment(alignment)
            .padding([.leading, .trailing])
    }  
    public func text(text: String, size: CGFloat, font: AFont, lineLimit: Int?, alignment: TextAlignment, padding: CGFloat) -> some View {
        Text(text)
            .font(.custom(font.toString(), size: size))
            .lineLimit(lineLimit)
            .multilineTextAlignment(alignment)
            .padding(padding)
    }
    
    
}
