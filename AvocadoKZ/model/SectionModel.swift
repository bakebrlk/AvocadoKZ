//
//  SectionModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

struct SectionModel: Identifiable,  Hashable  {
    var id = UUID()
    let category: String
    let description: String
}
