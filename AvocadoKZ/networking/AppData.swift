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

    
    public let product: [ProductModel] = [
        
        ProductModel(
                    imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494",
                    title: "Пельмени Arbuz Select фермерские с говядиной",
                    whole: 500,
                    price: 3390,
                    discount: -25,
                    fromTheFarm: true,
                    description: "это наши пельмени с говядиной. Попробуйте наши говяжьи пельмени - вкусный выбор для семейного обеда или ужина. Изготовлены из натуральных ингредиентов с использованием фермерской говядины.",
                    composition: "(тесто) мука пшеничная в/с, вода питьевая, яйцо, масло растительное, соль поваренная пищевая, (начинка фарш) говядина, лук репчатый, соль поваренная пищевая, черный перец.",
                    country: "Казахстан",
                    category: "farm"
                )

        
    ]
    
    public let sections: [ String: String] = [
        "news" : "Новинки для Вас",
        "farm" : "Фермерская лавка",
        "care" : "С заботой о себе"
    ]
}
