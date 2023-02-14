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
    var productSpecs: [String] {
        getSpecs(for: product)
    }
    
    // MARK: - Override ProductsViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Methods
    private func setupView() {
        guard let product = product else { return }
        setupTechSpecsTableView()
        
        productImage.image = UIImage(named: product.image )
        productLabel.text = product.title
        
        // Product price configuration
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
        
        if product.inCart {
            print("Product in cart")
        }
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
        if !buyButton.isTapped {
//            guard let product = product else { return }
//            guard var cart = cart else { return }
//            print(product)
//            cart.append(product)
            print("Product was successfully added to your cart")
//            print(cart)
            buyButton.setButtonView(withTitle: "В корзине", for: .tapped)
            buyButton.isTapped = true
        } else {
            // Here will be the code for sending data to the cart page
        }
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
