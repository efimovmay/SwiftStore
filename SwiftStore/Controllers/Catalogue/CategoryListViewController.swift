//
//  CategoryListViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

class CategoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentProducts: [Product] = []
    var currentTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        title = currentTitle
        
    }

}
extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell =  tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! CustomTableViewCell
        
        let currentProducts = currentProducts[indexPath.row]
      
        cell.productNameLabel.text = currentProducts.model
        cell.priceLabel.text = "\(currentProducts.price) $"
        cell.productImageView.image = UIImage(named: currentProducts.image)
        cell.selectionStyle = .none

            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productInfoVC = segue.destination as? ProductInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let currentProduct = currentProducts[indexPath.row]
        
        productInfoVC.product = currentProduct
    }
}
