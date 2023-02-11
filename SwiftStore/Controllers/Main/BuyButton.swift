//
//  BuyButton.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 11.02.23.
//

import UIKit

class BuyButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        setupButton(with: title)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(with title: String) {
        setTitle(title, for: .normal)
        backgroundColor = .lightGray
        backgroundColor = #colorLiteral(red: 0.9976320863, green: 0.9901652932, blue: 0.8451907039, alpha: 1)
        layer.cornerRadius = 15
    }
}
