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
    
    @IBOutlet var mainScreenButton: UIButton!
    @IBOutlet var designButton: UIButton!
    
    var cart: [Product]!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self

    //   cart = Product.getRandomProducts(count: 7)
        
        buttonSettings()
        visibilityElementSettings()
        labelSettings()
    }

    // MARK: - IB Actions
    
    @IBAction func designPressButton() {
        let number = Int.random(in: 1000...9999)
        showAlertController(title: "Заказ успешно оформлен",
                            massege: "Номер вашего заказа: \(number)")
    }
    
    @IBAction func transitionOnTabBar(_ sender: UIButton) {
        tabBarController?.selectedIndex = sender.tag
        
        guard let homeVC = tabBarController?.viewControllers?[sender.tag] as? HomeViewController else { return }
        homeVC.cart = cart
    }
}

//MARK: - UI settings

extension CartViewController {
    
    private func visibilityElementSettings() {

        if cart == nil || cart.count == 0 {
            cartTableView.isHidden = true
            buttonView.isHidden = true
            emptyCartStack.isHidden = false
        } else {
            cartTableView.isHidden = false
            buttonView.isHidden = false
            emptyCartStack.isHidden = true
        }
    }
    
    private func labelSettings() {
        if cart != nil {
            var fullPrice = 0
            for item in cart {
                if item.onSale {
                    fullPrice += item.priceDiscount
                } else {
                    fullPrice += item.price
                }
            }
            numberItemInCartLabel.text = "\(cart.count) товаров"
            fullPriceLabel.text = "На $\(fullPrice)"
        }
    }
    
    private func buttonSettings() {
        mainScreenButton.layer.cornerRadius = mainScreenButton.frame.height / 2
        mainScreenButton.backgroundColor = #colorLiteral(red: 0.9640280604, green: 0.8113391995, blue: 0.2740806341, alpha: 1)
        
        designButton.layer.cornerRadius = designButton.frame.height / 2
        designButton.backgroundColor = #colorLiteral(red: 0.9640280604, green: 0.8113391995, blue: 0.2740806341, alpha: 1)
    }
    
    private func showAlertController(title: String, massege: String) {
        let alert = UIAlertController(title: title, message: massege, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
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
        
        if product.onSale {
            cell.priceLabel.text = "$\(product.priceDiscount)"
        } else {
            cell.priceLabel.text = "$\(product.price)"
        }
        
        cell.productImage.image = UIImage(named: product.image)
        cell.nameLabel.text = product.title
        
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(handleRegister(_:)),
                                    for: .touchUpInside)
        
        return cell
    }
    
    @objc func handleRegister(_ sender: UIButton){
        cart.remove(at: sender.tag)
        cartTableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)],
                                 with: .none)
        
        cartTableView.reloadData()
        visibilityElementSettings()
        labelSettings()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        guard let productInfoVC = segue.destination as? ProductInfoViewController else { return }
        guard let indexPath = cartTableView.indexPathForSelectedRow else { return }

        let currentProduct = cart[indexPath.row]
        productInfoVC.product = currentProduct
    }
    
}
