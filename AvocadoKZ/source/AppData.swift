//
//  Data.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 08.05.2024.
//

import Foundation
import SwiftUI

final class AppData {
    
    public static let shared = AppData()
    
    public let size: CGRect = UIScreen.main.bounds
    
    public let appColor: Color = Color(red: 0.3255, green: 0.788, blue: 0.3529)
    
    public let hints: [HintModel] = [
        HintModel(
                    title: "Добро пожаловать в AvocadoKZ",
                    description: "ваш лучший выбор для кулинарного наслаждения!",
                    imgURL: ""),
        
        HintModel(
                    title: "Исследуйте мир вкусов с AvocadoKZ",
                    description: "Наслаждайтесь радостью от идеальных покупок.",
                    imgURL: ""),
        
        HintModel(
                    title: "Улучшите ваш опыт покупок в AvocadoKZ",
                    description: "Наш магазин предоставит вам широкий ассортимент продуктов и услуг.",
                    imgURL: "")
    ]
}
