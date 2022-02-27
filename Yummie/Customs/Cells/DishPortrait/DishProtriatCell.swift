//
//  DishProtriatCell.swift
//  Yummie
//
//  Created by Ahmed on 27/02/2022.
//

import UIKit
import Kingfisher

class DishProtriatCell: UICollectionViewCell {

    static let id = "DishProtriatCell"
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(_ dish: Dish) {
        titleLbl.text = dish.name
        dishImgView.kf.setImage(with: dish.image?.asURL)
        caloriesLbl.text = dish.fprmattedCalories + " cals"
        descriptionLbl.text = dish.description
    }
}
