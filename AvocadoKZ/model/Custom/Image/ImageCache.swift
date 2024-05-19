//
//  ImageCache.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 19.05.2024.
//

import SwiftUI

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}
