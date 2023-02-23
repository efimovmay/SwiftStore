//
//  TeamViewController.swift
//  SwiftStore
//
//  Created by Aleksey Efimov on 31.01.23.
//


import UIKit

final class TeamViewController: UIViewController {
    
    let team = Developer.getTeam()

    @IBOutlet var teamCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamCollectionView.delegate = self
        teamCollectionView.dataSource = self
    }
}
//MARK: - CollectionViewDelegateFlowLayout, CollectionViewDataSource

extension TeamViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return team.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamCollectionViewCell
        
        cell.settings(currentDeveloper: team[indexPath.item])
        return cell
    }
}

//MARK: - CollectionViewDelegateFlowLayout

extension TeamViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberCellInRow: CGFloat = 2
        return CGSize(width: teamCollectionView.frame.width/numberCellInRow - 21 ,
                      height: teamCollectionView.frame.height/numberCellInRow - 31)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
