//
//  CustomTableViewCell.swift
//  SwiftStore
//
//  Created by Kirill Taraturin on 03.02.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: CustomButton!
    
    var product: Product!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - IB Actions
    @IBAction func buyButtonDidTapped() {
        // First tap changes button appearance and add product into the cart
        if buyButton.initState {
            buyButton.initState = false
            buyButton.updateView()
            // момент делегирования, т.е. выполнения метода другим классом (HomeViewController)
            buyButton.delegate.putIntoCart(product) // Put product into cart
            buyButton.delegate.updateCartBadge()
        } else {
            // Second tap: perform programmed segue to CartViewController
            buyButton.reset()
            buyButton.delegate.removeFromCart(product)
            buyButton.delegate.updateCartBadge()
        }
    }
}
