//
//  Data.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 08.05.2024.
//

import Foundation
import SwiftUI

final class AppData: ObservableObject {
    
    public static let shared = AppData()
    
    public let size: CGRect = UIScreen.main.bounds
    
    public let appColor: Color = Color(red: 0.3255, green: 0.788, blue: 0.3529)
    
    public let appTitle: String = "AvocadoKZ"
    
//MARK: Hints
    public let hints: [HintModel] = [
        HintModel(
                    title: "Добро пожаловать в",
                    description: "ваш лучший выбор для кулинарного наслаждения!",
                    imgURL: "https://firebasestorage.googleapis.com/v0/b/avocado-kz.appspot.com/o/helloImage.png?alt=media&token=1a508759-b570-4757-a3a6-aa052f1ca8b7"),
        
        HintModel(
                    title: "Исследуйте мир вкусов с ",
                    description: "Наслаждайтесь радостью от идеальных покупок.",
                    imgURL:  "https://firebasestorage.googleapis.com/v0/b/avocado-kz.appspot.com/o/thingImage.png?alt=media&token=3c07a959-895c-4178-9d3a-57d4c9886722"),
        
        HintModel(
                    title: "Улучшите ваш опыт покупок в ",
                    description: "Наш магазин предоставит вам широкий ассортимент продуктов и услуг.",
                    imgURL: "https://firebasestorage.googleapis.com/v0/b/avocado-kz.appspot.com/o/happyImage.png?alt=media&token=aef38f8e-56c9-4e49-9652-9e15fbc9fe86")
    ]
//    
////MARK: Events
//    public let events: [EventModel] = [
//        
//        EventModel(
//                    imageURL: URL(string: "")!),
//        
//        EventModel(
//                    imageURL: URL(string: "")!),
//                   
//        EventModel(
//                    imageURL: URL(string: "")!),
//        
//        EventModel(
//                    imageURL: URL(string: "")!),
//                    
//        EventModel(
//                    imageURL: URL(string: "")!),
//        
//        EventModel(
//                    imageURL: URL(string: "")!),
//                   
//        EventModel(
//                    imageURL: URL(string: "")!),
//        
//        EventModel(
//                    imageURL: URL(string: "")!)
//                   
//    ]
}
