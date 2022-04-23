//
//  ComplexDM.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import Foundation
import UIKit

class ComplexDM {
    
    var image : UIImage
    var price : String
    var title : String
    var status : String
    
    init(image : UIImage, price :  String, title : String, status : String) {
        self.image = image
        self.price = price
        self.title = title
        self.status = status
    }
}
