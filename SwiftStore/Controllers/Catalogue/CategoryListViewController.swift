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

    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        title = currentTitle
        
        // Assign notification observer: if notification occurs (has been "posted") center calls designated function
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateView),
            name: Notification.Name("updateView"),
            object: nil
        )
    }
    
    // Set custom buttons appearance in accordance with a cart
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateVisibleRows()
    }
    
    //Testing

//    override func viewDidDisappear(_ animated: Bool) {
//        Cart.printOut(from: "CATEGORY")
//    }
}

extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! CustomTableViewCell
        
        let currentProduct = currentProducts[indexPath.row]
      
        cell.buyButton.delegate = self
        cell.product = currentProduct
        
        cell.productNameLabel.text = currentProduct.title
        cell.priceLabel.text = "$\(currentProduct.price)"
        cell.productImageView.image = UIImage(named: currentProduct.image)

        cell.buyButton.initState = Cart.contains(currentProduct) ? false : true

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

extension CategoryListViewController: CustomButtonDelegate {
    
    func putIntoCart(_ product: Product) {
        Cart.append(product)
    }
    
    func removeFromCart(_ product: Product) {
        Cart.remove(product)
    }
    
    func updateCartBage() {
        tabBarController?.tabBar.items?[2].badgeValue = Cart.isEmpty ? nil : String(Cart.count)
    }
}
    
// Update visible rows custom buttons in accordance with cart content
extension CategoryListViewController {
    
    // Update self view after presented controller has been dismissed
    @objc private func updateView() {
        updateCartBage()
        updateVisibleRows()
    }
        
    private func updateVisibleRows() {
        let rowsForUpdate = tableView.visibleCells
        let rowIndecies = rowsForUpdate.map  { tableView.indexPath(for: $0)! }
        tableView.reloadRows(at: rowIndecies, with: .none)
    }
}
