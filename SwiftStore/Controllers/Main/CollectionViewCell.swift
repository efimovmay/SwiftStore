//
//  CollectionViewCell.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 3.02.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var productImage: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceDiscountLabel: UILabel!
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var buyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupItem()
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
    }
    
    private func setupItem() {
        backgroundColor = #colorLiteral(red: 0.9976320863, green: 0.9901652932, blue: 0.8451907039, alpha: 1)
        layer.cornerRadius = 15
        productImage.layer.cornerRadius = 15
        productImage.backgroundColor = .white
        
        buyButton.layer.cornerRadius = buyButton.frame.height / 2
        buyButton.backgroundColor = #colorLiteral(red: 0.9640280604, green: 0.8113391995, blue: 0.2740806341, alpha: 1)
        buyButton.setTitleColor(.black, for: .normal)
    }
}
