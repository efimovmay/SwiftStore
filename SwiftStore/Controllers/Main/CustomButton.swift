//
//  BuyButton.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 11.02.23.
//

import UIKit

@IBDesignable final class CustomButton: UIButton {

    
    // Button appearance constants
    private let untappedColor = UIColor.white
    private let tappedColor = UIColor.lightGray
    
    var isTapped = false
    
    override func draw(_ rect: CGRect) {
        // Initial button appearance
        setButtonView(title: "Купить", isTapped: isTapped)
    }
    
    // Configure title and appearance in accordance with button state
    func setButtonView(title: String, isTapped: Bool) {
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = 1
        setTitle(title, for: .normal)
    
        if isTapped {
            setTitleColor(.black, for: .normal)
            layer.backgroundColor = tappedColor.cgColor
            layer.borderColor = tappedColor.cgColor
        } else {
            setTitle(title, for: .normal)
            setTitleColor(.systemBlue, for: .normal)
            layer.backgroundColor = untappedColor.cgColor
            layer.borderColor = UIColor.systemBlue.cgColor
        }
        return
    }
}
