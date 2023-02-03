//
//  CategoryListViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

class CategoryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentProducts: [Product] = []
    var currentTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        title = currentTitle
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell =  tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! CustomTableViewCell
        let currentProducts = currentProducts[indexPath.row]

        cell.productNameLabel.text = currentProducts.model
        cell.priceLabel.text = "\(currentProducts.price) $"
        cell.productImageView.image = UIImage(named: currentProducts.image)

            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }

   

}
