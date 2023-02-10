//
//  CartViewController.swift
//  SwiftStore
//
//  Created by Aleksey Efimov on 31.01.23.
//

import UIKit


class CartViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet var cartTableView: UITableView!
    @IBOutlet var buttonView: UIView!
    
    @IBOutlet var emptyCartStack: UIStackView!
    
    @IBOutlet var numberItemInCartLabel: UILabel!
    @IBOutlet var fullPriceLabel: UILabel!
    
    var cart: [Product]!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self

        cart = Product.getRandomProducts(count: 13)
    }
    
    override func viewWillLayoutSubviews() {
        hideTable()
        settingsUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func designPressButton() {
        let number = 333
        showAlertController(title: "Заказ успешно оформлен",
                            massege: "Номер вашего заказа: \(number)")
    }
}

//MARK: - UI settings

extension CartViewController {
    
    private func hideTable() {
        if cart == nil {
            cartTableView.isHidden = true
            buttonView.isHidden = true
            emptyCartStack.isHidden = false
        } else {
            cartTableView.isHidden = false
            buttonView.isHidden = false
            emptyCartStack.isHidden = true
        }
    }
    
    private func showAlertController(title: String, massege: String) {
        let alert = UIAlertController(title: title, message: massege, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    private func settingsUI() {
        if cart != nil {
            
            let fullPrice = 333
            numberItemInCartLabel.text = "\(cart.count) товаров"
            fullPriceLabel.text = "\(fullPrice) $"
        }
    }
}


//MARK: - UITableView delegate

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cart == nil {
            return 0
        } else {
            return cart.count
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCartTableViewCell
        let product = cart[indexPath.row]
        
        cell.productImage.image = UIImage(named: product.image)
        cell.nameLable.text = product.model
        cell.priceLable.text = "\(product.price) $"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
