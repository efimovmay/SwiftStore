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
            
            // Format nominal product price text to be stroken out
            let productPriceText = String(product.price) + " $"
            let productPriceTextStroken = NSMutableAttributedString(string: productPriceText)
            productPriceTextStroken.addAttribute(.strikethroughStyle, value: 1, range: NSRange(location: 0, length: productPriceText.count))
            
            // Filling content of a cell
            cell.productImage.image = UIImage(named: product.image)
            cell.modelLabel.text = product.image
            cell.priceDiscountLabel.text = String(product.priceDiscount) + " $"
            cell.priceLabel.attributedText = productPriceTextStroken
            
            return cell
            
        case bestCollectionView:
            let cell = bestCollectionView.dequeueReusableCell(withReuseIdentifier: "bestCell", for: indexPath) as! CollectionViewCell
            let product = bestProducts[indexPath.row]
            
            // Filling content of a cell
            cell.productImage.image = UIImage(named: product.image)
            cell.modelLabel.text = product.image
            cell.priceDiscountLabel.text = String(product.price) + " $"
            cell.priceLabel.isHidden = true
            
            return cell
            
        default:
            let cell = recommendCollectionView.dequeueReusableCell(withReuseIdentifier: "recomendedCell", for: indexPath) as! CollectionViewCell
            let product = recomendedProducts[indexPath.row]
            
            // Filling content of a cell
            cell.productImage.image = UIImage(named: product.image)
            cell.modelLabel.text = product.image
            cell.priceDiscountLabel.text = String(product.price) + " $"
            cell.priceLabel.isHidden = true
            
            return cell
        }
    }
}
