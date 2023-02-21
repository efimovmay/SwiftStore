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
    
    // MARK: - IB Public Properties
    var product: Product!
    
    //MARK: - IB Actions
    @IBAction func buyButtonDidTapped() {
        // First tap changes button appearance and add product into the cart
        if buyButton.initState {
            buyButton.initState = false
            buyButton.updateButtonView()
            // момент делегирования, т.е. выполнения метода другим классом (CategoryListViewController)
            buyButton.delegate.putIntoCart(product)
            
        } else {
            buyButton.reset()
            buyButton.delegate.removeFromCart(product)
        }
        
        buyButton.delegate.updateCartBage()
    }
}
