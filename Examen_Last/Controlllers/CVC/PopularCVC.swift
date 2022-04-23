//
//  PopularCVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class PopularCVC: UICollectionViewCell {

    @IBOutlet weak var houseImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var streetLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateCell(popular : PopularDM) {
        self.houseImg.image = popular.image
        self.streetLbl.text = popular.status
        self.priceLbl.text = popular.price
        self.titleLbl.text = popular.title
    }

}
