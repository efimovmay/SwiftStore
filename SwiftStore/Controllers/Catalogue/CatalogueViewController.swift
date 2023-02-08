//
//  CatalogueViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit

class CatalogueViewController: UITableViewController {
    
    let categories = DataStore.shared.categories
    let allProducts = Product.getProducts()

    var cart: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200

    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalog", for: indexPath)
        let category = categories[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = category
        content.image = UIImage(named: category.lowercased())
        
        cell.contentConfiguration = content
        
        return cell
    }
    
//     MARK: UITableViewDelegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let catalogListVC = segue.destination as? CategoryListViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        switch categories[indexPath.row] {
        case "Mac":
            for mac in allProducts {
                if mac.category == "Mac" {
                    catalogListVC.currentProducts.append(mac)
                    catalogListVC.currentTitle = mac.category
                }
            }
        case "iPhone":
            for mac in allProducts {
                if mac.category == "iPhone" {
                    catalogListVC.currentProducts.append(mac)
                    catalogListVC.currentTitle = mac.category
                }
            }
        case "iPad":
            for mac in allProducts {
                if mac.category == "iPad" {
                    catalogListVC.currentProducts.append(mac)
                    catalogListVC.currentTitle = mac.category
                }
            }
        case "Watch":
            for mac in allProducts {
                if mac.category == "Watch" {
                    catalogListVC.currentProducts.append(mac)
                    catalogListVC.currentTitle = mac.category
                }
            }
        default:
            for mac in allProducts {
                if mac.category == "AirPods" {
                    catalogListVC.currentProducts.append(mac)
                    catalogListVC.currentTitle = mac.category
                }
            }
        }
    }
}
