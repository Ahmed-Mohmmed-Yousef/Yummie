//
//  DetailsVC.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import UIKit
import Kingfisher
import ProgressHUD

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
        guard let name = nameTF.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name!")
            return
        }
        ProgressHUD.show("Placing order...")
        NetworkService.shared.placeOredr(dishId: dish.id ?? "", name: name) { result in
            switch result {
                
            case .success(_):
                ProgressHUD.showSucceed("Your order has been sent. 👨‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
}
