//
//  EnvironmentValues.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 19.05.2024.
//

import Foundation
import SwiftUI

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
