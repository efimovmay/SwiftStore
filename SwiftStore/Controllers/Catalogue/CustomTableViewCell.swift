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
    @IBOutlet weak var buyButton: CustomButton!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
//    @IBAction func buyButtonDidTapped() {
//        if !buyButton.isTapped {
//            buyButton.setButtonView(withTitle: "В корзине", for: .tapped)
//            buyButton.isTapped = true
//        }
//    }
}
