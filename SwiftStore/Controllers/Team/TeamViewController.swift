//
//  TeamViewController.swift
//  SwiftStore
//
//  Created by Aleksey Efimov on 31.01.23.
//


import UIKit

class TeamViewController: UIViewController {
    
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
        
        let currentDeveloper = team[indexPath.item]
        
        cell.devImage.image = UIImage(named: currentDeveloper.image)
        cell.devImage.widthAnchor.constraint(
            equalToConstant: cell.frame.width - 17).isActive = true
        
        cell.nameLabel.text = currentDeveloper.name
        cell.charpterLabel.text = "Разделы: \(currentDeveloper.charpter)"
        cell.githubLinkLabel.text = currentDeveloper.githubLink
        
        cell.layer.cornerRadius = 15
        cell.devImage.layer.cornerRadius = 15
        
        return cell
    }
}

//MARK: - CollectionViewDelegateFlowLayout

extension TeamViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: teamCollectionView.frame.width/2 - 21 ,
                      height: teamCollectionView.frame.height/2 - 31)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
