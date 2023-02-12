//
//  HomeViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 1.02.23.
//

import UIKit

final class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - IB Outlets
    @IBOutlet var sellsCollectionView: UICollectionView!
    @IBOutlet var bestCollectionView: UICollectionView!
    @IBOutlet var recommendCollectionView: UICollectionView!
    
    // Data being received from MainViewController
    var sellsProducts: [Product]!
    var bestProducts: [Product]!
    var recomendedProducts: [Product]!
    var cart: [Product]!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
     
    // MARK: - Setup views
    private func setupUI() {
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBarItem.image = UIImage(systemName: "house.fill")
        tabBarItem.title = "Главная"
        // First tab selection on lounch
        tabBarController?.selectedViewController = tabBarController?.viewControllers?.first
    }

    //MARK: - Navigation
    // Programmatically done segue to ProductInfoViewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "ProductInfo", bundle: nil)
        if let productInfoVC = storyBoard.instantiateViewController(identifier: "productInfoVC") as? ProductInfoViewController {
//        let productInfoVC = ProductInfoViewController()
        switch collectionView {
        case sellsCollectionView: productInfoVC.product = sellsProducts[indexPath.row]
        case bestCollectionView: productInfoVC.product = bestProducts[indexPath.row]
        default: productInfoVC.product = recomendedProducts[indexPath.row]
        }
        present(productInfoVC, animated: true)
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case sellsCollectionView: return sellsProducts.count
        case bestCollectionView: return bestProducts.count
        default: return recomendedProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case sellsCollectionView:
            let cell = sellsCollectionView.dequeueReusableCell(withReuseIdentifier: "sellsCell", for: indexPath) as! CollectionViewCell
            let product = sellsProducts[indexPath.row]
            let configuredCell = configureCell(cell, for: product)
            return configuredCell
            
        case bestCollectionView:
            let cell = bestCollectionView.dequeueReusableCell(withReuseIdentifier: "bestCell", for: indexPath) as! CollectionViewCell
            let product = bestProducts[indexPath.row]
            let configuredCell = configureCell(cell, for: product)
            return configuredCell
            
        default:
            let cell = recommendCollectionView.dequeueReusableCell(withReuseIdentifier: "recomendedCell", for: indexPath) as! CollectionViewCell
            let product = recomendedProducts[indexPath.row]
            let configuredCell = configureCell(cell, for: product)
            return configuredCell
        }
    }
    
    // Fill cell content
    private func configureCell(_ cell: CollectionViewCell, for product: Product) -> UICollectionViewCell {
        cell.productImage.image = UIImage(named: product.image)
        cell.modelLabel.text = product.image
        
        if product.onSale {
            // Strike out price text for discounted products
            let priceText = String(product.price) + " $"
            let priceTextstroken = NSMutableAttributedString(string: priceText)
            priceTextstroken.addAttribute(.strikethroughStyle, value: 1, range: NSRange(location: 0, length: priceText.count))
            
            cell.priceDiscountLabel.text = String(product.priceDiscount) + " $"
            cell.priceLabel.attributedText = priceTextstroken
        } else {
            cell.priceDiscountLabel.text = String(product.price) + " $"
            cell.priceLabel.isHidden = true
        }
        return cell
    }
}
