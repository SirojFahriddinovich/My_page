//
//  NewsTVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class NewsTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "NewsCVC", bundle: nil), forCellWithReuseIdentifier: "NewsCVC")
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        }
    }
    
    var news = [NewsDM]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func updateCell(news : [NewsDM]) {
        self.news = news
        collectionView.reloadData()
    }
    
}


extension NewsTVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVC", for: indexPath) as! NewsCVC
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 120)
    }
    
    
    
}
