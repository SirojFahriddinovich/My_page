//
//  NewsCVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class NewsCVC: UICollectionViewCell {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var newsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateCell(new : NewsDM) {
        self.titleLbl.text = new.title
        self.newsLbl.text = new.desc
    }
}
