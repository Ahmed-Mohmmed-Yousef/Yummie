//
//  ListDishesVC.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import UIKit
import ProgressHUD

class ListDishesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var populars: [Dish] = []
    
    var category: DishCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = category.name
        registerCell()
        fetchData()
    }
    
    private func fetchData() {
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "0") { [weak self] result in
            switch result {
                
            case .success(let dishes):
                self?.populars = dishes
                self?.tableView.reloadData()
                ProgressHUD.showSucceed()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    private func registerCell() {
        tableView.register(UINib(nibName: DishListCell.id, bundle: .main), forCellReuseIdentifier: DishListCell.id)
    }
}

extension ListDishesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return populars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListCell.id, for: indexPath) as! DishListCell
        cell.setup(populars[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = DetailsVC.instatiate()
        controller.dish = populars[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
