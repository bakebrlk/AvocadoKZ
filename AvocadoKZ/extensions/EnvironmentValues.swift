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
    
    var viewController: UIViewController? {
        get { return self[ViewControllerKey.self].value }
        set { self[ViewControllerKey.self].value = newValue }
    }
}
