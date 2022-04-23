//
//  CellTypeTVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class CellTypeTVC: UITableViewCell {
 
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet  {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "CellTypeCVC", bundle: nil), forCellWithReuseIdentifier: "CellTypeCVC")
        }
    }
    
    var cellType = [CellTypeDM]()
    
    var images = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateCell(type : [CellTypeDM], images : [String]) {
        cellType = type
        self.images = images
        collectionView.reloadData()
    }
    
}


extension CellTypeTVC : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.cellType.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTypeCVC", for: indexPath) as! CellTypeCVC
            cell.imgView.image = UIImage(systemName: "plus.circle")
            cell.titleLbl.text = "Разместить объявление"
            cell.seoLbl.text = "Продать или сдать"
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTypeCVC", for: indexPath) as! CellTypeCVC
            cell.updateCell(type: self.cellType[indexPath.row-1], image: self.images[indexPath.row-1])
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}

