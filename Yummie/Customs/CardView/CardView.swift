//
//  CardView.swift
//  Yummie
//
//  Created by Ahmed on 27/02/2022.
//

import Foundation
import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.1
        cornerRadius = 10
        
    }
}
