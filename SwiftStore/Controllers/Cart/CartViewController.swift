//
//  CartViewController.swift
//  SwiftStore
//
//  Created by Aleksey Efimov on 31.01.23.
//

import UIKit


class CartViewController: UITableViewController {
    
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
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
