//
//  ComplexesTVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class ComplexesTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "ComplexCVC", bundle: nil), forCellWithReuseIdentifier: "ComplexCVC")
        }
    }
    
    var complexes = [ComplexDM]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func updateCell(complex : [ComplexDM]) {
        self.complexes = complex
        collectionView.reloadData()
    }
    
}


extension ComplexesTVC : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        complexes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComplexCVC", for: indexPath) as! ComplexCVC
        cell.updateCell(complex: self.complexes[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.width - 60
        return CGSize(width: width, height: 340)
    }
    
}


