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
//    @IBOutlet var recommendCollectionView: UICollectionView!
    
    // MARK: - Data for collection views
    let sellsProducts = Product.getRandomProducts(count: 8)
    let bestProducts = Product.getRandomProducts(count: 6)
    let recomendedProducts = Product.getRandomProducts(count: 8)
    
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

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case sellsCollectionView:
            return sellsProducts.count
        default:
            return bestProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case sellsCollectionView:
            let cell = sellsCollectionView.dequeueReusableCell(withReuseIdentifier: "sellsCell", for: indexPath) as! SellsCollectionViewCell
            let product = sellsProducts[indexPath.row]
            
            // Format nominal product price text to be stroken out
            let productPriceText = String(product.price)
            let productPriceTextStroken = NSMutableAttributedString(string: productPriceText)
            productPriceTextStroken.addAttribute(.strikethroughStyle, value: 1, range: NSRange(location: 0, length: productPriceText.count))
            
            // Filling content of a cell
            cell.productImage.image = UIImage(named: product.image)
            cell.modelLabel.text = product.image
            cell.priceDiscountLabel.text = String(product.priceDiscount)
            cell.priceLabel.attributedText = productPriceTextStroken
            
            return cell
            
        default:
            let cell = bestCollectionView.dequeueReusableCell(withReuseIdentifier: "bestCell", for: indexPath) as! BestCollectionViewCell
            let product = bestProducts[indexPath.row]
            
            // Filling content of a cell
            cell.productImage.image = UIImage(named: product.image)
            cell.modelLabel.text = product.image
            cell.priceLabel.text = String(product.price)
            
            return cell
        }
    }
}
