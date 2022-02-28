//
//  DishListCell.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import UIKit
import Kingfisher

class DishListCell: UITableViewCell {

    static let id = "DishListCell"
    
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        titleLbl.textColor = selected ? .systemRed : .label
    }
    
    func setup(_ dish: Dish) {
        dishImgView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(_ order: Order) {
        dishImgView.kf.setImage(with: order.dish?.image?.asURL)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
}
