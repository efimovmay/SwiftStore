//
//  CartViewController.swift
//  SwiftStore
//
//  Created by Aleksey Efimov on 31.01.23.
//

import UIKit


class CartViewController: UIViewController {
    

    @IBOutlet var cartTableView: UITableView!
    @IBOutlet var buttonView: UIView!
    @IBOutlet var emptyCartStack: UIStackView!
    
    var nowInCart = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //       nowInCart = Product.getRandomProducts(count: 13)
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
    }
    override func viewWillLayoutSubviews() {
        hideTable()
    }
    
}


//MARK: - UI settings

extension CartViewController {
    
    func hideTable() {
        if nowInCart.isEmpty {
            cartTableView.isHidden = true
            buttonView.isHidden = true
            emptyCartStack.isHidden = false
        } else {
            cartTableView.isHidden = false
            buttonView.isHidden = false
            emptyCartStack.isHidden = true
        }
    }
}


//MARK: - UITableView delegate

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowInCart.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCartTableViewCell
        let product = nowInCart[indexPath.row]
        
        cell.productImage.image = UIImage(named: product.image)
        cell.nameLable.text = product.model
        cell.priceLable.text = String(product.price) + " RUB"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
