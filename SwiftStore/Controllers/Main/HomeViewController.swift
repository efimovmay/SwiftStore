//
//  HomeViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 1.02.23.
//

import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBarItem.image = UIImage(systemName: "house.fill")
        tabBarItem.title = "Главная"
        // First tab selection on lounch
        tabBarController?.selectedViewController = tabBarController?.viewControllers?.first
    }
}
