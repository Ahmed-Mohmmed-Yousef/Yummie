//
//  UIView+Ext.swift
//  Yummie
//
//  Created by Ahmed on 26/02/2022.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
