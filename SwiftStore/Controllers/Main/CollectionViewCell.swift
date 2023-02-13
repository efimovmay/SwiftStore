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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        // Eliminate odd code execution
        if !buyButton.isTapped {
            buyButton.setButtonView(withTitle: "В корзине", for: .tapped)
            buyButton.isTapped = true
        }
    }
}
