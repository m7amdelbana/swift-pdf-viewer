//
//  UIButton+Extensions.swift
//  PDFViewerApp
//
//  Created by Mohamed Elbana on 11/10/19.
//  Copyright © 2019 Mohamed Elbana. All rights reserved.
//

import UIKit

extension UIButton {
    
    func btnDefault() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor(red: 152/255.0 , green: 107/255.0, blue: 72/255.0, alpha: 0.47).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }
    
    func btnSquare() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
    }
}

