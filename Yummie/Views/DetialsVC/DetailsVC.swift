//
//  DetailsVC.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

    
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var calsLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupData()
    }

    private func setupData() {
        dishImgView.kf.setImage(with: dish.image?.asURL)
        titlelbl.text = dish.name
        calsLbl.text = dish.fprmattedCalories + " calories"
        descriptionLbl.text = dish?.description
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
    }
    
}
