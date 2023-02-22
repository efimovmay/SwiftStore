//
//  BuyButton.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 11.02.23.
//

import UIKit

@IBDesignable final class CustomButton: UIButton {

    // Button appearance constants
    private let initTextColor = UIColor.systemBlue
    private let initBackColor = UIColor.white
    private let tappedTextColor = UIColor.white
    private let tappedBackColor = UIColor.systemBlue
    
    // Titles by default
    var initTitle = "Купить"  // Title in init state
    var tappedTitle = "В корзине" // Title on button tapped
    
    // Property observer: button appearance changes each time this property changes
    var initState = true {
        didSet {
            updateButtonView()
        }
    }
    
    var delegate: CustomButtonDelegate!
    /* Говорит о том, что экземпляры этого класса (т.е. кнопки) будут использовать делегат
     
     delegate - "указатель" на протокол, содержащий св-ва и метод(ы) для выполнения каких-то действий одним классом - ДЕЛЕГАТОМ - по поручению (от имени) другого, ДЕЛЕГИРУЮЩЕГО, класса.
     В нашем случае класс CustomButton делегирующий. Он делегирует (поручает) классу HomeViewController выполнять следующие действия:
            - добавления продукта из  конкретной ячейки коллекшн вью в корзину
            - переход в корзину, если кнопка была нажата дважды (по ТЗ)
     */
   
    override func draw(_ rect: CGRect) {
        // Initial button appearance for default values
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = 1
        layer.borderColor = initTextColor.cgColor
        updateButtonView()
    }
    
    // Update button appearance corresponding its state
    func updateButtonView() {
        let title = initState ? initTitle : tappedTitle
        
        if initState {
            setTitle(title, for: .normal)
            setTitleColor(initTextColor, for: .normal)
            layer.backgroundColor = initBackColor.cgColor
            layer.borderColor = initTextColor.cgColor
        } else {
            setTitle(title, for: .normal)
            setTitleColor(tappedTextColor, for: .normal)
            layer.backgroundColor = tappedBackColor.cgColor
        }
        return
    }
    
    // Change button view to initial state
    func reset() {
        initState = true
        updateButtonView()
    }
}
