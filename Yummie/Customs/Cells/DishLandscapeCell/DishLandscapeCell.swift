//
//  DishLandscapeCell.swift
//  Yummie
//
//  Created by Ahmed on 27/02/2022.
//

import UIKit
import Kingfisher

class DishLandscapeCell: UICollectionViewCell {

    static let id = "DishLandscapeCell"
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(_ dish: Dish) {
        dishImgView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.fprmattedCalories + " cals"
    }
}
