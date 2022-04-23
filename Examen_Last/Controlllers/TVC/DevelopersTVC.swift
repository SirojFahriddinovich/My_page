//
//  DevelopersTVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class DevelopersTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "DevelopersCVC", bundle: nil), forCellWithReuseIdentifier: "DevelopersCVC")
        }
    }
    
    var developer = [DeveloperDM]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func updateCell(dev : [DeveloperDM]) {
        self.developer = dev
    }
    
}


extension DevelopersTVC : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        developer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DevelopersCVC", for: indexPath) as! DevelopersCVC
        cell.updateCell(dev: self.developer[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 130)
    }
}
