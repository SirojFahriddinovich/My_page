//
//  DevelopersCVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class DevelopersCVC: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderColor = #colorLiteral(red: 0.965441525, green: 0.9748966098, blue: 0.9750942588, alpha: 1)
            containerView.layer.borderWidth = 2
            containerView.layer.cornerRadius = 16
        }
    }
    
    let images : [UIImage] = [UIImage(named: "golden1")!,UIImage(named: "golden2")!]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgV.image = images.randomElement()
    }
    
    func updateCell(dev : DeveloperDM) {
        if dev.desc.isEmpty {
            self.titleLbl.text = "неопределенный"
        } else {
            self.titleLbl.text = dev.desc
        }
    }

}
