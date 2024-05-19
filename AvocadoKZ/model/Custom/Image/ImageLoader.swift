//
//  AsyncImage.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 19.05.2024.
//

import SwiftUI
import Combine

final class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published private var url: URL
    private var cancellable: AnyCancellable?
    private var cache: ImageCache?
    private(set) var isLoading = false
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
    
    init(url: String, cache: ImageCache? = nil) {
        self.url = URL(string: url)!
        self.cache = cache
    }

    deinit {
        cancel()
    }

    func load() {

        guard !isLoading else { return }

        if let image = cache?[url] {
            self.image = image
            return
        }
            
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: Self.imageProcessingQueue)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
                    receiveOutput: { [weak self] in self?.cache($0) },
                    receiveCompletion: { [weak self] _ in self?.onFinish() },
                    receiveCancel: { [weak self] in self?.onFinish() })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
        
    private func onStart() {
        isLoading = true
    }
        
    private func onFinish() {
        isLoading = false
    }
    private func cache(_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
