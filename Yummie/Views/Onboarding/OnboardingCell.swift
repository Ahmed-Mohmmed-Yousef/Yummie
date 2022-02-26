//
//  OnboardingCell.swift
//  Yummie
//
//  Created by Ahmed on 26/02/2022.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    static let id = "OnboardingCell"
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideDescroption: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitle.text = slide.title
        slideDescroption.text = slide.description
    }
}
