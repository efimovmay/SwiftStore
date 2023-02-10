//
//  CustomTableViewCell.swift
//  SwiftStore
//
//  Created by Kirill Taraturin on 03.02.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.layer.cornerRadius = buyButton.frame.height / 2
        buyButton.backgroundColor = #colorLiteral(red: 0.9640280604, green: 0.8113391995, blue: 0.2740806341, alpha: 1)
        buyButton.setTitleColor(.black, for: .normal)
        buyButton.setTitle("Купить", for: .normal)
    }
    
    @IBAction func buyButtonDidTapped() {
//            buyButton.configuration = setupButton(with: "В корзине")
        buyButton.setTitle("В корзине", for: .normal)
        buyButton.backgroundColor = .lightGray
    }
}
