//
//  HomeViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 1.02.23.
//

import UIKit

// MARK: - CustomButtonDelegate
protocol CustomButtonDelegate { // Для понимания можно читать, как "делегат класса CustomButton"
    
    func putIntoCart(_ product: Product)
    
    func removeFromCart(_ product: Product)
    
    func goToCart()
}

final class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - IB Outlets
    @IBOutlet var sellsCollectionView: UICollectionView!
    @IBOutlet var bestCollectionView: UICollectionView!
    @IBOutlet var recommendCollectionView: UICollectionView!
    
    // Data being received from MainViewController
    var sellsProducts: [Product]!
    var bestProducts: [Product]!
    var recommendedProducts: [Product]!
    var cart: [Product]!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
     
    // MARK: - Setup tab view
    private func setupTabBar() {
        tabBarItem.image = UIImage(systemName: "house.fill")
        tabBarItem.title = "Главная"
        // First tab selection on lounch
        tabBarController?.selectedViewController = tabBarController?.viewControllers?.first
    }

    //MARK: - Navigation
    // Programmed segue to ProductInfoViewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "ProductInfo", bundle: nil)
        if let productInfoVC = storyBoard.instantiateViewController(identifier: "productInfoVC") as? ProductInfoViewController {
            
            switch collectionView {
            case sellsCollectionView: productInfoVC.product = sellsProducts[indexPath.row]
            case bestCollectionView: productInfoVC.product = bestProducts[indexPath.row]
            default: productInfoVC.product = recommendedProducts[indexPath.row]
            }
            
            present(productInfoVC, animated: true)
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case sellsCollectionView: return sellsProducts.count
        case bestCollectionView: return bestProducts.count
        default: return recommendedProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case sellsCollectionView:
            let cell = sellsCollectionView.dequeueReusableCell(withReuseIdentifier: "sellsCell", for: indexPath) as! CollectionViewCell
            cell.buyButton.delegate = self // указываем, что делегатом для кнопки (экземпляр класса CustomButton) является ЭТОТ (self - "сам") вью контроллер
            let product = sellsProducts[indexPath.row]  // определяем экземпляр продукта для ячейки
//
//            if !cart.contains(product) {
//                cell.buyButton.reset()
//                collectionView.reloadItems(at: [indexPath])
//            }
            
            cell.cellProduct = product  // передаем экземпляр продукта в свойство ячейки
            let configuredCell = configureCell(cell, for: product) // заполняем ячейку отображаемыми данными
            return configuredCell   // выдаем готовую ячейку
            
        case bestCollectionView:
            let cell = bestCollectionView.dequeueReusableCell(withReuseIdentifier: "bestCell", for: indexPath) as! CollectionViewCell
            cell.buyButton.delegate = self
            let product = bestProducts[indexPath.row]
            cell.cellProduct = product
            let configuredCell = configureCell(cell, for: product)
            return configuredCell
            
        default:
            let cell = recommendCollectionView.dequeueReusableCell(withReuseIdentifier: "recomendedCell", for: indexPath) as! CollectionViewCell
            cell.buyButton.delegate = self
            let product = recommendedProducts[indexPath.row]
            cell.cellProduct = product
            let configuredCell = configureCell(cell, for: product)
            return configuredCell
        }
    }
    
    // Fill cell content
    private func configureCell(_ cell: CollectionViewCell, for product: Product) -> UICollectionViewCell {
        cell.productImage.image = UIImage(named: product.image)
        cell.modelLabel.text = product.image
        
        cell.buyButton.initState = cart.contains(product) ? false : true
        
        if product.onSale {
            // Strike out price text for discounted products
            let priceText = "$\(product.price)"
            let priceTextstroken = NSMutableAttributedString(string: priceText)
            priceTextstroken.addAttribute(.strikethroughStyle, value: 1, range: NSRange(location: 0, length: priceText.count))
            
            cell.priceDiscountLabel.text = "$\(product.priceDiscount)"
            cell.priceLabel.attributedText = priceTextstroken
        } else {
            cell.priceDiscountLabel.text = "$\(product.price)"
            cell.priceLabel.isHidden = true
        }
        return cell
    }
}

// MARK: - CollectionViewCellDelegate
// Реализация метода протокола
// Для понимания можно читать, как "Класс HomeViewController - делегат класса CustomButton"
extension HomeViewController: CustomButtonDelegate {
    
    func goToCart() {
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        guard let cartVC = storyboard.instantiateViewController(identifier: "cartVC") as? CartViewController else { return }
        // Transfer actual cart data to CartViewController
        cartVC.cart = cart
        present(cartVC, animated: true)
    }
    
    func putIntoCart(_ product: Product) {
        cart.append(product)
        printCart() // for function check
    }
        
    func removeFromCart(_ product: Product) {
//        printCart()
    }
}

// function check of cart update
extension HomeViewController {
    private func printCart() {
        var output = ""
        cart.forEach { output.append($0.model + " || ") }
        print(output)
    }
}
