//
//  BuyButton.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 11.02.23.
//

import UIKit

@IBDesignable final class CustomButton: UIButton {

    enum State {
        case unTapped, tapped
    }
    
    // Button appearance constants
    private let untappedColor = UIColor.white
    private let tappedColor = UIColor.systemBlue
    
    var isTapped = false
    
    override func draw(_ rect: CGRect) {
        // Initial button appearance
        setButtonView(withTitle: "Купить", for: .unTapped)
    }
    
    // Configure title and appearance in accordance with button state
    func setButtonView(withTitle title: String, for state: CustomButton.State) {
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = 1
        setTitle(title, for: .normal)
    
        if state == .tapped {
            setTitleColor(.white, for: .normal)
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
