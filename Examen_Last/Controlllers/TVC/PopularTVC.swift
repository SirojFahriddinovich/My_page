//
//  PopularTVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class PopularTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "PopularCVC", bundle: nil), forCellWithReuseIdentifier: "PopularCVC")
        }
    }
    
    var popularData = [PopularDM]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateCell(popular : [PopularDM]) {
        self.popularData = popular
        collectionView.reloadData()
    }
    
}


extension PopularTVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        popularData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCVC", for: indexPath) as! PopularCVC
        cell.updateCell(popular: self.popularData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.popularData.count == 1 {
            let vc = MainVC.init(nibName: "MainVC", bundle: nil)
            let width = vc.view.frame.width
            return CGSize(width: width-20, height: 340)
        } else {
            let width = self.collectionView.frame.width - 60
            return CGSize(width: width, height: 340)
        }
     
    }
}
