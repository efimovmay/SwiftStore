//
//  CollectionViewCell.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 3.02.23.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceDiscountLabel: UILabel!
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var buyButton: CustomButton!
    
    var product: Product!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        // First tap changes button appearance and add product into the cart
        if buyButton.initState {
            buyButton.initState = false
            buyButton.updateView()
            // момент делегирования, т.е. выполнения метода другим классом (HomeViewController)
            buyButton.delegate.putIntoCart(product) // Put product into cart
        } else {
            // Second tap: perform programmed segue to CartViewController
            buyButton.reset()
            buyButton.delegate.removeFromCart(product)
        }
    }
}
