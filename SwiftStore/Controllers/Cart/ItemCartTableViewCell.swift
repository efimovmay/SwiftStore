//
//  ItemCartTableViewCell.swift
//  SwiftStore
//
//  Created by Aleksey Efimov on 04.02.2023.
//

import UIKit

final class ItemCartTableViewCell: UITableViewCell{

    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var deleteButton: UIButton!
    
    func settings(cellForRowAt indexPath: IndexPath) {
        
        let product = Cart.shared.cart[indexPath.row]
        
        if product.onSale {
            priceLabel.text = "$\(product.priceDiscount)"
        } else {
            priceLabel.text = "$\(product.price)"
        }
        
        productImage.image = UIImage(named: product.image)
        nameLabel.text = product.title
        
        deleteButton.tag = indexPath.row

    }
}

