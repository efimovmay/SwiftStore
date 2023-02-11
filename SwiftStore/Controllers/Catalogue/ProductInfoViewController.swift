//
//  ProductInfoViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

final class ProductInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IB Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var techSpecsHeight: NSLayoutConstraint!
    @IBOutlet weak var techSpecsTableView: UITableView!
    
    // MARK: - Public Properties
    var product: Product?
    var cart: [Product]?
    
    // MARK: - Private Properties
    var productSpecs: [String] {
        getSpecs(for: product!)
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
        productLabel.text = getTitle(for: product)
    }
    
    private func setupTechSpecsTableView() {
        let rowHeight = 60
        techSpecsTableView.rowHeight = CGFloat(rowHeight)
        techSpecsHeight.constant = CGFloat(rowHeight * productSpecs.count)
    }
    
    private func getTitle(for product: Product) -> String {
        switch product.category {
        case "Mac":
            if product.model.contains("M1") || product.model.contains("M2") {
                return "\(product.model) \(product.color) \(product.memory)/\(product.storage)"
            } else {
                return "\(product.model) \(product.chip) \(product.color) \(product.memory)/\(product.storage)"
            }
        case "iPhone", "iPad":
            return "\(product.model) \(product.color) \(product.storage)"
        case "Watch":
            return "\(product.model) \(product.display)"
        default:
            return "\(product.model)"
        }
    }
    
    private func getSpecs(for product: Product) -> [String] {
        
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
