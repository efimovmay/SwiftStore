//
//  BuyButton.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 11.02.23.
//

import UIKit

@IBDesignable final class CustomButton: UIButton {

    var isTapped = false
    
    // Button view constants
    private let untappedColor = #colorLiteral(red: 0.9640280604, green: 0.8113391995, blue: 0.2740806341, alpha: 1)
    private let tappedColor = UIColor.lightGray
    
    override func draw(_ rect: CGRect) {
        // Initial button view
        setButtonView(title: "Купить", isTapped: isTapped)
    }
    
    func setButtonView(title: String, isTapped: Bool) {
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = frame.height / 2
        
        if isTapped {
            setTitle(title, for: .normal)
            layer.backgroundColor = tappedColor.cgColor
            return
        }
        setTitle(title, for: .normal)
        layer.backgroundColor = untappedColor.cgColor
        return
    }
}
