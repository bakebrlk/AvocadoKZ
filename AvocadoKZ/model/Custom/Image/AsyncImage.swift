//
//  Image.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 16.05.2024.
//

import SwiftUI
import Combine

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image

    init(url: String,
         @ViewBuilder placeholder: () -> Placeholder,
         @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)){
            
        self.image = image
        self.placeholder = placeholder()
        _loader = ObservedObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
    }

    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
                    .resizable()
                    .scaledToFit()
            } else {
                placeholder
            }
        }
    }
}
