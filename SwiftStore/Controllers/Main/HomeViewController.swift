//
//  HomeViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 1.02.23.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var sellsCollectionView: UICollectionView!
    //    @IBOutlet var bestCollectionView: UICollectionView!
//    @IBOutlet var recommendCollectionView: UICollectionView!
    
    // MARK: - Data for collection views
    let sellsProducts = Product.getRandomProducts(count: 8)
    let bestProducts = Product.getRandomProducts(count: 6)
    let recomendedProducts = Product.getRandomProducts(count: 8)
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup views
    private func setupUI() {
        setupTabBar()
        setupCollectionViews()
    }
    
    private func setupTabBar() {
        tabBarItem.image = UIImage(systemName: "house.fill")
        tabBarItem.title = "Главная"
        // First tab selection on lounch
        tabBarController?.selectedViewController = tabBarController?.viewControllers?.first
    }
    
    private func setupCollectionViews() {
        sellsCollectionView.dataSource = self
        sellsCollectionView.delegate = self
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        sellsCollectionView.collectionViewLayout = collectionViewLayout
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sellsProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? CollectionViewCell {
            
            let product = sellsProducts[indexPath.row]
            
            // Форматируем текстовое значение полной цены как зачёркнутое
            let productPriceText = String(product.price)
            let productPriceTextStroken = NSMutableAttributedString(string: productPriceText)
            productPriceTextStroken.addAttribute(.strikethroughStyle, value: 1, range: NSRange(location: 0, length: productPriceText.count))
            
                        
            cell.productImage.image = UIImage(named: product.image)
            cell.priceDiscountLabel.text = String(product.priceDiscount)
            cell.priceLabel.attributedText = productPriceTextStroken
            cell.modelLabel.text = product.image
            
            return cell
        } else {
            return CollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 135, height: sellsCollectionView.frame.height - 10)
    }
}
