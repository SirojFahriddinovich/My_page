//
//  CellTypeCVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class CellTypeCVC: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.shadowColor = #colorLiteral(red: 0.9176470637, green: 0.9176470637, blue: 0.9176470637, alpha: 0.8197692467)
            containerView.layer.shadowOpacity = 0.5
            containerView.layer.shadowOffset = CGSize.zero
            containerView.layer.shadowRadius = 5
        }
    }
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var seoLbl: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func updateCell(type : CellTypeDM, image : String) {
        self.titleLbl.text = type.name
        self.seoLbl.text = type.seo
        self.imgView.image = UIImage(named: "\(image)")
    }
    
}
