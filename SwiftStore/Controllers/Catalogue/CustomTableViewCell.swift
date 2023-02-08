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
    
  
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//    }
    

    @IBAction func buyButtonDidTapped() {
//            buyButton.configuration = setupButton(with: "В корзине")
        buyButton.setTitle("В корзине", for: .normal)
        buyButton.tintColor = .lightGray
    }

    @available(iOS 15.0, *)
    private func setupButton(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.borderedTinted()
        buttonConfiguration.buttonSize = .medium
        buttonConfiguration.title = title

        return buttonConfiguration
    }
}
