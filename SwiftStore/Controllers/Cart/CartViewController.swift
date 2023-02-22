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
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self

        buttonSettings()
        
        // Assign notification observer: if notification occurs (has been "posted") center calls designated function
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateView),
            name: Notification.Name("updateView"),
            object: nil
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        labelSettings()
        updateView()
    }
    
    // Testing
//    override func viewDidDisappear(_ animated: Bool) {
//        Cart.printOut(from: "CART")
//    }
   
    // MARK: - IB Actions
    
    @IBAction func designPressButton() {
        let number = Int.random(in: 1000...9999)
        showAlertController(title: "Заказ успешно оформлен",
                            massege: "Номер вашего заказа: \(number)")
    }
    
    @IBAction func transitionOnTabBar(_ sender: UIButton) {
        tabBarController?.selectedIndex = sender.tag
    }
}

//MARK: - UI settings

extension CartViewController {
    
    private func visibilityElementSettings() {

        if Cart.isEmpty {
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
        if !Cart.isEmpty {
            var fullPrice = 0
            for item in Cart.shared.cart {
                if item.onSale {
                    fullPrice += item.priceDiscount
                } else {
                    fullPrice += item.price
                }
            }
            
            let numberItemText: String
            if Cart.count == 1 {
                numberItemText = "\(Cart.count) товар"
            } else if Cart.shared.cart.count < 4 {
                numberItemText = "\(Cart.count) товара"
            } else {
                numberItemText = "\(Cart.count) товаров"
            }
            numberItemInCartLabel.text = numberItemText
            fullPriceLabel.text = "На $\(fullPrice)"
        }
    }
    
    private func buttonSettings() {
        mainScreenButton.layer.cornerRadius = mainScreenButton.frame.height / 2
        mainScreenButton.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        
        designButton.layer.cornerRadius = designButton.frame.height / 2
        designButton.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
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
        if Cart.isEmpty {
            return 0
        } else {
            return Cart.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCartTableViewCell
        let product = Cart.shared.cart[indexPath.row]
        
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
        Cart.shared.cart.remove(at: sender.tag)
        cartTableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)],
                                 with: .none)
        
        cartTableView.reloadData()
        visibilityElementSettings()
        labelSettings()
        
        tabBarController?.tabBar.items?[2].badgeValue = Cart.isEmpty ? nil : String(Cart.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        guard let productInfoVC = segue.destination as? ProductInfoViewController else { return }
        guard let indexPath = cartTableView.indexPathForSelectedRow else { return }

        let currentProduct = Cart.shared.cart[indexPath.row]
        productInfoVC.product = currentProduct
    }
    
}

// Update view after presented controller has been dismissed
extension CartViewController {
    
    private func updateCartBadge() {
        tabBarController?.tabBar.items?[2].badgeValue = Cart.isEmpty ? nil : String(Cart.count)
    }
    
    @objc private func updateView() {
        updateCartBadge()
        cartTableView.reloadData()
        visibilityElementSettings()
    }
}
