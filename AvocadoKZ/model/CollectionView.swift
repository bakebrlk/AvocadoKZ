import SwiftUI
import UIKit

struct CollectionView: UIViewControllerRepresentable {
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        var parent: CollectionView
        
        init(_ parent: CollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return parent.items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasketProductCell", for: indexPath) as? BasketProductCollectionViewCell else {
                fatalError("Unable to dequeue BasketProductCollectionViewCell")
            }
            let product = parent.items[indexPath.item]
            cell.configure(with: product)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width
            let height = AppData.shared.size.height / 8
            return CGSize(width: width, height: height)
        }
    }
    
    var items: [ProductModel]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let layout = CustomFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.register(BasketProductCollectionViewCell.self, forCellWithReuseIdentifier: "BasketProductCell")
        
        let viewController = UIViewController()
        viewController.view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
        ])
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
