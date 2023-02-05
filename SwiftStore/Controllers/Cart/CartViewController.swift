//
//  CartViewController.swift
//  SwiftStore
//
//  Created by Aleksey Efimov on 31.01.23.
//

import UIKit


class CartViewController: UITableViewController {
    
    
    @IBOutlet var firstLabel: UILabel!
    
    struct Product {
        let category: String
        let model: String
        let chip: String
        let color: String
        let display: String
        let memory: String
        let storage: String
        let onSale: Bool
        let isBestseller: Bool
        let isRecommended: Bool
        let price: Int
        let discountAmount: Int
        let priceDiscount: Int
        
        var image: String {
            "\(model) \(color)".trimmingCharacters(in: .whitespaces)
        }
    }
    
    var nowInCart: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowInCart = getProducts2()
        
        if nowInCart.count<1 {
            firstLabel.isHidden = false
            tableView.isHidden = true
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowInCart.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCartTableViewCell
        let product = nowInCart[indexPath.row]
        
        cell.productImage.image = UIImage(named: product.image)
        cell.nameLable.text = product.model
        cell.priceLable.text = String(product.price)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    

    

     // MARK: - Navigation
 

    func getProducts2() -> [Product] {
        [
            Product(
                category: "Mac",
                model: "MacBook Air M1",
                chip: "M1",
                color: "Silver",
                display: "13.3",
                memory: "16GB",
                storage: "512GB",
                onSale: true,
                isBestseller: true,
                isRecommended: true,
                price: 1399,
                discountAmount: 10,
                priceDiscount: 1099
            ),
            Product(
                category: "Mac",
                model: "MacBook Air M1",
                chip: "M1",
                color: "Space Gray",
                display: "13.3",
                memory: "8GB",
                storage: "256GB",
                onSale: false,
                isBestseller: true,
                isRecommended: true,
                price: 999,
                discountAmount: 10,
                priceDiscount: 899
            ),
            Product(
                category: "Mac",
                model: "MacBook Pro 14",
                chip: "M2 Pro",
                color: "Space Gray",
                display: "14.2",
                memory: "16GB",
                storage: "512GB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 1999,
                discountAmount: 10,
                priceDiscount: 1890
            ),
            Product(
                category: "Mac",
                model: "MacBook Pro 14",
                chip: "M2 Max",
                color: "Silver",
                display: "14.2",
                memory: "32GB",
                storage: "1TB",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 3099,
                discountAmount: 10,
                priceDiscount: 3099
            ),
            Product(
                category: "Mac",
                model: "MacBook Pro 16",
                chip: "M2 Pro",
                color: "Space Gray",
                display: "16.2",
                memory: "16GB",
                storage: "512GB",
                onSale: true,
                isBestseller: true,
                isRecommended: false,
                price: 2499,
                discountAmount: 10,
                priceDiscount: 2299
            ),
            Product(
                category: "Mac",
                model: "MacBook Pro 16",
                chip: "M2 Max",
                color: "Silver",
                display: "16.2",
                memory: "64GB",
                storage: "2TB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 3499,
                discountAmount: 10,
                priceDiscount: 3499
            )]
    }
}
