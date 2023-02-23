//
//  TeamCollectionViewCell.swift
//  SwiftStore
//
//  Created by Aleksey on 05.02.2023.
//

import UIKit

final class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var devImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var charpterLabel: UILabel!
    @IBOutlet var githubLinkLabel: UILabel!
    
    func settings(currentDeveloper: Developer) {
       
        devImage.image = UIImage(named: currentDeveloper.image)
        devImage.widthAnchor.constraint(
            equalToConstant: frame.width - 17).isActive = true
        
        nameLabel.text = currentDeveloper.name
        charpterLabel.text = "Разделы: \(currentDeveloper.charpter)"
        githubLinkLabel.text = currentDeveloper.githubLink
        
        layer.cornerRadius = 15
        devImage.layer.cornerRadius = 15

    }
}
