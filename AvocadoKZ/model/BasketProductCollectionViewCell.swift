import UIKit
import SwiftUI

class BasketProductCollectionViewCell: UICollectionViewCell {
    private var hostingController: UIHostingController<BasketProductCell>?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHostingController()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHostingController()
    }
    
    private func setupHostingController() {
        
        let defaultProduct = AppData.shared.product[0]
        let hostingController = UIHostingController(rootView: BasketProductCell(product: defaultProduct))
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        self.hostingController = hostingController
    }
    
    func configure(with product: ProductModel) {
        hostingController?.rootView = BasketProductCell(product: product)
    }
}
