//
//  HomeViewController.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 1.02.23.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var sellsCollectionView: UICollectionView!
    @IBOutlet var bestCollectionView: UICollectionView!
    @IBOutlet var recommendCollectionView: UICollectionView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup views
    private func setupUI() {
        setupTabBar()
        setupCollectionViews()
    }
    
    private func setupTabBar() {
        tabBarItem.image = UIImage(systemName: "house.fill")
        tabBarItem.title = "Главная"
        // First tab selection on lounch
        tabBarController?.selectedViewController = tabBarController?.viewControllers?.first
    }
    

//    private func registerTableViewCells() {
//        let cell = UINib(nibName: "CustomCell", bundle: nil)
//        tableView.register(cell, forCellReuseIdentifier: "customCell")
//    }
}

// MARK: - UICollectionView Delegate
extension HomeViewController: UICollectionViewDelegate {
    
    private func setupCollectionViews() {
        sellsCollectionView.delegate = self
        bestCollectionView.delegate = self
        recommendCollectionView.delegate = self
    }
}
