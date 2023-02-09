//
//  ProductInfoViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

final class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IB Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var techSpecsHeight: NSLayoutConstraint!
    @IBOutlet weak var techSpecsTableView: UITableView!
    
    // MARK: - Public Properties
//    var products = Product.getRandomProducts(count: 1)
    var product: Product?
    
    // MARK: - Private Properties
    private var productSpecs: [String] {
        [
            "Категория: \(product?.category ?? "")",
            "Модель: \(product?.model ?? "")",
            "Процессор: \(product?.chip ?? "")",
            "Цвет: \(product?.color ?? "")",
            "Диагональ: \(product?.display ?? "")",
            "Оперативная память: \(product?.memory ?? "")",
            "Память: \(product?.storage ?? "")"
        ]
    }

    var cart: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTechSpecsTableView()
        productImage.image = UIImage(named: product?.image ?? "")
        productLabel.text = product?.image
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productSpecs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "techSpec", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = productSpecs[indexPath.row]
        content.image = UIImage(systemName: DataStore.shared.icons[indexPath.row])
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Private Methods
    private func setupTechSpecsTableView() {
        let rowHeight = 60
        techSpecsTableView.rowHeight = CGFloat(rowHeight)
        techSpecsHeight.constant = CGFloat(rowHeight * productSpecs.count)
    }
    
}
