//
//  ProductModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 13.05.2024.
//

import SwiftUI

struct ProductModel: Hashable, Identifiable
{
    var id = UUID()
    let imgURL: String
    let title: String
    let whole: Int
    let price: Int
    let discount: Int?
    let fromTheFarm: Bool
    let description: String?
    let composition: String
    let country: String
    let category: String
    var count: Int
}
