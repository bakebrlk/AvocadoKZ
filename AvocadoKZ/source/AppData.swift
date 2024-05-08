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
}
