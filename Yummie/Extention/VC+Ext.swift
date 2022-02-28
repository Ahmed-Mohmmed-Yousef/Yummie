//
//  VC+Ext.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var identifire: String {
        return String(describing: self)
    }
    
    static func instatiate() -> Self {
        let storyboard = UIStoryboard(name: identifire, bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: identifire) as! Self
        return vc
    }
    
    static func instatiate(storyboard name: String) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: identifire) as! Self
        return vc
    }
}
