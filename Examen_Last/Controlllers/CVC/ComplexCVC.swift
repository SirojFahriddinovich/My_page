//
//  ComplexCVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class ComplexCVC: UICollectionViewCell {

    @IBOutlet weak var houseImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var streetLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func updateCell(complex : ComplexDM) {
        if complex.price.count <= 8 && complex.price.count > 6 {
            self.priceLbl.text = "\(complex.price) сум / м²"
        } else if complex.price.count <= 7 {
            self.priceLbl.text = "согласованный"
        } else {
            self.priceLbl.text = "\(complex.price) сум"
        }
        self.titleLbl.text = complex.title
        self.houseImg.image = complex.image
        self.streetLbl.text = complex.status
    }
    
    
}
