//
//  CategoryListViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import UIKit



class CategoryListViewController: UIViewController {

    // MARK: IB Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Public Properties
    var currentProducts: [Product] = []
    var currentTitle: String!
    var cart: [Product]?

    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        title = currentTitle
    }
}

extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell =  tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! CustomTableViewCell
        
        let currentProduct = currentProducts[indexPath.row]
      
        cell.product = currentProduct
        cell.productNameLabel.text = currentProduct.title
        cell.priceLabel.text = "$\(currentProduct.price)"
        cell.productImageView.image = UIImage(named: currentProduct.image)
        
        cell.selectionStyle = .none
        
        cell.buyButton.delegate = self
      
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
        productInfoVC.cart = cart
    }
}

extension CategoryListViewController: CustomButtonDelegate {
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
        tabBarItem.badgeValue = Cart.shared.cart.isEmpty ? nil : String(Cart.shared.cart.count)
        }
    }
    


