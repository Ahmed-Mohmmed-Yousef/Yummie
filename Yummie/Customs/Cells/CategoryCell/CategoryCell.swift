//
//  CategoryCell.swift
//  Yummie
//
//  Created by Ahmed on 27/02/2022.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

    static let id = "CategoryCell"
    @IBOutlet weak var categoryImgView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImgView.kf.setImage(with: category.image?.asURL)
    }
}
