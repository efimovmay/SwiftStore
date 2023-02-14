//
//  ItemCartTableViewCell.swift
//  SwiftStore
//
//  Created by Aleksey Efimov on 04.02.2023.
//

import UIKit

class ItemCartTableViewCell: UITableViewCell {
    
    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var deleteButton: UIButton!
}
