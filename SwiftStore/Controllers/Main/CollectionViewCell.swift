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
        setupCellItem()
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        buyButton.setButtonView(title: "В корзине", isTapped: true)
    }
    
    private func setupCellItem() {
        layer.cornerRadius = 15
        productImage.layer.cornerRadius = 15
        productImage.backgroundColor = .white
    }
}
