//
//  Fonts.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 10.05.2024.
//

import SwiftUI

enum AFont{
    case black
    case bold
    case extraBold
    case extraLight
    case light
    case medium
    case regular
    case semiBold
    case thin
    
    public func toString() -> String{
        switch self {
        case .black:
            return "Lexend-Black"
        case .bold:
            return "Lexend-Bold"
        case .extraBold:
            return "Lexend-ExtraBold"
        case .extraLight:
            return "Lexend-ExtraLight"
        case .light:
            return "Lexend-Light"
        case .medium:
            return "Lexend-Medium"
        case .regular:
            return "Lexend-Regular"
        case .semiBold:
            return "Lexend-SemiBold"
        case .thin:
            return "Lexend-Thin"
        }
    }
}
