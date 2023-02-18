//
//  HomeViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 1.02.23.
//

import UIKit

// MARK: - CustomButtonDelegate
// Для понимания можно читать, как "делегат класса CustomButton"
protocol CustomButtonDelegate {
    
    func putIntoCart(_ product: Product)
    
    func removeFromCart(_ product: Product)
    
    func goToCart()
    
    func updateCartBadge()
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
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        #warning("Do cell update if cart has been changed")
        updateCartBadge()
    }
    
    //Testing
    override func viewDidDisappear(_ animated: Bool) {
        Cart.printOut(from: "HOME")
    }
    
    // MARK: - Setup tab view
    private func setupTabBar() {
        tabBarItem.image = UIImage(systemName: "house.fill")
        tabBarItem.title = "Главная"
        
        tabBarController?.tabBar.items?[2].image = UIImage(systemName: "cart.fill")
        tabBarController?.tabBar.items?[2].title = "Корзина"
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
            
            cell.product = product  // передаем экземпляр продукта в свойство ячейки
            let configuredCell = configureCell(cell, for: product) // заполняем ячейку отображаемыми данными
            return configuredCell   // выдаем готовую ячейку
            
        case bestCollectionView:
            let cell = bestCollectionView.dequeueReusableCell(withReuseIdentifier: "bestCell", for: indexPath) as! CollectionViewCell
            cell.buyButton.delegate = self
            let product = bestProducts[indexPath.row]
            cell.product = product
            let configuredCell = configureCell(cell, for: product)
            return configuredCell
            
        default:
            let cell = recommendCollectionView.dequeueReusableCell(withReuseIdentifier: "recomendedCell", for: indexPath) as! CollectionViewCell
            cell.buyButton.delegate = self
            let product = recommendedProducts[indexPath.row]
            cell.product = product
            let configuredCell = configureCell(cell, for: product)
            return configuredCell
        }
    }
    
    // Fill cell content
    private func configureCell(_ cell: CollectionViewCell, for product: Product) -> UICollectionViewCell {
        cell.productImage.image = UIImage(named: product.image)
        cell.modelLabel.text = product.image
        
        cell.buyButton.initState = Cart.shared.cart.contains(product) ? false : true
        
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

    }
    
    func putIntoCart(_ product: Product) {
        Cart.shared.cart.append(product)
    }
        
    func removeFromCart(_ product: Product) {
        if let index = Cart.shared.cart.firstIndex(of: product) {
            Cart.shared.cart.remove(at: index)            
        }
    }
    
    func updateCartBadge() {
        tabBarController?.tabBar.items?[2].badgeValue = Cart.shared.cart.isEmpty ? nil : String(Cart.shared.cart.count)
    }
}
