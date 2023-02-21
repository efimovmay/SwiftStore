//
//  ProductInfoViewController.swift
//  SwiftStore
//
//  Created by Dmitry Polyakov on 31.01.23.
//

import UIKit

final class ProductInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IB Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var buyButton: CustomButton!
    @IBOutlet weak var techSpecsHeight: NSLayoutConstraint!
    @IBOutlet weak var techSpecsTableView: UITableView!
    
    // MARK: - Public Properties
    var product: Product?
    var cart: [Product]?
    
    // MARK: - Private Properties
    private var productSpecs: [String] {
        getSpecs(for: product)
    }
    
    // MARK: - Override ProductsViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // Post notification to presenting view controller to execute its update
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "updateTabBadge"),
            object: nil
        )
    }
    
    // MARK: - Private Methods
    private func setupView() {
        guard let product = product else { return }
        
        productImage.image = UIImage(named: product.image )
        productLabel.text = product.title
        setupPrices()
        setupBuyButton()
        setupTechSpecsTableView()
        buyButton.initState = Cart.contains(product) ? false : true
    }
    
    private func setupPrices() {
        guard let product = product else { return }
        if product.onSale {
            priceLabel.text = "$\(product.priceDiscount)"
            
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$\(product.price)")
            attributeString.addAttribute(
                NSAttributedString.Key.strikethroughStyle,
                value: 1,
                range: NSRange(location: 0, length: attributeString.length)
            )
            oldPriceLabel.attributedText = attributeString
        } else {
            priceLabel.text = "$\(product.price)"
            oldPriceLabel.isHidden = true
        }
    }
    
    private func setupBuyButton() {
        buyButton.delegate = self
    }
    
    private func setupTechSpecsTableView() {
        let rowHeight = 60
        techSpecsTableView.rowHeight = CGFloat(rowHeight)
        techSpecsHeight.constant = CGFloat(rowHeight * productSpecs.count)
    }
    
    private func getSpecs(for product: Product?) -> [String] {
        guard let product = product else { return [""] }
        
        var productSpecs: [String] = []
        
        if product.category != "" {
            productSpecs.append("Категория: \(product.category)")
        }
        if product.model != "" {
            productSpecs.append("Модель: \(product.model)")
        }
        if product.chip != "" {
            productSpecs.append("Процессор: \(product.chip)")
        }
        if product.color != "" {
            productSpecs.append("Цвет: \(product.color)")
        }
        if product.display != "" {
            productSpecs.append("Диагональ: \(product.display)")
        }
        if product.memory != "" {
            productSpecs.append("Оперативная память: \(product.memory)")
        }
        if product.storage != "" {
            productSpecs.append("Память: \(product.storage)")
        }
        
        return productSpecs
    }
    
    @IBAction func buyButtonAction() {
        guard let product = product else { return }
        
        if !Cart.contains(product) {
            putIntoCart(product)
            buyButton.initState = false
        } else {
            removeFromCart(product)
            buyButton.initState = true
        }
        // debug
        Cart.printOut(from: "INFO")
    }
}

// MARK: - Table view data source
extension ProductInfoViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productSpecs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "techSpec", for: indexPath)
        
        cell.selectionStyle = .none
        
        var content = cell.defaultContentConfiguration()
        
        content.text = productSpecs[indexPath.row]
        content.image = UIImage(systemName: DataStore.shared.icons[indexPath.row])
        
        cell.contentConfiguration = content
        
        return cell
    }
}

extension ProductInfoViewController: CustomButtonDelegate {
    func putIntoCart(_ product: Product) {
        Cart.append(product)
    }
    
    func removeFromCart(_ product: Product) {
        Cart.remove(product)
    }
    
    func updateCartBadge() {
        if let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "mainVC") as? UITabBarController {
            tabBarController.tabBar.items?[2].badgeValue = Cart.isEmpty ? nil : String(Cart.shared.cart.count)
        }
    }
}
