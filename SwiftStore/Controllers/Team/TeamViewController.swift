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

extension TeamViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return team.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamCollectionViewCell
        
        let currentDeveloper = team[indexPath.item]
        
        cell.devImage.image = UIImage(named: currentDeveloper.image)
        cell.nameLable.text = currentDeveloper.name
        cell.charpterLable.text = "Разделы: \(currentDeveloper.charpter)"
        cell.githubLinkLabel.text = currentDeveloper.githubLink
        
        cell.layer.cornerRadius = 15
        cell.devImage.layer.cornerRadius = 15
        
        return cell
    }
    
    
}

extension TeamViewController: UICollectionViewDelegateFlowLayout {
    


}
